const N: int;
axiom 0 <= N;

procedure main()
{
  var a: [int]int;
  var n, min: int;

  // Find the minimum element of the array
  n := 0;
  while (n < N)
//! for i in N n min 0; do for j in N n min 0; do for eq in '==' '<='; do for k in 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for N in N n min; do for min in N n min; do for dt in -1 +0 +1; do echo "invariant b$((++idx)) ==> (forall i: int :: 0 <= i && i < $N $dt ==> $min <= a[i]);"; done; done; done
/*
    invariant ((0 <= n && n <= N));
    invariant ((forall j: int :: 0 <= j && j < n ==> min <= a[j]));
*/
  {
    if (a[n] < min)
    {
      min := a[n];
    }
    n := n + 1;
  }
  assert (forall i: int :: 0 <= i && i < N ==> min <= a[i]);
}
