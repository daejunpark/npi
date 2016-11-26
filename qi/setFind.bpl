const N:int;
axiom 0 <= N;

procedure main()
{
  // set find

  var n:int;
  var v:int;
  var found:int;

  var s:[int]int; // size == N, set: no duplicate element
  assume (forall i:int, j:int :: 0 <= i && i < N && 0 <= j && j < N && i != j ==> s[i] != s[j]);

  found := -1;
  n := 0;
  while (n < N)
//! for i in N n v found 0 -1; do for eq in '==' '!=' '<='; do for j in N n v found 0 -1; do echo "invariant b$((++idx)) ==> $i $eq $j;"; done; done; done
//! for found1 in N n v found; do for eq in '==' '!='; do for c in -1 0; do for found2 in N n v found; do for v in N n v found; do echo "invariant b$((++idx)) ==> $found1 $eq $c ==> s[$found2] == $v;"; done; done; done; done; done
//! for found in N n v found; do for c in -1 0; do for n in N n v found; do for v in N n v found; do echo "invariant b$((++idx)) ==> ($found == $c ==> (forall i:int :: 0 <= i && i < $n ==> s[i] != $v));"; done; done; done; done
/*
    invariant n <= N;
    invariant found != -1 ==> s[found] == v;
    invariant found == -1 ==> (forall i:int :: 0 <= i && i < n ==> s[i] != v);
*/
  {
    if (s[n] == v) {
      found := n;
    }
    n := n + 1;
  }

  assert found != -1 ==> s[found] == v;
  assert found == -1 ==> (forall i:int :: 0 <= i && i < N ==> s[i] != v);
}
