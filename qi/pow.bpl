// recursive definition
function power(b:int, e:int) : int;
axiom (forall b:int, e:int :: { power(b,e) } e == 0 ==> power(b,e) == 1);
axiom (forall b:int, e:int :: { power(b,e) } e >  0 ==> power(b,e) == b * power(b, e - 1));

const X: int;
const N: int;
axiom N >= 0;

procedure main()
{
  var r:int;
  var i:int;

  r := 1;
  i := 0;
  while (i < N)
//! for i in X N r i 0 1; do for j in X N r i 0 1; do for eq in '==' '<='; do for k in 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for r in     r i; do for X in X N    ; do for N in X N r i; do echo "invariant b$((++idx)) ==> $r == power($X,$N);"; done; done; done
/*
    invariant r == power(X,i);
    invariant i >= 0;
    invariant i <= N;
*/
  {
    r := X * r;
    i := i + 1;
  }

  assert r == power(X,N);
}
