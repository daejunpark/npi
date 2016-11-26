var fs = require('fs');

var ptrs = [];
var ints = [];
var old = 'loopState#0';
var lst, lst2, lst3;
var node;
var digits = 4;
var phase;

var patterns_heap = [
    //
    ['list', 0],
    ['lseg', 0, 1],
    //
  //['implies', ['and', ['list', 0   ], ['list', 1]], ['disjoint_o', ['reach', 0   ], ['reach', 1]]],
  //['implies', ['and', ['lseg', 0, 1], ['list', 1]], ['disjoint_o', ['reach', 0, 1], ['reach', 1]]],
  //['implies', ['and', ['lseg', 0, 1], ['list', 2]], ['disjoint_o', ['reach', 0, 1], ['reach', 2]]],
  //['implies', ['list', 1],    ['disjoint_o', ['singleton_o', 0], ['reach', 1   ]]],
  //['implies', ['lseg', 1, 2], ['disjoint_o', ['singleton_o', 0], ['reach', 1, 2]]],
    //
    ['disjoint_o', ['reach', 0   ], ['reach', 1]],
    ['disjoint_o', ['reach', 0, 1], ['reach', 1]],
    ['disjoint_o', ['reach', 0, 1], ['reach', 2]],
    ['disjoint_o', ['singleton_o', 0], ['reach', 1   ]],
    ['disjoint_o', ['singleton_o', 0], ['reach', 1, 2]],
    //
    ['non_null', 0],
    ['is_null',  0],
    ['eq', 0, 1],
    //
    ['implies', ['non_null', 0], ['non_null', ['next', 0]]],
    ['implies', ['non_null', 0], ['is_null',  ['next', 0]]],
    ['implies', ['non_null', 0], ['eq', ['next', 0], 1]],
];

var patterns_heap_dll = [
];

var patterns_heap_multi = [
    ['list', 0],
    ['list3', 0],
    //
    ['disjoint_o', ['reach', 0], ['reach3', 1]],
];

var patterns_data = [
    ['not', ['in_i', -1, ['keys',  0   ]]],
    ['not', ['in_i', -1, ['keys',  0, 1]]],
            ['in_i', -1, ['keys',  0   ]],
            ['in_i', -1, ['keys',  0, 1]],
    //
    ['eq_s', ['keys', 0], ['keys', 1   ]],
    ['eq_s', ['keys', 0], ['keys', 1, 2]],
    ['eq_s', ['keys', 0, 1], ['keys', 2, 3]],
    ['eq_s', ['keys', 0],     ['union_i', ['keys', 1], ['keys', 2]]],
    ['eq_s', ['keys_old', 0], ['union_i', ['keys', 0], ['keys', 1]]],
    ['eq_s', ['keys_old', 0], ['union_i', ['keys', 2], ['keys', 1]]],
    ['eq_s', ['keys', 0], ['union_i', ['keys_old', 0], ['keys', 1]]],
    ['eq_s', ['keys', 2], ['union_i', ['keys_old', 0], ['keys', 1]]],
    //
    ['lt_int_max', -1],
    ['lt_uint_max', -1],
    ['ge_zero', -1],
    ['implies', ['non_null', 0],['lt', ['key', 0], -1]],
    ['implies', ['and', ['non_null', 0], ['non_null', 1]] ,['le', ['key', 0], ['key', 1]]],
    ['implies', ['and', ['non_null', 0], ['non_null', 1]] ,['eq', ['key', 0], ['key', 1]]],
];

var patterns_data_length = [
    ['eq', ['len', 0   ], -1],
    ['eq', ['len', 0, 1], -1],
    ['eq', ['len', 0   ], ['minus', -1, -2]],
    ['eq', ['len', 0, 1], ['minus', -1, -2]],
    ['eq', ['minus', ['len', 0], ['len', 1]], -1],
    ['eq', ['minus', ['len', 0], ['len', 1]], ['minus', -1, -2]],
];

var patterns_data_sorted = [
    ['implies', ['and', ['list', 0   ], ['non_null', 0]], ['le', ['max', 0   ], -1]],
    ['implies', ['and', ['lseg', 0, 1], ['neq', 0, 1]  ], ['le', ['max', 0, 1], -1]],
    //
    ['implies', ['and', ['list', 0   ], ['non_null', 0]], ['le',                -1, ['min', 0   ]]],
    ['implies', ['and', ['lseg', 0, 1], ['neq', 0, 1]  ], ['le',                -1, ['min', 0, 1]]],
    //
    ['implies', ['and', ['list', 0   ], ['non_null', 0], ['non_null', 1]], ['le', ['max', 0   ], ['key', 1]]],
    ['implies', ['and', ['lseg', 0, 1], ['neq', 0, 1],   ['non_null', 1]], ['le', ['max', 0, 1], ['key', 1]]],
    ['implies', ['and', ['lseg', 0, 1], ['neq', 0, 1],   ['non_null', 2]], ['le', ['max', 0, 1], ['key', 2]]],
    //
    ['implies', ['and', ['list', 0   ], ['non_null', 0], ['non_null', 1]], ['le',                ['key', 1], ['min', 0   ]]],
    ['implies', ['and', ['lseg', 0, 1], ['neq', 0, 1],   ['non_null', 1]], ['le',                ['key', 1], ['min', 0, 1]]],
    ['implies', ['and', ['lseg', 0, 1], ['neq', 0, 1],   ['non_null', 2]], ['le',                ['key', 2], ['min', 0, 1]]],
    //
    /*
    ['le_i', ['keys', 0   ], ['singleton_i', -1        ]], ['le_i', ['singleton_i', -1        ], ['keys', 0   ]],
    ['le_i', ['keys', 0, 1], ['singleton_i', -1        ]], ['le_i', ['singleton_i', -1        ], ['keys', 0, 1]],
    //
    ['implies', ['non_null', 0],['le_i', ['keys', 1   ], ['singleton_i', ['key', 0]]], ['le_i', ['singleton_i', ['key', 0]], ['keys', 0   ]]],
    ['implies', ['non_null', 0],['le_i', ['keys', 1, 0], ['singleton_i', ['key', 0]]], ['le_i', ['singleton_i', ['key', 0]], ['keys', 0, 1]]],
    ['implies', ['non_null', 0],['le_i', ['keys', 1, 2], ['singleton_i', ['key', 0]]], ['le_i', ['singleton_i', ['key', 0]], ['keys', 1, 2]]],
    */
];

/*
var patterns_heap_two_pointers = [
    ['implies', ['is_null', 0], ['eq', 1, 2]],
];

var patterns_data_remove_all = [
    ['implies', ['not', ['in_i', -1, ['keys_old',  0]]], ['eq_s', ['keys', 1], ['keys_old', 0]]],
];
*/

function ts(t,p,i) {
    if (typeof t === 'number') {
        if (t >= 0) {
            return '$phys_ptr_cast(' + p[t] + ',^' + node +'_node)';
        } else {
            return i[(-1 * t) - 1];
        }
    }
    switch(t[0]) {
        case 'list':
            return 'F#' + lst +      '($s,' + ts(t[1],p,i) +                    ')';
        case 'list3':
            return 'F#' + lst3+      '($s,' + ts(t[1],p,i) +                    ')';
        case 'lseg':
            return 'F#' + lst + '_lseg($s,' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        //
        case 'reach':
            if (t.length > 2) {
                return 'F#' + lst + '_lseg_reach($s,' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
            } else {
                return 'F#' + lst +      '_reach($s,' + ts(t[1],p,i) +                    ')';
            }
        case 'reach3':
            if (t.length > 2) {
                return 'F#' + lst3+ '_lseg_reach($s,' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
            } else {
                return 'F#' + lst3+      '_reach($s,' + ts(t[1],p,i) +                    ')';
            }
        case 'keys':
            if (t.length > 2) {
                return 'F#' + lst2 + '_lseg_keys($s,' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
            } else {
                return 'F#' + lst2 +      '_keys($s,' + ts(t[1],p,i) +                    ')';
            }
        case 'len':
            if (t.length > 2) {
                return 'F#' + lst2 + '_lseg_len_next($s,' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
            } else {
                return 'F#' + lst2 + '_list_len_next($s,' + ts(t[1],p,i) +                      ')';
            }
        case 'reach_old':
            if (t.length > 2) {
                return 'F#' + lst + '_lseg_reach(' + old + ',' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
            } else {
                return 'F#' + lst +      '_reach(' + old + ',' + ts(t[1],p,i) +                    ')';
            }
        case 'keys_old':
            if (t.length > 2) {
                return 'F#' + lst2 + '_lseg_keys(' + old + ',' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
            } else {
                return 'F#' + lst2 +      '_keys(' + old + ',' + ts(t[1],p,i) +                    ')';
            }
        case 'max':
            if (t.length > 2) {
                return 'F#' + lst2 + '_lseg_max_key($s,' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
            } else {
                return 'F#' + lst2 +      '_max_key($s,' + ts(t[1],p,i) +                      ')';
            }
        case 'min':
            if (t.length > 2) {
                return 'F#' + lst2 + '_lseg_min_key($s,' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
            } else {
                return 'F#' + lst2 +      '_min_key($s,' + ts(t[1],p,i) +                      ')';
            }
        //
        case 'singleton_o':
            return   '$oset_singleton(' + ts(t[1],p,i) + ')';
        case 'singleton_i':
            return '$intset_singleton(' + ts(t[1],p,i) + ')';
        case 'union_o':
            return   '$oset_union(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        case 'union_i':
            return '$intset_union(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        case 'in_o':
            return   '$oset_in(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        case 'in_i':
            return '$intset_in(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        case 'subset_o':
            return   '$oset_subset(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        case 'subset_i':
            return '$intset_subset(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        case 'disjoint_o':
            return   '$oset_disjoint(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        case 'disjoint_i':
            return '$intset_disjoint(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        case 'le_o':
            return   '$oset_le(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        case 'le_i':
            return '$intset_le(' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        //
        case 'is_null':
            return '$is_null('  + ts(t[1],p,i) + ')';
        case 'non_null':
            return '$non_null(' + ts(t[1],p,i) + ')';
        //
        case 'next':
            return '$rd_phys_ptr($s,' + node +'_node.next,' + ts(t[1],p,i) + ',^' + node +'_node)';
        case 'prev':
            return '$rd_phys_ptr($s,' + node +'_node.prev,' + ts(t[1],p,i) + ',^' + node +'_node)';
        case 'key':
            return '$rd_inv($s,' + node +'_node.key,'       + ts(t[1],p,i) +         ')';
        //
        case 'lt_int_max':
            return '('  + ts(t[1],p,i) + ' < ' + '2147483647' + ')';
        case 'lt_uint_max':
            return '('  + ts(t[1],p,i) + ' < ' + '4294967295' + ')';
        case 'ge_zero':
            return '('  + ts(t[1],p,i) + ' >= ' + '0' + ')';
        //
        case 'plus':
            return '(' + ts(t[1],p,i) + ' + ' + ts(t[2],p,i) + ')';
        case 'minus':
            return '(' + ts(t[1],p,i) + ' - ' + ts(t[2],p,i) + ')';
        //
        case 'not':
            return '(!(' + ts(t[1],p,i) + '))';
        case 'eq':
            return '(' + ts(t[1],p,i) + ' == ' + ts(t[2],p,i) + ')';
        case 'neq':
            return '(' + ts(t[1],p,i) + ' != ' + ts(t[2],p,i) + ')';
        //
        case 'eq_s':
            return '(' + ts(t[1],p,i) + ' == ' + ts(t[2],p,i) + ')';
        //
        case 'lt':
            return '('  + ts(t[1],p,i) + ' < ' + ts(t[2],p,i) + ')';
        case 'le':
            return '('  + ts(t[1],p,i) + ' <= ' + ts(t[2],p,i) + ')';
        //
        case 'and':
            if (t.length > 2) {
                str = '(' + ts(t[1],p,i);
                for (k = 2; k < t.length; k++) {
                    str += ' && ' + ts(t[k],p,i);
                }
                str += ')';
                return str;
            } else {
                throw 'illegal arguments: ' + t[0];
                break;
            }
        case 'implies':
            return '(' + ts(t[1],p,i) + ' ==> ' + ts(t[2],p,i) + ')';
        //
        default:
            throw 'unknown op: ' + t[0];
            break;
    }
}

function main() {
    function numptrs(t) {
        function findmax(t) {
            var i,
                max = 0;
            for (i = 0; i < t.length; i++) {
                if (typeof t[i] === 'number') {
                    max = Math.max(max, t[i]);
                } else if (typeof t[i] === 'object') {
                    max = Math.max(max, findmax(t[i]));
                }
            }
            return max;
        }
        return findmax(t) + 1;
    }
    function numints(t) {
        function findmin(t) {
            var i,
                min = 0;
            for (i = 0; i < t.length; i++) {
                if (typeof t[i] === 'number') {
                    min = Math.min(min, t[i]);
                } else if (typeof t[i] === 'object') {
                    min = Math.min(min, findmin(t[i]));
                }
            }
            return min;
        }
        return findmin(t) * -1;
    }
    init();
    var ptrs_permutations = permutations(ptrs);
    var ints_permutations = permutations(ints);
    var i,j,k;
    var curr_ptrs_permutation,curr_ints_permutation;
    var cnt = 0;
    for (i = 0; i < patterns_heap.length; i++) {
        // console.log(patterns_heap[i]);
        if (numptrs(patterns_heap[i]) <= ptrs.length) {
            curr_ptrs_permutation = ptrs_permutations[numptrs(patterns_heap[i])];
            for (j = 0; j < curr_ptrs_permutation.length; j++) {
                console.log('invariant b' + pad(cnt++,digits) + ' ==> (' + ts(patterns_heap[i], curr_ptrs_permutation[j], []) + ');');
            }
        }
    }
    for (i = 0; i < patterns_data.length; i++) {
        // console.log(patterns_data[i]);
        if (numptrs(patterns_data[i]) <= ptrs.length && numints(patterns_data[i]) <= ints.length) {
            curr_ptrs_permutation = ptrs_permutations[numptrs(patterns_data[i])];
            curr_ints_permutation = ints_permutations[numints(patterns_data[i])];
            for (j = 0; j < curr_ptrs_permutation.length; j++) {
                for (k = 0; k < curr_ints_permutation.length; k++) {
                    console.log('invariant b' + pad(cnt++,digits) + ' ==> (' + ts(patterns_data[i], curr_ptrs_permutation[j], curr_ints_permutation[k]) + ');');
                }
            }
        }
    }
    console.log('INV');
    for (i = 0; i < cnt; i++) {
        console.log('const {:existential true} b' + pad(i,digits) + ' : bool;');
    }
}

function init() {
    if (process.argv.length < 4) return console.log('no inputs');
    phase = process.argv[3];
    var bpl_file = process.argv[2];
    var bpl = fs.readFileSync(bpl_file, 'utf8').toString().split('\n');
    var pat, res, i;
    for (i = 0; i < bpl.length; i++) {
        pat = new RegExp('INV:PTR:\\s*(.*)\\s*$');
        res = pat.exec(bpl[i]);
        if (res !== null) {
            res[1].toString().split(',').forEach(function(x) {
                if (x.trim() !== '') {
                    ptrs.push(x.trim());
                }
            });
        }
        pat = new RegExp('INV:INT:\\s*(.*)\\s*$');
        res = pat.exec(bpl[i]);
        if (res !== null) {
            res[1].toString().split(',').forEach(function(x) {
                if (x.trim() !== '') {
                    ints.push(x.trim());
                }
            });
        }
        pat = new RegExp('INV:LST:\\s*(.*)\\s*$');
        res = pat.exec(bpl[i]);
        if (res !== null) {
            lst = res[1].trim();
            lst2 = lst;
        }
        pat = new RegExp('INV:LST3:\\s*(.*)\\s*$');
        res = pat.exec(bpl[i]);
        if (res !== null) {
            lst3 = res[1].trim();
            patterns_heap = patterns_heap_multi;
        }
        pat = new RegExp('INV:OLD:\\s*(.*)\\s*$');
        res = pat.exec(bpl[i]);
        if (res !== null) {
            old = res[1].trim();
        }
        pat = new RegExp('INV:PAT:HEAP:\\s*(.*)\\s*$');
        res = pat.exec(bpl[i]);
        if (res !== null) {
            patterns_heap = patterns_heap.concat(eval(res[1].trim()));
        }
        pat = new RegExp('INV:PAT:DATA:\\s*(.*)\\s*$');
        res = pat.exec(bpl[i]);
        if (res !== null) {
            patterns_data = patterns_data.concat(eval(res[1].trim()));
        }
    }
    switch(lst) {
        case 'sll':
            node = 's';
            break;
        case 'dll':
            node = 'd';
            patterns_data = [];
            patterns_heap = patterns_heap.concat(patterns_heap_dll);
            break;
        case 'dll2':
            lst = 'dll';
            lst2 = 'dll';
            node = 'd';
            patterns_heap = patterns_heap.concat(patterns_heap_dll);
            break;
        case 'srtl':
            node = 's';
            patterns_data = patterns_data.concat(patterns_data_sorted);
            lst2 = 'sll';
            break;
        default:
            throw 'unknown list type: ' + lst;
            break;
    }
    switch(phase) {
        case '1':
            patterns_data = [];
            break;
        case '2':
            break;
        case '3':
            patterns_data = patterns_data.concat(patterns_data_length);
            break;
        default:
            throw 'unknown phase: ' + phase;
            break;
    }
    // console.log(ptrs);
    // console.log(ints);
    // console.log(lst);
    // console.log(old);
}

function pad(num, length) {
    var r = '' + num;
    while (r.length < length) {
        r = '0' + r;
    }
    return r;
}

function permutations(list) {
    var i;
    var res = []; for (i = 0; i <= list.length; i++) { res.push([]); }
    var go = function go(curr, rest) {
        var i;
        res[curr.length].push(curr);
        if (rest.length == 0) return;
        for (i = 0; i < rest.length; i++) {
            go(curr.concat(rest[i]), rest.slice(0,i).concat(rest.slice(i + 1)));
        }
    };
    go([],list);
    return res;
}

main();
