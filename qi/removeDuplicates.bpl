const N: int;
axiom 1 <= N;

procedure main()
{
  var a: [int]int;
  var i, j, last: int;

  // "a[0..N]" is a sorted array
  assume (forall x, y: int :: 0 <= x && x <= y && y < N ==> a[x] <= a[y]);

  last := a[0];
  i := 1;
  j := 1;
  while (j < N)
//! for i in N i j last 0 1; do for j in N i j last 0 1; do for eq in '==' '<='; do for k in 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for i in N i j last; do echo "invariant b$((++idx)) ==> (forall x, y: int :: 0 <= x && x < y && y < $i ==> a[x] < a[y]);"; done
//! for z in N i j last 0 1; do for N in N i j last 0 1; do echo "invariant b$((++idx)) ==> (forall x, y: int :: $z <= x && x <= y && y < $N ==> a[x] <= a[y]);"; done; done
//! for i in N i j last; do for j in N i j last; do for eq in '==' '<='; do for dt in -1 +0 +1; do echo "invariant b$((++idx)) ==> $j $dt < N ==> $i $eq a[$j $dt];"; done; done; done; done
/*
    invariant 1 <= j && j <= N;
    invariant last == a[i-1];
    invariant j < N ==> last <= a[j];
    invariant (forall x, y: int :: i <= x && x <= y && y < N ==> a[x] <= a[y]);
    invariant (forall x, y: int :: 0 <= x && x < y && y < i ==> a[x] < a[y]);   // does not belong to the decidable APF, due to `x < y`
    invariant 1 <= i && i <= j;
*/
  {
    if (last != a[j])
    {
      a[i] := a[j];
      last := a[i];
      i := i + 1;
      j := j + 1;
    }
    else
    {
      j := j + 1;
    }
  }
  assert (forall x, y: int :: 0 <= x && x < y && y < i ==> a[x] < a[y]);

}
