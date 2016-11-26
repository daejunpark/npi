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
//
//  AA  =  4.0  1.0  2.5  4.0  1.0  1.0  4.0  1.0  1.0  4.0  2.5  0.5  4.0
//  JA  =  1    4    6    9    11   14
//  IC  =  1    2    5    2    3    2    3    5    3    4    1    4    5 
//

const N: int; // number of elements in sparse matrix
axiom 0 <= N;

const Row: int; // number of rows of original sparse matrix
const Col: int; // number of cols of original sparse matrix
axiom 1 <= Row;
axiom 1 <= Col;

const AA: [int]int; // compact array of elements, size = N
const JA: [int]int; // compressed sparse Row, size = Row + 1
const IC: [int]int; // column number of each element of AA, maximum <= Col

axiom (forall n:int :: 1 <= n && n <= Row ==> 1 <= JA[n] && JA[n] <= N); // NOTE: for simplicity, we assume that there is an element in the first row of the sparse matrix
axiom JA[Row + 1] == N + 1;
axiom (forall n:int, m:int :: 1 <= n && n <= m && m <= Row + 1 ==> JA[n] <= JA[m]);

axiom (forall n:int :: 1 <= n && n <= N ==> 1 <= IC[n] && IC[n] <= Col);

procedure main()
{
  var x: [int]int; // size = Col
  var y: [int]int; // size = Row

  var i: int;
  var j: int;
  var k1: int;
  var k2: int;

  i := 1;
  while (i <= Row)
//! for i in N Row Col i j k1 k2 0; do for j in N Row Col i j k1 k2 0; do for eq in '==' '<='; do for k in -1 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
/*
    invariant 1 <= i && i <= Row + 1;
*/
  {
    assert 1 <= i && i <= Row;
//  assert 1 <= JA[i] && JA[i] <= JA[i+1] && JA[i+1] <= N + 1;
    k1 := JA[i];
    k2 := JA[i+1] - 1;
    assert 1 <= k1 && k1 <= k2 + 1 && k2 + 1 <= N + 1;
    y[i] := 0;
    j := k1;
    while (j <= k2)
//! for i in N Row Col i j k1 k2 0; do for j in N Row Col i j k1 k2 0; do for eq in '==' '<='; do for k in -1 0 1; do echo "invariant b$((++idx)) ==> $i - $j $eq $k;"; done; done; done; done
/*
      invariant k1 <= j && j <= k2 + 1;
*/
    {
      assert 1 <= k1 && k1 <= k2 && k2 <= N;
      assert 1 <= j && j <= N;
      assert 1 <= IC[j] && IC[j] <= Col;
      y[i] := y[i] + AA[j] * x[IC[j]];
      j := j + 1;
    }
    i := i + 1;
  }
}
