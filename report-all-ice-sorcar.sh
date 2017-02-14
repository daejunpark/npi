#!/bin/bash

dir=$(cd `dirname "$0"`; pwd)

printf "%-40s %4s %4s %4s %7s\n" Program "|P|" "#R" "Inv" "Time"
for i in `find . -name '*.out-sorcar' | sort`; do
  $dir/report-ice.sh $i
done
