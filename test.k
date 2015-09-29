t:("3";(`int;3)
   "\"foo\"";(`str;"foo")
   ":kw";(`keyword;"kw")
   "[5]";(`vector;,(`int;5)))

unique:*1?1.0
trap:{[f;x] $[unique~*r:@[f;x;{(unique;x)}];(1;r@1);(0;r)]}

\l sexp.k
