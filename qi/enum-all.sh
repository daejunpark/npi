#!/bin/bash

for i in pow pow2 sum1 summax removeDuplicates setFind set2 sparseGenEasy sparseMul stride stride2 inverse; do
  ./enum.sh $i.bpl >$i.bpl.bpl
done
