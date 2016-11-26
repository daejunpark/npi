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
invariant b1 ==> N - N == 0;
invariant b2 ==> N - N == 1;
invariant b3 ==> N - N <= 0;
invariant b4 ==> N - N <= 1;
invariant b5 ==> N - r == 0;
invariant b6 ==> N - r == 1;
invariant b7 ==> N - r <= 0;
invariant b8 ==> N - r <= 1;
invariant b9 ==> N - i == 0;
invariant b10 ==> N - i == 1;
invariant b11 ==> N - i <= 0;
invariant b12 ==> N - i <= 1;
invariant b13 ==> N - 0 == 0;
invariant b14 ==> N - 0 == 1;
invariant b15 ==> N - 0 <= 0;
invariant b16 ==> N - 0 <= 1;
invariant b17 ==> N - 1 == 0;
invariant b18 ==> N - 1 == 1;
invariant b19 ==> N - 1 <= 0;
invariant b20 ==> N - 1 <= 1;
invariant b21 ==> r - N == 0;
invariant b22 ==> r - N == 1;
invariant b23 ==> r - N <= 0;
invariant b24 ==> r - N <= 1;
invariant b25 ==> r - r == 0;
invariant b26 ==> r - r == 1;
invariant b27 ==> r - r <= 0;
invariant b28 ==> r - r <= 1;
invariant b29 ==> r - i == 0;
invariant b30 ==> r - i == 1;
invariant b31 ==> r - i <= 0;
invariant b32 ==> r - i <= 1;
invariant b33 ==> r - 0 == 0;
invariant b34 ==> r - 0 == 1;
invariant b35 ==> r - 0 <= 0;
invariant b36 ==> r - 0 <= 1;
invariant b37 ==> r - 1 == 0;
invariant b38 ==> r - 1 == 1;
invariant b39 ==> r - 1 <= 0;
invariant b40 ==> r - 1 <= 1;
invariant b41 ==> i - N == 0;
invariant b42 ==> i - N == 1;
invariant b43 ==> i - N <= 0;
invariant b44 ==> i - N <= 1;
invariant b45 ==> i - r == 0;
invariant b46 ==> i - r == 1;
invariant b47 ==> i - r <= 0;
invariant b48 ==> i - r <= 1;
invariant b49 ==> i - i == 0;
invariant b50 ==> i - i == 1;
invariant b51 ==> i - i <= 0;
invariant b52 ==> i - i <= 1;
invariant b53 ==> i - 0 == 0;
invariant b54 ==> i - 0 == 1;
invariant b55 ==> i - 0 <= 0;
invariant b56 ==> i - 0 <= 1;
invariant b57 ==> i - 1 == 0;
invariant b58 ==> i - 1 == 1;
invariant b59 ==> i - 1 <= 0;
invariant b60 ==> i - 1 <= 1;
invariant b61 ==> 0 - N == 0;
invariant b62 ==> 0 - N == 1;
invariant b63 ==> 0 - N <= 0;
invariant b64 ==> 0 - N <= 1;
invariant b65 ==> 0 - r == 0;
invariant b66 ==> 0 - r == 1;
invariant b67 ==> 0 - r <= 0;
invariant b68 ==> 0 - r <= 1;
invariant b69 ==> 0 - i == 0;
invariant b70 ==> 0 - i == 1;
invariant b71 ==> 0 - i <= 0;
invariant b72 ==> 0 - i <= 1;
invariant b73 ==> 0 - 0 == 0;
invariant b74 ==> 0 - 0 == 1;
invariant b75 ==> 0 - 0 <= 0;
invariant b76 ==> 0 - 0 <= 1;
invariant b77 ==> 0 - 1 == 0;
invariant b78 ==> 0 - 1 == 1;
invariant b79 ==> 0 - 1 <= 0;
invariant b80 ==> 0 - 1 <= 1;
invariant b81 ==> 1 - N == 0;
invariant b82 ==> 1 - N == 1;
invariant b83 ==> 1 - N <= 0;
invariant b84 ==> 1 - N <= 1;
invariant b85 ==> 1 - r == 0;
invariant b86 ==> 1 - r == 1;
invariant b87 ==> 1 - r <= 0;
invariant b88 ==> 1 - r <= 1;
invariant b89 ==> 1 - i == 0;
invariant b90 ==> 1 - i == 1;
invariant b91 ==> 1 - i <= 0;
invariant b92 ==> 1 - i <= 1;
invariant b93 ==> 1 - 0 == 0;
invariant b94 ==> 1 - 0 == 1;
invariant b95 ==> 1 - 0 <= 0;
invariant b96 ==> 1 - 0 <= 1;
invariant b97 ==> 1 - 1 == 0;
invariant b98 ==> 1 - 1 == 1;
invariant b99 ==> 1 - 1 <= 0;
invariant b100 ==> 1 - 1 <= 1;
invariant b101 ==> N == power2(N);
invariant b102 ==> N == power2(r);
invariant b103 ==> N == power2(i);
invariant b104 ==> r == power2(N);
invariant b105 ==> r == power2(r);
invariant b106 ==> r == power2(i);
invariant b107 ==> i == power2(N);
invariant b108 ==> i == power2(r);
invariant b109 ==> i == power2(i);
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
const {:existential true} b1 : bool;
const {:existential true} b2 : bool;
const {:existential true} b3 : bool;
const {:existential true} b4 : bool;
const {:existential true} b5 : bool;
const {:existential true} b6 : bool;
const {:existential true} b7 : bool;
const {:existential true} b8 : bool;
const {:existential true} b9 : bool;
const {:existential true} b10 : bool;
const {:existential true} b11 : bool;
const {:existential true} b12 : bool;
const {:existential true} b13 : bool;
const {:existential true} b14 : bool;
const {:existential true} b15 : bool;
const {:existential true} b16 : bool;
const {:existential true} b17 : bool;
const {:existential true} b18 : bool;
const {:existential true} b19 : bool;
const {:existential true} b20 : bool;
const {:existential true} b21 : bool;
const {:existential true} b22 : bool;
const {:existential true} b23 : bool;
const {:existential true} b24 : bool;
const {:existential true} b25 : bool;
const {:existential true} b26 : bool;
const {:existential true} b27 : bool;
const {:existential true} b28 : bool;
const {:existential true} b29 : bool;
const {:existential true} b30 : bool;
const {:existential true} b31 : bool;
const {:existential true} b32 : bool;
const {:existential true} b33 : bool;
const {:existential true} b34 : bool;
const {:existential true} b35 : bool;
const {:existential true} b36 : bool;
const {:existential true} b37 : bool;
const {:existential true} b38 : bool;
const {:existential true} b39 : bool;
const {:existential true} b40 : bool;
const {:existential true} b41 : bool;
const {:existential true} b42 : bool;
const {:existential true} b43 : bool;
const {:existential true} b44 : bool;
const {:existential true} b45 : bool;
const {:existential true} b46 : bool;
const {:existential true} b47 : bool;
const {:existential true} b48 : bool;
const {:existential true} b49 : bool;
const {:existential true} b50 : bool;
const {:existential true} b51 : bool;
const {:existential true} b52 : bool;
const {:existential true} b53 : bool;
const {:existential true} b54 : bool;
const {:existential true} b55 : bool;
const {:existential true} b56 : bool;
const {:existential true} b57 : bool;
const {:existential true} b58 : bool;
const {:existential true} b59 : bool;
const {:existential true} b60 : bool;
const {:existential true} b61 : bool;
const {:existential true} b62 : bool;
const {:existential true} b63 : bool;
const {:existential true} b64 : bool;
const {:existential true} b65 : bool;
const {:existential true} b66 : bool;
const {:existential true} b67 : bool;
const {:existential true} b68 : bool;
const {:existential true} b69 : bool;
const {:existential true} b70 : bool;
const {:existential true} b71 : bool;
const {:existential true} b72 : bool;
const {:existential true} b73 : bool;
const {:existential true} b74 : bool;
const {:existential true} b75 : bool;
const {:existential true} b76 : bool;
const {:existential true} b77 : bool;
const {:existential true} b78 : bool;
const {:existential true} b79 : bool;
const {:existential true} b80 : bool;
const {:existential true} b81 : bool;
const {:existential true} b82 : bool;
const {:existential true} b83 : bool;
const {:existential true} b84 : bool;
const {:existential true} b85 : bool;
const {:existential true} b86 : bool;
const {:existential true} b87 : bool;
const {:existential true} b88 : bool;
const {:existential true} b89 : bool;
const {:existential true} b90 : bool;
const {:existential true} b91 : bool;
const {:existential true} b92 : bool;
const {:existential true} b93 : bool;
const {:existential true} b94 : bool;
const {:existential true} b95 : bool;
const {:existential true} b96 : bool;
const {:existential true} b97 : bool;
const {:existential true} b98 : bool;
const {:existential true} b99 : bool;
const {:existential true} b100 : bool;
const {:existential true} b101 : bool;
const {:existential true} b102 : bool;
const {:existential true} b103 : bool;
const {:existential true} b104 : bool;
const {:existential true} b105 : bool;
const {:existential true} b106 : bool;
const {:existential true} b107 : bool;
const {:existential true} b108 : bool;
const {:existential true} b109 : bool;
