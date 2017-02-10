var fs = require('fs');

function main() {
    if (process.argv.length < 4) return console.log("no inputs");
    var bpl_file  = process.argv[2];
    var pred_file = process.argv[3];
    fs.readFile(bpl_file, 'utf8', function(err, bpl) {
        if (err) return console.log(err);
        fs.readFile(pred_file, 'utf8', function(err, pred) {
            if (err) return console.log(err);
            pred = pred.toString().split("INV");
            bpl = bpl.replace(/\/\/ INV:PTR:/, pred[2] + '\n// INV:PTR:');
            bpl = bpl.replace(/\/\/ INV:LOOPHEAD/, pred[0]);
            bpl = bpl.replace(/\/\/ INV:LOOPTAIL/, pred[0]);
            bpl = bpl.replace(/\/\/ INV:BEGIN[\w\W]*\/\/ INV:END/m, pred[1] + pred[3]);
            console.log(pred[4]);
            console.log(bpl);
        });
    });
}

main();
