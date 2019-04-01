org 100h
jmp start

mess    db  'Summ: $'
array   db  1,2,3,4,5,6,7,8,9
size    =   $ - array

start:
   mov   ah,9
   mov   dx,mess
   int   21h

   mov   si,array
   mov   cx,size
   xor   ax,ax
   shr   bx,16


cycle:
   lodsb
   add   bx,ax


miss:
   loop  cycle

   mov   ax,bx
   mov   bx,10
   call  hex2asc

exit:
   xor   ax,ax
   int   16h
   int   20h
hex2asc:
   pusha
   xor   cx,cx
isDiv:
   xor   dx,dx
   div   bx
   push  dx
   inc   cx
   or    ax,ax
   jnz   isDiv
isOut:
   pop   ax
   cmp   al,9
   jle   noHex
   add   al,7
noHex:
   add   al,30h
   int   29h
   loop  isOut
   popa
ret

