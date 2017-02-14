#!/bin/bash -x

dir=$(cd `dirname "$0"`; pwd)
prelude=$1
bpl=$2
learner=$3

opt="/typeEncoding:m /prover:SMTLib /useArrayTheory /noinfer /contractInfer"
opt+=" /trace"
opt+=" /errorLimit:100 /z3multipleErrors"
opt+=" /proverMemoryLimit:1024"

rm -f houdiniCexTrace.bpl

mono $dir/popl16ae/Boogie/Binaries/Boogie.exe /mlHoudini:$learner $opt $prelude $bpl

rm -f houdiniCexTrace.bpl
