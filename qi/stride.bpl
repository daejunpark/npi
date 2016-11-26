const N: int;
axiom 0 <= N;

const a: [int]int; // size == 2*N; sorted over odd (even) positions; [ 10; 1; 20; 2; 30; 3; ... ] 
axiom (forall i:int, j:int :: 0 <= i && i + 2 == j && j < 2*N ==> a[i] <= a[j]);

procedure main()
{
  var x: [int]int;
  var y: [int]int;
  var n: int;
  var ix:int;
  var iy:int;

  n := 0;
  ix := 0;
  iy := 0;
  while (n < N)
//! for i in N n ix iy 0; do for j in N n ix iy 0; do for eq in '==' '<='; do for k in 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for ix in N n ix iy; do for x in a x y; do echo "invariant b$((++idx)) ==> (forall i:int, j:int :: 0 <= i && i + 2 == j && j < 2" '*' "$ix ==> $x[i] <= $x[j]);"; done; done
//! for i in 0 1; do for j in N N-1; do for n1 in n ix iy; do for n2 in n ix iy; do for x in x y; do for a in a; do for dt1 in -2 -1 +0 +1; do for dt2 in -2 -1 +0 +1; do echo "invariant b$((++idx)) ==> ($i <= $n1 && $n2 <= $j ==> $x[2" '*' "$n1 $dt1] <= $a[2" '*' "$n2 $dt2]);"; done; done; done; done; done; done; done; done
/*
    invariant 0 <= n  && n <= N;
    invariant 0 <= ix && ix <= n;
    invariant 0 <= iy && iy <= n;
    //
    invariant (forall i:int, j:int :: 0 <= i && i + 2 == j && j < 2*ix ==> x[i] <= x[j]);
    invariant 0 < ix && n < N ==> x[2*(ix-1)]   <= a[2*n];
    invariant 0 < ix && n < N ==> x[2*(ix-1)+1] <= a[2*n+1];
    //
    invariant (forall i:int, j:int :: 0 <= i && i + 2 == j && j < 2*iy ==> y[i] <= y[j]);
    invariant 0 < iy && n < N ==> y[2*(iy-1)]   <= a[2*n];
    invariant 0 < iy && n < N ==> y[2*(iy-1)+1] <= a[2*n+1];
*/
  {
    if (*) {
      x[2*ix]   := a[2*n];
      x[2*ix+1] := a[2*n+1];
      ix := ix + 1;
    } else {
      y[2*iy]   := a[2*n];
      y[2*iy+1] := a[2*n+1];
      iy := iy + 1;
    }
    n := n + 1;
  }

  assert ix <= n;
  assert iy <= n;
  assert (forall i:int, j:int :: 0 <= i && i + 2 == j && j < 2*ix ==> x[i] <= x[j]);
  assert (forall i:int, j:int :: 0 <= i && i + 2 == j && j < 2*iy ==> y[i] <= y[j]);
}
