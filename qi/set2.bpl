const N:int;
axiom 0 <= N;

procedure main()
{
  // set insert

  var n:int;
  var v:int;
  var found:int;

  var s:[int]int; // size == N, set: no duplicate element
  assume (forall i:int, j:int :: 0 <= i && i < N && 0 <= j && j < N && s[i] == s[j] ==> i == j);

  found := -1;
  n := 0;
  while (n < N)
//! for i in N n v found 0 -1; do for eq in '==' '!=' '<='; do for j in N n v found 0 -1; do echo "invariant b$((++idx)) ==> $i $eq $j;"; done; done; done
//! for found in N n v found; do for c in -1 0; do for n in N n v found; do for v in N n v found; do echo "invariant b$((++idx)) ==> (forall i:int :: $found == $c ==> 0 <= i && i < $n ==> s[i] != $v);"; done; done; done; done
//! for found in N n v found; do for eq in '==' '!='; do for c in -1 0; do for N in N n v found; do echo "invariant b$((++idx)) ==> (forall i:int, j:int :: $found $eq $c ==> 0 <= i && i < $N && 0 <= j && j < $N && s[i] == s[j] ==> i == j);"; done; done; done; done
//! for found1 in N n v found; do for eq in '==' '!='; do for c in -1 0; do for found2 in N n v found; do for v in N n v found; do echo "invariant b$((++idx)) ==> $found1 $eq $c ==> s[$found2] == $v;"; done; done; done; done; done
/*
    invariant n <= N;
    invariant (forall i:int :: found == -1 ==> 0 <= i && i < n ==> s[i] != v);
    invariant found != -1 ==> s[found] == v;
*/
  {
    if (s[n] == v) {
      found := n;
    }
    n := n + 1;
  }

  if (found == -1) {
    s[n] := v;
  }

  assert (forall i:int :: found == -1 ==> 0 <= i && i < N ==> s[i] != v);

  assert (forall i:int, j:int :: found != -1 ==> 0 <= i && i < N   && 0 <= j && j < N   && s[i] == s[j] ==> i == j);
  assert (forall i:int, j:int :: found == -1 ==> 0 <= i && i < N+1 && 0 <= j && j < N+1 && s[i] == s[j] ==> i == j);

  assert found != -1 ==> s[found] == v;
  assert found == -1 ==> s[N]     == v;
  
}
