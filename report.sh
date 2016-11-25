#!/bin/bash

out=$1

rProved=false

while read -r i; do
  case $i in
    'Prover time = '*)
      rTime="${i#*= }"
    ;;
    'Number of true assignments = '*)
      rTrue="${i#*= }"
    ;;
    'Number of false assignments = '*)
      rFalse="${i#*= }"
    ;;
    'Number of prover queries = '*)
      rRound="${i#*= }"
    ;;
    verified)
      rProved=true
    ;;
    *)
    ;;
  esac
done <$out

printf "%-40s" `basename ${out%.bpl.anon.pred.bpl.out}` 
if $rProved; then
  printf " %4d %4d %4d %7.2f" $((rTrue + rFalse)) $rRound $rTrue $rTime 
fi
printf "\n"
