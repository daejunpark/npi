const N: int;
axiom 0 <= N;

const a: [int]int; // size == 2*N; sorted over odd (even) positions; [ 10; 1; 20; 2; 30; 3; ... ] 
axiom (forall i:int, j:int :: 0 <= i && i + 2 == j && j < 2*N ==> a[i] <= a[j]);

procedure main()
{
  var x: [int]int;
  var y: [int]int;
  var n: int;

  n := 0;
  while (n < N)
//! for i in N n 0; do for j in N n 0; do for eq in '==' '<='; do for k in 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for N in N n; do for x in a x y; do echo "invariant b$((++idx)) ==> (forall i:int, j:int :: 0 <= i && i <= j && j < $N ==> $x[i] <= $x[j]);"; done; done
//! for i in 0 1; do for j in N N-1 N+1; do for n in n; do for x in x y; do for a in a; do for dt1 in -1 +0 +1; do for dt2 in -2 -1 +0 +1 +2; do echo "invariant b$((++idx)) ==> ($i <= $n && $n <= $j ==> $x[$n $dt1] <= $a[2" '*' "$n $dt2]);"; done; done; done; done; done; done; done
/*
    invariant 0 <= n && n <= N;
    //
    invariant (forall i:int, j:int :: 0 <= i && i <= j && j < n ==> x[i] <= x[j]);
    invariant 0 < n && n < N ==> x[n-1] <= a[2*n];
    //
    invariant (forall i:int, j:int :: 0 <= i && i <= j && j < n ==> y[i] <= y[j]);
    invariant 0 < n && n < N ==> y[n-1] <= a[2*n+1];
*/
  {
    x[n] := a[2*n];
    y[n] := a[2*n+1];
    n := n + 1;
  }

  assert (forall i:int, j:int :: 0 <= i && i <= j && j < N ==> x[i] <= x[j]);
  assert (forall i:int, j:int :: 0 <= i && i <= j && j < N ==> y[i] <= y[j]);
}
