
ex:"[1, 2, \n {\"kw\": 42}\n]";

q:"\"";
inStr:{=\~("\\"=-1_q,x)<q=x};
split:{
  $[1<n:(levels:+\inStr[x]*1 -1 1 -1"{}[]"?x)?0
    1_'(0,&(inStr[x]&","=x)&1=n#levels)_x:n#x
    ()]}
c:{$["{"=*x  /if dict
     (`$c'n#'x)!c'(1+n:x?'":")_'x:split x
     "["=*x  /if array
     c' split x  /could run in paralel
     q=*x    /if string
     $[1<+/inStr x; '`err; "",. x]
     "a">*x  /if digit
     "F"$x   /convert to number
     "n"=*x  /if null
     0n
     "t"=*x  /otherwise: true->1b; false->0b
   ]}
pars:{c x@&~inStr[x]&x in" \t\n\r"};
