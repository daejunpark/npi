const N: int;
axiom 1 <= N;

const a: [int]int;

// recursive definition
function sum(i:int) : int;
axiom (forall i:int :: { sum(i) } 0 == i ==> sum(i) == 0);
axiom (forall i:int :: { sum(i) } 0 <  i ==> sum(i) == sum(i-1) + a[i-1]);

procedure main()
{
  var n: int;
  var s: int;
  var max: int;

  assume (forall i:int :: 0 <= i && i < N ==> a[i] >= 0);

  n := 1;
  s := a[0];
  max := a[0];
  while (n < N)
//! for i in N n s max 0 1; do for j in N n s max 0 1; do for eq in '==' '<='; do for k in 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for s in N n s max; do for N in N n s max; do echo "invariant b$((++idx)) ==> $s == sum($N);"; done; done
//! for N in N n s max; do for max in N n s max; do echo "invariant b$((++idx)) ==> (forall i:int :: 0 <= i && i < $N ==> a[i] <= $max);"; done; done
//! for N in N n s max; do for max in N n s max; do echo "invariant b$((++idx)) ==> (exists i:int :: 0 <= i && i < $N &&  a[i] == $max);"; done; done
/*
    invariant n >= 1;
    invariant n <= N;
    invariant s == sum(n);
    invariant (forall i:int :: 0 <= i && i < n ==> a[i] <= max);
    invariant (exists i:int :: 0 <= i && i < n &&  a[i] == max);
//  invariant s <= n * max;
*/
  {
    if (max < a[n]) {
      max := a[n];
    }
    s := s + a[n];
    n := n + 1;
  }
  assert s == sum(N);
  assert (forall i:int :: 0 <= i && i < N ==> a[i] <= max);
  assert (exists i:int :: 0 <= i && i < N &&  a[i] == max);
//assert s <= N * max;
}
