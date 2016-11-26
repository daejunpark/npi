// recursive definition
function power2(n : int) : int;
axiom (forall n : int :: { power2(n) } n == 0 ==> power2(n) == 1);
axiom (forall n : int :: { power2(n) } n >  0 ==> power2(n) == 2 * power2(n - 1));

const N: int;
axiom N >= 0;

procedure main()
{
  var r : int;
  var i : int;

  r := 1;
  i := 0;
  while (i < N)
//! for i in N r i 0 1; do for j in N r i 0 1; do for eq in '==' '<='; do for k in 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for r in N r i; do for N in N r i; do echo "invariant b$((++idx)) ==> $r == power2($N);"; done; done
/*
    invariant r == power2(i);
    invariant i >= 0;
    invariant i <= n;
*/
  {
    r := 2 * r;
    i := i + 1;
  }

  assert r == power2(N);
}
