var fs = require('fs');

var ptrs = [];
var ints = [];
var old;
var lst, lst2;
var typ;
var digits = 4;
var inv = 'invariant';

var patterns_heap = [
    //
    ['list', 0],
  //['lseg', 0, 1],
    //
    ['implies', ['and', ['list', 0   ], ['list', 1]], ['disjoint_o', ['reach', 0   ], ['reach', 1]]],
  //['implies', ['and', ['lseg', 0, 1], ['list', 1]], ['disjoint_o', ['reach', 0, 1], ['reach', 1]]],
  //['implies', ['and', ['lseg', 0, 1], ['list', 2]], ['disjoint_o', ['reach', 0, 1], ['reach', 2]]],
    // 
    ['implies', ['list', 1],    ['disjoint_o', ['singleton_o', 0], ['reach', 1   ]]],
  //['implies', ['lseg', 1, 2], ['disjoint_o', ['singleton_o', 0], ['reach', 1, 2]]],
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
    ['implies', ['non_null', 0], ['non_null', ['prev', 0]]],
    ['implies', ['non_null', 0], ['is_null',  ['prev', 0]]],
    ['implies', ['non_null', 0], ['eq', ['prev', 0], 1]],
];

var patterns_data = [
];

function ts(t,p,i) {
    if (typeof t === 'number') {
        if (t >= 0) {
            return '$phys_ptr_cast(' + p[t] + ',^' + typ + ')';
        } else {
            return i[(-1 * t) - 1];
        }
    }
    switch(t[0]) {
        case 'list':
            return 'F#' + lst +      '($s,' + ts(t[1],p,i) +                    ')';
        case 'lseg':
            return 'F#' + lst + '_lseg($s,' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
        //
        case 'reach':
            if (t.length > 2) {
                return 'F#' + lst + '_lseg_reach($s,' + ts(t[1],p,i) + ',' + ts(t[2],p,i) + ')';
            } else {
                return 'F#' + lst +      '_reach($s,' + ts(t[1],p,i) +                    ')';
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
            return '$rd_phys_ptr($s,' + typ + '.next,' + ts(t[1],p,i) + ',^' + typ + ')';
        case 'prev':
            return '$rd_phys_ptr($s,' + typ + '.prev,' + ts(t[1],p,i) + ',^' + typ + ')';
        case 'key':
            return '$rd_inv($s,'      + typ + '.key,'  + ts(t[1],p,i) +              ')';
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
        case 'lt':
            return '('  + ts(t[1],p,i) + ' < ' + ts(t[2],p,i) + ')';
        case 'le':
            return '('  + ts(t[1],p,i) + ' <= ' + ts(t[2],p,i) + ')';
        //
        case 'and':
            return '(' + ts(t[1],p,i) + ' && ' + ts(t[2],p,i) + ')';
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
    var i;
    var curr_ptrs_permutation;
    var cnt = 0;
    for (i = 0; i < patterns_heap.length; i++) {
        // console.log(patterns_heap[i]);
        if (numptrs(patterns_heap[i]) <= ptrs.length) {
            curr_ptrs_permutation = ptrs_permutations[numptrs(patterns_heap[i])];
            for (j = 0; j < curr_ptrs_permutation.length; j++) {
                console.log(inv + ' b' + pad(cnt++,digits) + ' ==> (' + ts(patterns_heap[i], curr_ptrs_permutation[j], []) + ');');
            }
        }
    }
    if (ints.length > 0) {
    for (i = 0; i < patterns_data.length; i++) {
        // console.log(patterns_data[i]);
        if (numptrs(patterns_data[i]) <= ptrs.length && numints(patterns_data[i]) <= ints.length) {
            curr_ptrs_permutation = ptrs_permutations[numptrs(patterns_data[i])];
            curr_ints_permutation = ints_permutations[numints(patterns_data[i])];
            for (j = 0; j < curr_ptrs_permutation.length; j++) {
                for (k = 0; k < curr_ints_permutation.length; k++) {
                    console.log(inv + ' b' + pad(cnt++,digits) + ' ==> (' + ts(patterns_data[i], curr_ptrs_permutation[j], curr_ints_permutation[k]) + ');');
                }
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
    if (process.argv.length < 3) return console.log('no inputs');
    if (process.argv.length > 3) { inv = process.argv[3]; }
    var bpl_file = process.argv[2];
    var bpl = fs.readFileSync(bpl_file, 'utf8').toString().split('\n');
    var pat, res, i;
    for (i = 0; i < bpl.length; i++) {
        pat = new RegExp('INV:PTR:\\s*(.*)\\s*$');
        res = pat.exec(bpl[i]);
        if (res !== null) {
            res[1].toString().split(';').forEach(function(x) {
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
        pat = new RegExp('INV:OLD:\\s*(.*)\\s*$');
        res = pat.exec(bpl[i]);
        if (res !== null) {
            old = res[1].trim();
        }
    }
    switch(lst) {
        case 'sll':
            typ = 'q_node';
            break;
        case 'dll':
            typ = 'mem_reg';
            patterns_data = [];
            patterns_heap = patterns_heap.concat(patterns_heap_dll); 
            break;
        case 'slave_dll':
            typ = 'slave_item';
            patterns_data = [];
            break;
        default:
            throw 'unknown list type: ' + lst;
            break;
    }
    // console.log(ptrs);
    // console.log(ints);
    // console.log(lst);
    // console.log(typ);
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
