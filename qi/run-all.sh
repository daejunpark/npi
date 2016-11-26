#!/bin/bash

for i in pow pow2 sum1 summax removeDuplicates setFind set2 sparseGenEasy sparseMul stride stride2 inverse; do
  ../houdini.sh $i.bpl.bpl >$i.bpl.bpl.out 2>&1
done
