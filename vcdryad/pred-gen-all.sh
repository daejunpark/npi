cat list-list-1.txt            | while read -r j; do i=$j.bpl.anon; node pred-gen-list.js $i 1         >$i.pred; node pred-inject.js $i $i.pred >$i.pred.bpl; done
cat list-list-2.txt            | while read -r j; do i=$j.bpl.anon; node pred-gen-list.js $i 2         >$i.pred; node pred-inject.js $i $i.pred >$i.pred.bpl; done
cat list-list-3.txt            | while read -r j; do i=$j.bpl.anon; node pred-gen-list.js $i 3         >$i.pred; node pred-inject.js $i $i.pred >$i.pred.bpl; done

cat list-tree.txt              | while read -r j; do i=$j.bpl.anon; node pred-gen-tree.js $i           >$i.pred; node pred-inject.js $i $i.pred >$i.pred.bpl; done

cat list-os-expressos-post.txt | while read -r j; do i=$j.bpl.anon; node pred-gen-os.js   $i 'ensures' >$i.pred; node pred-inject.js $i $i.pred >$i.pred.bpl; done
cat list-os-expressos-loop.txt | while read -r j; do i=$j.bpl.anon; node pred-gen-os.js   $i           >$i.pred; node pred-inject.js $i $i.pred >$i.pred.bpl; done
cat list-os-openbsd.txt        | while read -r j; do i=$j.bpl.anon; node pred-gen-os.js   $i 'ensures' >$i.pred; node pred-inject.js $i $i.pred >$i.pred.bpl; done

rm -f `find . -name '*.pred'`
