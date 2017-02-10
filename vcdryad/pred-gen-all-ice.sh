cat list-list-1.txt            | while read -r j; do i=$j.bpl.anon; node pred-gen-list-ice.js $i 1         >$i.pred-ice; node pred-inject-ice.js $i $i.pred-ice >$i.pred-ice.bpl; done
cat list-list-2.txt            | while read -r j; do i=$j.bpl.anon; node pred-gen-list-ice.js $i 2         >$i.pred-ice; node pred-inject-ice.js $i $i.pred-ice >$i.pred-ice.bpl; done
cat list-list-3.txt            | while read -r j; do i=$j.bpl.anon; node pred-gen-list-ice.js $i 3         >$i.pred-ice; node pred-inject-ice.js $i $i.pred-ice >$i.pred-ice.bpl; done

# cat list-tree.txt              | while read -r j; do i=$j.bpl.anon; node pred-gen-tree-ice.js $i           >$i.pred-ice; node pred-inject-ice.js $i $i.pred-ice >$i.pred-ice.bpl; done
# 
# cat list-os-expressos-post.txt | while read -r j; do i=$j.bpl.anon; node pred-gen-os-ice.js   $i 'ensures' >$i.pred-ice; node pred-inject-ice.js $i $i.pred-ice >$i.pred-ice.bpl; done
# cat list-os-expressos-loop.txt | while read -r j; do i=$j.bpl.anon; node pred-gen-os-ice.js   $i           >$i.pred-ice; node pred-inject-ice.js $i $i.pred-ice >$i.pred-ice.bpl; done
# cat list-os-openbsd.txt        | while read -r j; do i=$j.bpl.anon; node pred-gen-os-ice.js   $i 'ensures' >$i.pred-ice; node pred-inject-ice.js $i $i.pred-ice >$i.pred-ice.bpl; done

rm -f `find . -name '*.pred-ice'`
