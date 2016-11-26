const N: int;
axiom (N > 0);

function inImage(i: int): bool { true }  // this function is used to trigger the surjective quantification

procedure main() 
{                                                                             
  var A: [int]int;
  var B: [int]int;
  var i: int;

  assume (forall x: int :: 0 <= x && x < N ==> 0 <= A[x] && A[x] < N);
  assume (forall x: int, y: int :: 0 <= x && x < y && y < N ==> A[x] != A[y]); // A is injective
  assume (forall x: int :: 0 <= x && x < N && inImage(x) ==> (exists y: int :: 0 <= y && y < N && A[y] == x)); // A is surjective

  i := 0;
  while (i < N)
//! for i in N i 0; do for j in N i 0; do for pm in '+' '-'; do for eq in '>=' '==' '<='; do for k in -1 0 1; do echo "invariant b$((++idx)) ==> $i $pm $j $eq $k;"; done; done; done; done; done
//! for N in i N i+1 N+1 i-1 N-1; do for N2 in i N i+1 N+1 i-1 N-1; do for A in A B; do for B in A B; do echo "invariant b$((++idx)) ==> (forall j: int :: 0 <= j && j < $N && inImage(j) ==> 0 <= $B[j] && $B[j] < $N2 && $A[$B[j]] == j);";   done; done; done; done
//! for N in i N i+1 N+1 i-1 N-1; do for N2 in i N i+1 N+1 i-1 N-1; do                  for B in A B; do echo "invariant b$((++idx)) ==> (forall k: int :: 0 <= k && k < $N ==> 0 <= $B[k] && $B[k] < $N2);";                                   done; done; done
//! for N in i N i+1 N+1 i-1 N-1; do                                   for A in A B; do for B in A B; do echo "invariant b$((++idx)) ==> (forall k: int :: 0 <= k && k < $N ==> $A[$B[k]] == k);";                                              done; done; done
//! for N in i N i+1 N+1 i-1 N-1; do                                                    for B in A B; do echo "invariant b$((++idx)) ==> (forall j: int, k: int :: 0 <= j && j < k && k < $N ==> $B[j] != $B[k]);";                             done; done
/*
    invariant (forall x: int :: { A[x] } 0 <= x && x < i ==> B[A[x]] == x);
*/
  {
    B[A[i]] := i;
    i := i + 1;
  }

  assert (forall j: int :: 0 <= j && j < N && inImage(j) ==> 0 <= B[j] && B[j] < N && A[B[j]] == j);
  assert (forall k: int :: 0 <= k && k < N ==> 0 <= B[k] && B[k] < N);
  assert (forall k: int :: 0 <= k && k < N ==> B[A[k]] == k);  // A and B are each other's inverses
  assert (forall k: int :: 0 <= k && k < N ==> A[B[k]] == k);  // A and B are each other's inverses
  assert (forall j: int, k: int :: 0 <= j && j < k && k < N ==> B[j] != B[k]);  // B is injective
}
