
ex:"[1, 2, \n {\"kw\": 42}\n]";

triml:{f:x ss "[",y,"]";(($f=!#f)?"0")_x}
/ "foo \t"~triml["\t foo \t";" \t"]

q:"\"";
ws:" \t\n"
inStr:{=\~("\\"=-1_q,x)<q=x};
depths:{+\inStr[x]*1 -1 1 -1"{}[]"?x}
whereWs:{x ss "[",ws,"]"}
idx2bool:{v:x#0b;v[y]:1b;v}  / inverse of `where`
split2:{
  n:(d:depths[x])?0
  r:1_'(0,&inStr[x]&idx2bool[n;whereWs@x]&1=n#d)_x:n#x
  r@&0<#:'r}
split:{
  $[1<n:(d:depths[x])?0
    1_'(0,&(inStr[x]&","=x)&1=n#d)_x:n#x
    ()]}
c:{$["{"=*x  /if dict
     (`$c'n#'x)!c'(1+n:x?'":")_'x:split x
     "["=*x  /if array
     c' split2 x  /could run in paralel
     q=*x    /if string
     $[1<+/inStr x; '`err; "",. x]
     "a">*x  /if digit
     "F"$x   /convert to number
     "n"=*x  /if null
     0n
     "t"=*x  /otherwise: true->1b; false->0b
   ]}
pars:{c x@&~inStr[x]&x in" \t\n\r"};

  
/
"[[   1   2 ] 5]"
 00010001000 / ws before char
 01110111000 / ws

 200100102 / 0: ws; 1: char; 2: sep
 100102101 / 2: ws kept
 100101101 / expected
\
