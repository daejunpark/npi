var fs = require('fs');

function main() {
    if (process.argv.length < 4) return console.log("no inputs");
    var bpl_file  = process.argv[2];
    var pred_file = process.argv[3];
    fs.readFile( bpl_file, 'utf8', function(err, bpl) {
        if (err) return console.log(err);
        fs.readFile( pred_file, 'utf8', function(err, pred) {
            if (err) return console.log(err);
            pred = pred.toString().split("INV");
            bpl = bpl.replace(/\/\/ INV:BEGIN[\w\W]*\/\/ INV:END/m, pred[0]);
            console.log(pred[1]);
            console.log(bpl);
        });
    });
}

main();
