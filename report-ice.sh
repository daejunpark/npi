#!/bin/bash

out=$1

rProved=false

while read -r i; do
  case $i in
    'Prover time = '*)
      rTime="${i#*= }"
    ;;
    'Number of C5 Learner queries = '*)
      rRound="${i#*= }"
    ;;
    verified)
      rProved=true
    ;;
    *)
    ;;
  esac
done <$out

rTrue=`grep '^  b' $out | tail -1 | sed 's/&&/\n/g' | wc -l`
rTotal=`grep ' my_inv(b0000: ' $out | tail -1 | sed 's/ /\n/g' | grep '^b[0-9]' | wc -l`

printf "%-40s" `basename ${out%.bpl.anon.pred-ice.bpl.out-*}` 
if $rProved; then
  printf " %4d %4d %4d %7.2f" $rTotal $rRound $rTrue $rTime 
fi
printf "\n"
