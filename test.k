t:("3";(`int;3)
   "\"foo\"";(`str;"foo")
   ":kw";(`keyword;"kw")
   "[5]";(`vector;,(`int;5)))

unique:*1?1.0
trap:{[f;x] $[unique~*r:@[f;x;{(unique;x)}];(1;r@1);(0;r)]}
gives:{[f;x;y] r:trap[f;x]; $[*r;r@1;y~r@1;0;(y;r@1)]}
  
t: (5;6
    "oh";"dontcare"
    8;42)
check:{[f;v] d:list2dict v; (!d){gives[f;x;y]}'(. d)}

\l sexp.k
