// code from https://projects.ncsu.edu/hpc/Courses/6sparse.html
//
//              4.0  1.0  0.0  0.0  2.5 
//              0.0  4.0  1.0  0.0  0.0
//      A   =   0.0  1.0  4.0  0.0  1.0
//              0.0  0.0  1.0  4.0  0.0
//              2.5  0.0  0.0  0.5  4.0     
//
//  AA  =  4.0  1.0  2.5  4.0  1.0  1.0  4.0  1.0  1.0  4.0  2.5  0.5  4.0
//  JR  =  1    1    1    2    2    3    3    3    4    4    5    5    5
//  JC  =  1    2    5    2    3    2    3    5    3    4    1    4    5 

const A: [int,int]int;
const N: int; // number of non-zero elements of A
axiom 1 <= N;

const Row: int; // number of rows of original sparse matrix
const Col: int; // number of cols of original sparse matrix
axiom 1 <= Row;
axiom 1 <= Col;

procedure main()
{

  var aa: [int]int;
  var jr: [int]int;
  var jc: [int]int;

  var i: int;
  var j: int;
  var k: int;

  k := 1;
  i := 1;
  while (i <= Row)
//! for i in N Row Col i j k 0; do for j in N Row Col i j k 0; do for eq in '==' '<='; do for k in -1 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for i in N Row Col i j k; do for a in aa jr jc; do for j in N Row Col i j k; do echo "invariant b$((++idx)) ==> (forall n:int :: 1 <= n && n < $i ==> 1 <= $a[n] && $a[n] <= $j);"; done; done; done
//! for i in N Row Col i j k; do echo "invariant b$((++idx)) ==> (forall l:int :: 1 <= l && l < $i ==> aa[l] == A[jr[l],jc[l]]);"; done
/*
    invariant 1 <= i && i <= Row + 1;
    invariant 1 <= k && k <= N + 1;
    invariant (forall n:int :: 1 <= n && n <= k - 1 ==> 1 <= jr[n] && jr[n] <= Row);
    invariant (forall n:int :: 1 <= n && n <= k - 1 ==> 1 <= jc[n] && jc[n] <= Col);
    invariant (forall l:int :: 1 <= l && l <= k - 1 ==> aa[l] == A[jr[l],jc[l]]);
*/
  {
    j := 1;
    while (j <= Col)
//! for i in N Row Col i j k 0; do for j in N Row Col i j k 0; do for eq in '==' '<='; do for k in -1 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
//! for i in N Row Col i j k; do for a in aa jr jc; do for j in N Row Col i j k; do echo "invariant b$((++idx)) ==> (forall n:int :: 1 <= n && n < $i ==> 1 <= $a[n] && $a[n] <= $j);"; done; done; done
//! for i in N Row Col i j k; do echo "invariant b$((++idx)) ==> (forall l:int :: 1 <= l && l < $i ==> aa[l] == A[jr[l],jc[l]]);"; done
/*
      invariant 1 <= i && i <= Row + 1;
      invariant 1 <= j && j <= Col + 1;
      invariant 1 <= k && k <= N + 1;
      invariant (forall n:int :: 1 <= n && n <= k - 1 ==> 1 <= jr[n] && jr[n] <= Row);
      invariant (forall n:int :: 1 <= n && n <= k - 1 ==> 1 <= jc[n] && jc[n] <= Col);
      invariant (forall l:int :: 1 <= l && l <= k - 1 ==> aa[l] == A[jr[l],jc[l]]);
*/
    {
      assert 1 <= i && i <= Row;
      assert 1 <= j && j <= Col;
      if (A[i,j] != 0) {
        assert 1 <= i && i <= Row;
        assert 1 <= j && j <= Col;
        aa[k] := A[i,j];
        jr[k] := i;
        jc[k] := j;
        k := k + 1;
        assume k <= N + 1;
      }
      j := j + 1;
    }
    i := i + 1;
  }

  assert (k >= 1);
  assume (N == k - 1);

  assert (forall n:int :: 1 <= n && n <= N ==> 1 <= jr[n] && jr[n] <= Row);
  assert (forall n:int :: 1 <= n && n <= N ==> 1 <= jc[n] && jc[n] <= Col);

  // correctness relation between A and (AA,JR,JC)
  assert (forall l:int :: 1 <= l && l <= N ==> aa[l] == A[jr[l],jc[l]]);
}
