const N: int;
axiom 0 <= N;

// recursive definition
function sum(a:[int]int, i:int, j:int) : int;
axiom (forall a:[int]int, i:int, j:int :: { sum(a,i,j) } 0 <= i && i == j && j <= N ==> sum(a,i,j) == 0);
axiom (forall a:[int]int, i:int, j:int :: { sum(a,i,j) } 0 <= i && i <  j && j <= N ==> sum(a,i,j) == sum(a,i,j-1) + a[j-1]);

procedure main()
{
  var a: [int]int;
  var n: int;
  var s: int;

  n := 0;
  s := 0;
  while (n < N)
//! for i in N n s 0; do for j in N n s 0; do for eq in '==' '<='; do for k in 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for s in N n s 0; do for z in N n s 0; do for N in N n s 0; do echo "invariant b$((++idx)) ==> $s == sum(a,$z,$N);"; done; done; done
/*
    invariant n >= 0;
    invariant n <= N;
    invariant s == sum(a,0,n);
*/
  {
    s := s + a[n];
    n := n + 1;
  }
  assert s == sum(a,0,N);
}
