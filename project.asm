;I have drawn all tasks in one file
.MODEL LARGE
.STACK 0H
.DATA


var1 db 50
var2 db 0
count1 dw 160
count2 dw 100
count3 dw 0
count4 dw 0
count5 dw 0
count6 dw 0
row db 7
colour db 0
count dw 0
store1 dw 0
store2 dw 0
store3 dw 0
board1 dw 0
board2 dw 0
level dw 0
clearx dw 0
cleary dw 0
;variables required for swapping
x1 dw 0
y1 dw 0
x2 dw 0
y2 dw 0
fx dw 0
fy dw 0
sx dw 0
sy dw 0
greyx dw 0
greyy dw 0
storecoord dw 0
storeshape dw 0
;variables required for selection
fillhoriz dw 0
fillvert dw 0
;variable required to check four combo
four dw 0
drop dw 0
drop1 dw 0
redrawx dw 0
redrawy dw 0
combo dw 0
columndrop dw 0
noswap dw 0
holdswap dw 0
holdshape dw 0
explodeflag dw 0
explodeColour db 0
again dw 0
score dw 0
restart dw 0

randnum db 0
midx dw 49 DUP(?)
midy dw 49 DUP(?)
firstx dw 49 DUP(?)
firsty dw 49 DUP(?)
secondx dw 49 DUP(?)
secondy dw 49 DUP(?)
thirdx dw 49 DUP(?)
thirdy dw 49 DUP(?)
fourthx dw 49 DUP(?)
fourthy dw 49 DUP(?)
shape db 49 DUP(?)
mousex dw 0
mousey dw 0
index dw 0
index1 dw 0
finish dw 0

;Zaema Variables
lines dw 10
bgcolour db 01h
hor db 15
temp dw 0
movpg db ?
pgnum dw 0
fname db "leaderboard", 0
handle dw 0
xc dw 0
yc dw 0
counter dw 0
target db "Target: 120", '$'
name1 db "CANDY CRUSH", '$'
str1 db "ENTER YOUR NAME: ", '$'
str2 db "WELCOME TO THE GAME, ", '$'
arr db 10 dup("$")
str11 db "RULES OF THE GAME: ", '$'
str22 db ".The game is played by swiping ", '$'
cand db "candies", '$'
str3 db ".Create sets of 3 or more same ", '$'
str4 db ".Points = no. of candies crushed", '$'
str5 db ".Explosion gives you more points", '$'
str6 db ".You have 15 moves in each level", '$'
str9 db ".4 moves with 0 combinations result ", '$'
str10 db "in deduction of 10 points", '$'
str7 db ".There are 3 levels", '$'
str8 db "GOODLUCK!", '$'
playername db "Player name:", '$'
lives db "Lives:", '$'
livesnum db 3
scorestr db "Score: ", '$'
levelstr db "Enter the level you want to play: ", '$'



.CODE

MOV AX, @DATA
MOV DS, AX


mov ah, 00h
mov al, 13h
mov bx, 0
int 10h
jmp main

;macro for first page
page1 MACRO 
local enter, display
    ;setting background
mov counter, 40
mov lines, 40
mov xc, 0
mov yc, 0
mov bgcolour, 08h
mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 0
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
;add bgcolour, 1
inc bgcolour 
dec hor 
.endw 
;row2
    mov bgcolour, 0Eh
    mov yc, 40
    mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 40
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
;sub bgcolour, 1
dec bgcolour
dec hor 
.endw 
; ;row 3

mov bgcolour, 1h 
mov yc, 80
mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 80
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
inc bgcolour 
dec hor 
.endw 
; ;row 4
mov bgcolour, 0Dh
mov yc, 120
mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 120
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
dec bgcolour
dec hor 
.endw 

; ;row 5
mov bgcolour, 2h
mov yc, 160
mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 160
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
inc bgcolour
dec hor 
.endw 
;;drawing box
mov bgcolour, 0Fh  
mov xc, 15
mov yc, 23
mov lines, 110
mov counter, 290
.while lines!=0 
    mov counter, 290
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
;;making border
 mov xc, 15
 mov yc, 23
 mov counter, 290
 mov lines, 110

 .while counter!=0
 mov al, 00h
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 inc xc 
 dec counter
 .endw 
 .while lines!=0
 mov al, 00h
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 inc yc 
 dec lines
 .endw 
 mov counter, 290
.while counter!=0
 mov al, 00h
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 dec xc 
 dec counter
 .endw 
 mov lines, 110
 .while lines!=0
 mov al, 00h
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 dec yc 
 dec lines
 .endw 

 ;;making inside border
 mov xc, 17
 mov yc, 25
 mov counter, 285
 mov lines, 106

 .while counter!=0
 mov al, 0eh
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 inc xc 
 dec counter
 .endw 
 .while lines!=0
 mov al, 0eh
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 inc yc 
 dec lines
 .endw 
 mov counter, 285
.while counter!=0
 mov al, 0eh
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 dec xc 
 dec counter
 .endw 
 mov lines, 106
 .while lines!=0
 mov al, 0eh
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 dec yc 
 dec lines
 .endw 


     ;setting cursor position
    mov ah, 02h
    mov bh, 00h
    mov dh, 5
    mov dl, 15
    int 10h
    mov ah, 01h 
    mov ch, 10 
    mov cl, 20
    int 10h 

    ;printing game name
    
    mov dx, offset name1
    mov ah, 09h
    int 21h
    ;prompt user to enter name
    mov ah, 02h
    mov bh, 00h
    mov dh, 7
    mov dl, 10
    int 10h
    mov dx, offset str1
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 9
    mov dl, 10
    int 10h
    mov si, offset arr
    
    enter:
    MOV AH,01
    INT 21H            ;INPUTTING
    CMP AL,32
    je display
    mov [si],al
    inc si
    jmp enter
    
    mov bx, 00
    mov ax, 00
    mov dx, 00
    mov cx, 00
    display:
    mov ah, 02h
    mov bh, 00h
    mov dh, 12
    mov dl, 8
    int 10h
    mov dx, offset str2
    mov ah, 09h
    int 21h
    mov dx, offset arr
    mov ah, 9
    int 21h

;level
    mov ah, 02h
    mov bh, 00h
    mov dh, 14
    mov dl, 3
    int 10h
    mov dx, offset levelstr 
    mov ah, 09h
    int 21h
    ;input level

    mov ah, 02h
    mov bh, 00h
    mov dh, 14
    mov dl, 36
    int 10h
    
    ;enter:
    MOV AH,01
    INT 21H            ;INPUTTING
    
    mov ah, 00h
    sub ax, 48
    mov level, ax



ENDM
;next page(hopefully)
bgg MACRO 
    ;setting background
mov counter, 40
mov lines, 40
mov xc, 0
mov yc, 0
mov bgcolour, 08h
mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 0
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
;add bgcolour, 1
inc bgcolour 
dec hor 
.endw 
;row2
    mov bgcolour, 0Eh
    mov yc, 40
    mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 40
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
;sub bgcolour, 1
dec bgcolour
dec hor 
.endw 
; ;row 3

mov bgcolour, 1h 
mov yc, 80
mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 80
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
inc bgcolour 
dec hor 
.endw 
; ;row 4
mov bgcolour, 0Dh
mov yc, 120
mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 120
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
dec bgcolour
dec hor 
.endw 

; ;row 5
mov bgcolour, 2h
mov yc, 160
mov hor, 8
.while hor!=0
   mov lines, 40
   mov yc, 160
.while lines!=0 
    mov counter, 40
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
add xc, 40
mov bx, 0
mov bx, xc  
mov temp, bx   
inc bgcolour
dec hor 
.endw 
;;box 
mov bgcolour, 00h  
mov xc, 10
mov yc, 10
mov lines, 185
mov counter, 294
.while lines!=0 
    mov counter, 294
    mov bx, 0
    mov bx, xc  
    mov temp, bx 
 .while counter != 0
        mov al, bgcolour  
        mov ah, 0ch
        mov cx, temp
        mov dx, yc
        int 10h
        inc temp
        dec counter
    .endw  
 inc yc 
 dec lines
.endw
;;making border
;mov bgcolour, 0eh
 mov xc, 10
 mov yc, 10
 mov counter, 294
 mov lines, 185

 .while counter!=0
 mov al, 0eh
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 inc xc 
 dec counter
 .endw 
 .while lines!=0
 mov al, 0eh
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 inc yc 
 dec lines
 .endw 
 mov counter, 294
.while counter!=0
 mov al, 0eh
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 dec xc 
 dec counter
 .endw 
 mov lines, 185
 .while lines!=0
 mov al, 0eh
 mov ah, 0ch
 mov cx, xc
 mov dx, yc
 int 10H
 dec yc 
 dec lines
 .endw 

 

;;instructions

    mov ah, 02h
    mov bh, 00h
    mov dh, 2
    mov dl, 3
    int 10h
    mov dx, offset str11
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 5
    mov dl, 2
    int 10h
    mov dx, offset str22
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 7
    mov dl, 2
    int 10h
    mov dx, offset cand
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 9
    mov dl, 2
    int 10h
    mov dx, offset str3
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 11
    mov dl, 2
    int 10h
    mov dx, offset cand
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 13
    mov dl, 2
    int 10h
    mov dx, offset str4
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 15
    mov dl, 2
    int 10h
    mov dx, offset str5
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 17
    mov dl, 2
    int 10h
    mov dx, offset str6
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 19
    mov dl, 2
    int 10h
    mov dx, offset str7
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 21
    mov dl, 2
    int 10h
    mov dx, offset str9
    mov ah, 09h
    int 21h

    mov ah, 02h
    mov bh, 00h
    mov dh, 23
    mov dl, 2
    int 10h
    mov dx, offset str10
    mov ah, 09h
    int 21h

   

endm

secondClickDelay MACRO
local start, exit

    mov cx, 1

    start:
    cmp cx, 65535
    je exit
    inc cx
    jmp start

    exit:
endm

Delay1 Macro
    push cx
    mov cx, 1

    start:
    cmp cx, 3000
    je exit
    inc cx
    jmp start

    exit:
    pop cx
ENDM

Delay MACRO
local start, exit

    push cx
    mov cx, 1

    start:
    cmp cx, 9500
    je exit
    inc cx
    jmp start

    exit:
    pop cx
endm

Random MACRO
    Delay
    mov ax, 0
    mov ah, 0
    int 1ah
    mov ax, dx
    mov dx, 1
    mov bx, 6
    div bx
    mov randnum, dl
ENDM

Bombdelay MACRO
local start, exit

    push cx
    mov cx, 1

    start:
    cmp cx, 9500
    je exit
    inc cx
    jmp start

    exit:
    pop cx
endm

RandomBomb MACRO
    Delay
    mov ax, 0
    mov ah, 0
    int 1ah
    mov ax, dx
    mov dx, 1
    mov bx, 49
    div bx
    mov randnum, dl
ENDM

Delay2 MACRO
local start, exit

    push cx
    mov cx, 1

    start:
    cmp cx, 15000
    je exit
    inc cx
    jmp start

    exit:
    pop cx
endm

Random2 MACRO
    Delay2
    mov ax, 0
    mov ah, 0
    int 1ah
    mov ax, dx
    mov dx, 1
    mov bx, 6
    div bx
    mov randnum, dl
ENDM

Fill MACRO c, v
    
    mov bx, 00
    mov bx, count1
    mov fillhoriz, bx
    mov bx, 00
    mov bx, v
    mov var1, bl

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, fillhoriz
        mov dx, count2
        int 10h
        inc fillhoriz
        dec var1
    .endw


ENDM

Square MACRO c

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, count1
        mov dx, count2
        int 10h
        inc count1
        dec var1
    .endw

    mov var1, 28

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, count1
        mov dx, count2
        int 10h
        inc count2
        dec var1
    .endw

    mov var1, 28

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, count1
        mov dx, count2
        int 10h
        dec count1
        dec var1
    .endw

    mov var1, 28

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, count1
        mov dx, count2
        int 10h
        dec count2
        dec var1
    .endw
    
ENDM

CandySquare MACRO cen1, cen2, c
     
     mov var1, 20

     .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

    mov var1, 20

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen2
        dec var1
    .endw

    mov var1, 20

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec var1
    .endw

    mov var1, 20

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen2
        dec var1
    .endw
ENDM

Triangle MACRO cen1, cen2, c


    mov var1, 10
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        inc cen2
        dec var1
    .endw

    mov var1, 20

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec var1
    .endw

    mov var1, 10
    
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec cen2
        dec var1
    .endw


ENDM

Bombclear Macro cen1, cen2

    mov var1, 2
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

      mov var1, 3
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen2
        dec var1
    .endw

      mov var1, 2
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

      mov var1, 3
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen2
        dec var1
    .endw

      mov var1, 2
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

    mov var1, 4
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        inc cen2
        dec var1
    .endw

    mov var1, 6
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen2
        dec var1
    .endw

    mov var1, 4
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        inc cen2
        dec var1
    .endw

    mov var1, 6
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec var1
    .endw

    mov var1, 4
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec cen2
        dec var1
    .endw


    mov var1, 6
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen2
        dec var1
    .endw

    mov var1, 4
    .while var1 != 0
        mov al, 00h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec cen2
        dec var1
    .endw
ENDM

Bomb Macro cen1, cen2

    mov var1, 2
    .while var1 != 0
        mov al, 02h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

      mov var1, 3
    .while var1 != 0
        mov al, 03h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen2
        dec var1
    .endw

      mov var1, 2
    .while var1 != 0
        mov al, 04h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

      mov var1, 3
    .while var1 != 0
        mov al, 05h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen2
        dec var1
    .endw

      mov var1, 2
    .while var1 != 0
        mov al, 06h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

    mov var1, 4
    .while var1 != 0
        mov al, 07h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        inc cen2
        dec var1
    .endw

    mov var1, 6
    .while var1 != 0
        mov al, 09h
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen2
        dec var1
    .endw

    mov var1, 4
    .while var1 != 0
        mov al, 0ah
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        inc cen2
        dec var1
    .endw

    mov var1, 6
    .while var1 != 0
        mov al, 0bh
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec var1
    .endw

    mov var1, 4
    .while var1 != 0
        mov al, 0ch
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec cen2
        dec var1
    .endw


    mov var1, 6
    .while var1 != 0
        mov al, 0dh
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen2
        dec var1
    .endw

    mov var1, 4
    .while var1 != 0
        mov al, 0eh
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec cen2
        dec var1
    .endw
ENDM

Block proc

    mov fillhoriz, ax
    mov fillvert, bx
    sub fillhoriz, 13
    sub fillvert, 13


    mov board1, 27
    mov board2, 27
    .while board2 != 0
        .while board1 != 0
            mov al, 08h
            mov ah, 0ch
            mov cx, fillhoriz
            mov dx, fillvert
            int 10h
            inc fillhoriz
            dec board1
        .endw
        mov ax, drop1
        mov fillhoriz, ax
        sub fillhoriz, 13
        mov board1, 27
        inc fillvert
        dec board2
    .endw
    mov ax, drop1

ret
Block endp

Octagon MACRO cen1, cen2, c
    
    mov var1, 8
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

    mov var1, 6
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        inc cen2
        dec var1
    .endw

    mov var1, 8
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen2
        dec var1
    .endw

    mov var1, 6
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        inc cen2
        dec var1
    .endw

    mov var1, 8
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec var1
    .endw

    mov var1, 6
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec cen2
        dec var1
    .endw


    mov var1, 8
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen2
        dec var1
    .endw

    mov var1, 6
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec cen2
        dec var1
    .endw

ENDM

Hexagon MACRO cen1, cen2, c
    
     mov var1, 8
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

    mov var1, 5
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        inc cen2
        inc cen2
        dec var1
    .endw

    mov var1, 5
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        inc cen2
        inc cen2
        dec var1
    .endw

    mov var1, 8
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec var1
    .endw

    mov var1, 5
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec cen2
        dec cen2
        dec var1
    .endw

    mov var1, 5
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec cen2
        dec cen2
        dec var1
    .endw


ENDM

Pentagon MACRO cen1, cen2, c
    
    mov var1, 6
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        inc cen2
        dec var1
    .endw

    mov var1, 12
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen2
        dec var1
    .endw

    mov var1, 12
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec var1
    .endw

    mov var1, 12
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen2
        dec var1
    .endw

    mov var1, 6
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec cen2
        dec var1
    .endw



ENDM

Rectangle MACRO cen1, cen2, c

    mov var1, 20
    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen1
        dec var1
    .endw

    mov var1, 12

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        inc cen2
        dec var1
    .endw

    mov var1, 20

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen1
        dec var1
    .endw

    mov var1, 12

    .while var1 != 0
        mov al, c
        mov ah, 0ch
        mov cx, cen1
        mov dx, cen2
        int 10h
        dec cen2
        dec var1
    .endw
    
    
ENDM

Candy proc

    Random
    mov bx, 00
    mov bl, randnum
    mov si, index
    mov shape[si], bl
    inc index




    .if shape[si] == 1
        sub count1, 10
        sub count2, 10
        mov colour, 05h
        CandySquare count1, count2, colour
        add count1, 10
        add count2, 10
    .elseif shape[si] == 2
        sub count2, 10
        Pentagon count1, count2, 0Eh
        add count2, 10
    .elseif shape[si] == 3
        sub count1, 4
        sub count2, 10
        Hexagon count1, count2, 05h
        add count1, 4
        add count2, 10
    .elseif shape[si] == 4
        sub count1, 4
        sub count2, 10
        Octagon count1, count2, 02h
        add count1, 4
        add count2, 10
    .elseif shape[si] == 5
        sub count2, 5
        Triangle count1, count2, 04h
        add count2, 5
    .elseif shape[si] == 0
        sub count1, 10
        sub count2, 6
        Rectangle count1, count2, 0Fh
        add count1, 10
        add count2, 6
    .endif

ret
Candy endp

DrawBoard proc


    mov di, 0

    mov row, 7
    mov count1, 123
    mov count2, 170

    .while row != 0
        Random
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        inc di
        inc di
        call Candy
        add count1, 14
        mov count2, 170
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 142

    .while row != 0
        Random
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        inc di
        inc di
        call Candy
        add count1, 14
        mov count2, 142 
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 114

    .while row != 0
        Random
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        inc di
        inc di
        call Candy
        add count1, 14
        mov count2, 114
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 86

    .while row != 0
        Random
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        inc di
        inc di
        call Candy
        add count1, 14
        mov count2, 86
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 58

    .while row != 0
        Random
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        inc di
        inc di
        call Candy
        add count1, 14
        mov count2, 58
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 30

    .while row != 0
        Random
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        inc di
        inc di
        call Candy
        add count1, 14
        mov count2, 30
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 2

    .while row != 0
        Random
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        inc di
        inc di
        .if row != 1
            call Candy
        .else
            mov si, index
            sub count2, 6
            sub count1, 3
            Bomb count1, count2
            add count1, 3
            add count2, 6
            mov shape[si], 6
        .endif

        add count1, 14
        mov count2, 2
        dec row
    .endw

ret
DrawBoard endp

DrawBoard1 proc

    mov di, 0

    mov row, 7
    mov count1, 123
    mov count2, 170

    .while row != 0
        .if row != 1 
            .if row != 4
                .if row != 7
                    Random
                    mov var1, 28
                    mov colour, 0Fh
                    Square colour
                    add count1, 14
                    add count2, 14
                    mov bx, 00
                    mov bx, count1
                    mov midx[di], bx
                    mov bx, 00
                    mov bx, count2
                    mov midy[di], bx
                    inc di
                    inc di
                    call Candy
                    add count1, 14
                    mov count2, 170
                .else
                    add count1, 14
                    add count2, 14
                    mov bx, 00
                    mov bx, count1
                    mov midx[di], bx
                    mov bx, 00
                    mov bx, count2
                    mov midy[di], bx
                    mov bx, 0
                    mov bl, 8
                    mov si, index
                    mov shape[si], bl
                    inc index
                    inc di
                    inc di
                    add count1, 14
                    mov count2, 170
                .endif
            .else
                add count1, 14
                add count2, 14
                mov bx, 00
                mov bx, count1
                mov midx[di], bx
                mov bx, 00
                mov bx, count2
                mov midy[di], bx
                mov bx, 0
                mov bl, 8
                mov si, index
                mov shape[si], bl
                inc index
                inc di
                inc di
                add count1, 14
                mov count2, 170
            .endif
        .else
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov bx, 0
            mov bl, 8
            mov si, index
            mov shape[si], bl
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 170
        .endif
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 142

    .while row != 0
        .if row != 7
            .if row != 1
                Random
                mov var1, 28
                mov colour, 0Fh
                Square colour
                add count1, 14
                add count2, 14
                mov bx, 00
                mov bx, count1
                mov midx[di], bx
                mov bx, 00
                mov bx, count2
                mov midy[di], bx
                inc di
                inc di
                call Candy
                add count1, 14
                mov count2, 142
            .else
                add count1, 14
                add count2, 14
                mov bx, 00
                mov bx, count1
                mov midx[di], bx
                mov bx, 00
                mov bx, count2
                mov midy[di], bx
                mov bx, 0
                mov bl, 8
                mov si, index
                mov shape[si], bl
                inc index
                inc di
                inc di
                add count1, 14
                mov count2, 142
            .endif
        .else
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov bx, 0
            mov bl, 8
            mov si, index
            mov shape[si], bl
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 142
        .endif
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 114

    .while row != 0
        Random
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        inc di
        inc di
        call Candy
        add count1, 14
        mov count2, 114
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 86

    .while row != 0
        .if row != 7
            .if row != 1
                Random
                mov var1, 28
                mov colour, 0Fh
                Square colour
                add count1, 14
                add count2, 14
                mov bx, 00
                mov bx, count1
                mov midx[di], bx
                mov bx, 00
                mov bx, count2
                mov midy[di], bx
                inc di
                inc di
                call Candy
                add count1, 14
                mov count2, 86
            .else
                add count1, 14
                add count2, 14
                mov bx, 00
                mov bx, count1
                mov midx[di], bx
                mov bx, 00
                mov bx, count2
                mov midy[di], bx
                mov bx, 0
                mov bl, 8
                mov si, index
                mov shape[si], bl
                inc index
                inc di
                inc di
                add count1, 14
                mov count2, 86
            .endif
        .else
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov bx, 0
            mov bl, 8
            mov si, index
            mov shape[si], bl
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 86
        .endif
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 58

    .while row != 0
        Random
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        inc di
        inc di
        call Candy
        add count1, 14
        mov count2, 58
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 30

    .while row != 0
        .if row != 7
            .if row != 1
                Random
                mov var1, 28
                mov colour, 0Fh
                Square colour
                add count1, 14
                add count2, 14
                mov bx, 00
                mov bx, count1
                mov midx[di], bx
                mov bx, 00
                mov bx, count2
                mov midy[di], bx
                inc di
                inc di
                call Candy
                add count1, 14
                mov count2, 30
            .else
                add count1, 14
                add count2, 14
                mov bx, 00
                mov bx, count1
                mov midx[di], bx
                mov bx, 00
                mov bx, count2
                mov midy[di], bx
                mov bx, 0
                mov bl, 8
                mov si, index
                mov shape[si], bl
                inc index
                inc di
                inc di
                add count1, 14
                mov count2, 30
            .endif
        .else
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov bx, 0
            mov bl, 8
            mov si, index
            mov shape[si], bl
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 30
        .endif
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 2

    .while row != 0
        .if row != 7
            .if row != 4
                .if row != 1
                    Random
                    mov var1, 28
                    mov colour, 0Fh
                    Square colour
                    add count1, 14
                    add count2, 14
                    mov bx, 00
                    mov bx, count1
                    mov midx[di], bx
                    mov bx, 00
                    mov bx, count2
                    mov midy[di], bx
                    inc di
                    inc di
                    call Candy
                    add count1, 14
                    mov count2, 2
                .else
                    add count1, 14
                    add count2, 14
                    mov bx, 00
                    mov bx, count1
                    mov midx[di], bx
                    mov bx, 00
                    mov bx, count2
                    mov midy[di], bx
                    mov bx, 0
                    mov bl, 8
                    mov si, index
                    mov shape[si], bl
                    inc index
                    inc di
                    inc di
                    add count1, 14
                    mov count2, 2
                .endif 
            .else
                add count1, 14
                add count2, 14
                mov bx, 00
                mov bx, count1
                mov midx[di], bx
                mov bx, 00
                mov bx, count2
                mov midy[di], bx
                mov bx, 0
                mov bl, 8
                mov si, index
                mov shape[si], bl
                inc index
                inc di
                inc di
                add count1, 14
                mov count2, 2
            .endif
        .else
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov bx, 0
            mov bl, 8
            mov si, index
            mov shape[si], bl
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 2
        .endif
        dec row
    .endw

ret
DrawBoard1 endp

DrawBoard3 proc

    mov di, 0

    mov row, 7
    mov count1, 123
    mov count2, 170

    .while row != 0
        .if row != 4
            Random
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            inc di
            inc di
            call Candy
            add count1, 14
            mov count2, 170
        .else 
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov ax, count1
            mov drop1, ax
            mov bx, count2
            call Block
            inc di
            inc di
            mov si, index
            mov shape[si], 9
            inc index
            add count1, 14
            mov count2, 170
        .endif
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 142

    .while row != 0
        .if row != 4
            Random
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            inc di
            inc di
            call Candy
            add count1, 14
            mov count2, 142 
        .else
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov ax, midx[di]
            mov drop1, ax
            mov bx, midy[di]
            call Block
            mov si, index
            mov shape[si], 9
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 142 
        .endif
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 114

    .while row != 0
        .if row != 4
            Random
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            inc di
            inc di
            call Candy
            add count1, 14
            mov count2, 114
        .else
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov ax, midx[di]
            mov drop1, ax
            mov bx, midy[di]
            call Block
            mov si, index
            mov shape[si], 9
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 114
        .endif
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 86

    .while row != 0
        mov var1, 28
        mov colour, 0Fh
        Square colour
        add count1, 14
        add count2, 14
        mov bx, 00
        mov bx, count1
        mov midx[di], bx
        mov bx, 00
        mov bx, count2
        mov midy[di], bx
        mov ax, midx[di]
        mov drop1, ax
        mov bx, midy[di]
        call Block
        mov si, index
        mov shape[si], 9
        inc index
        inc di
        inc di
        add count1, 14
        mov count2, 86
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 58

    .while row != 0
        .if row != 4
            Random
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            inc di
            inc di
            call Candy
            add count1, 14
            mov count2, 58
        .else
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov ax, midx[di]
            mov drop1, ax
            mov bx, midy[di]
            call Block
            mov si, index
            mov shape[si], 9
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 58
        .endif
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 30

    .while row != 0
        .if row != 4
            Random
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            inc di
            inc di
            call Candy
            add count1, 14
            mov count2, 30
        .else
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov ax, midx[di]
            mov drop1, ax
            mov bx, midy[di]
            call Block
            mov si, index
            mov shape[si], 9
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 30
        .endif
        dec row
    .endw

    mov row, 7
    mov count1, 123
    mov count2, 2

    .while row != 0
        .if row != 4
            Random
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            inc di
            inc di
            .if row != 1
                call Candy
            .else
                mov si, index
                sub count2, 6
                sub count1, 3
                Bomb count1, count2
                add count1, 3
                add count2, 6
                mov shape[si], 6
            .endif
            add count1, 14
            mov count2, 2
        .else
            mov var1, 28
            mov colour, 0Fh
            Square colour
            add count1, 14
            add count2, 14
            mov bx, 00
            mov bx, count1
            mov midx[di], bx
            mov bx, 00
            mov bx, count2
            mov midy[di], bx
            mov ax, midx[di]
            mov drop1, ax
            mov bx, midy[di]
            call Block
            mov si, index
            mov shape[si], 9
            inc index
            inc di
            inc di
            add count1, 14
            mov count2, 2
        .endif
        dec row
    .endw

ret
DrawBoard3 endp

GettingCornersOfBoxes MACRO

    mov di, 0
    .while di != 98
        mov cx, 00
        mov dx, 00
        ;first corner
        mov cx, midx[di]
        mov dx, midy[di]
        sub cx, 14
        sub dx, 14
        mov firstx[di], cx 
        mov firsty[di], dx
        
        mov cx, 00
        mov dx, 00
        ;secon corner
        mov cx, midx[di]
        mov dx, midy[di]
        add cx, 14
        sub dx, 14
        mov secondx[di], cx 
        mov secondy[di], dx

        mov cx, 00
        mov dx, 00
        ;third corner
        mov cx, midx[di]
        mov dx, midy[di]
        sub cx, 14
        add dx, 14
        mov thirdx[di], cx 
        mov thirdy[di], dx

        mov cx, 00
        mov dx, 00
        ;fourth corner
        mov cx, midx[di]
        mov dx, midy[di]
        add cx, 14
        add dx, 14
        mov fourthx[di], cx 
        mov fourthy[di], dx

        
        inc di
        inc di
    .endw

    mov cx, 0
    mov dx, 0
    mov di, 0

ENDM

output MACRO a1, c
local OUTPUT2, OUTPUT3, EXIT1 
mov c, 0
pusha
    OUTPUT2:
    MOV AX, a1
    MOV DX, 0
    MOV BX, 10
    DIV BX
    PUSH DX
    MOV a1, AX
    INC c
    CMP AX, 0
    JNE OUTPUT2

    OUTPUT3:
    CMP c, 0
    JE EXIT1
    POP DX
    ADD DX, 48
    MOV AH, 02h
    INT 21h
    DEC c 
    JMP OUTPUT3

    EXIT1:
    popa
ENDM

Fillblack MACRO x, y, c, c1, c2, s

    
    mov bx, 00
    mov bx, x
    mov fillhoriz, bx
    mov bx, y
    mov fillvert, bx
    inc fillhoriz
    inc fillvert


    mov count1, 27
    mov count2, 27
    .while count2 != 0
        .while count1 != 0
            mov al, c
            mov ah, 0ch
            mov cx, fillhoriz
            mov dx, fillvert
            int 10h
            inc fillhoriz
            dec count1
        .endw
        mov bx, x
        mov fillhoriz, bx
        inc fillhoriz
        mov count1, 27
        inc fillvert
        dec count2
    .endw

    .if shape[s] == 1
        sub c1, 10
        sub c2, 10
        mov colour, 05h
        CandySquare c1, c2, colour
        add c1, 10
        add c2, 10
    .elseif shape[s] == 2
        sub c2, 10
        Pentagon c1, c2, 0Eh
        add c2, 10
    .elseif shape[s] == 3
        sub c1, 4
        sub c2, 10
        Hexagon c1, c2, 05h
        add c1, 4
        add c2, 10
    .elseif shape[s] == 4
        sub c1, 4
        sub c2, 10
        Octagon c1, c2, 02h
        add c1, 4
        add c2, 10
    .elseif shape[s] == 5
        sub c2, 5
        Triangle c1, c2, 04h
        add c2, 5

    .elseif shape[s] == 6
        sub c2, 6
        sub c1, 3
        Bomb c1, c2
        add c1, 3
        add c2, 6
    .elseif shape[s] == 0
        sub c1, 10
        sub c2, 6
        Rectangle c1, c2, 0Fh
        add c1, 10
        add c2, 6
    .endif


ENDM

drawShape proc

    sub bx, 28
    mov redrawx, ax
    mov redrawy, bx
    
    .while bx != drop
        .if shape[di] == 1
            sub redrawx, 10
            sub redrawy, 10
            mov colour, 00h
            CandySquare redrawx, redrawy, colour
            add redrawx, 10
            add redrawy, 10
        .elseif shape[di] == 2
            sub redrawy, 10
            Pentagon redrawx, redrawy, 00h
            add redrawy, 10
        .elseif shape[di] == 3
            sub redrawx, 4
            sub redrawy, 10
            Hexagon redrawx, redrawy, 00h
            add redrawx, 4
            add redrawy, 10
        .elseif shape[di] == 4
            sub redrawx, 4
            sub redrawy, 10
            Octagon redrawx, redrawy, 00h
            add redrawx, 4
            add redrawy, 10
        .elseif shape[di] == 5
            sub redrawy, 5
            Triangle redrawx, redrawy, 00h
            add redrawy, 5

        .elseif shape[di] == 6
            sub redrawy, 6
            sub redrawx, 3
            Bombclear redrawx, redrawy
            add redrawx, 3
            add redrawy, 6
        .elseif shape[di] == 0
            sub redrawx, 10
            sub redrawy, 6
            Rectangle redrawx, redrawy, 00h
            add redrawx, 10
            add redrawy, 6
        .endif
    
        inc redrawy

        .if shape[di] == 1
            sub redrawx, 10
            sub redrawy, 10
            mov colour, 05h
            CandySquare redrawx, redrawy, colour
            add redrawx, 10
            add redrawy, 10
        .elseif shape[di] == 2
            sub redrawy, 10
            Pentagon redrawx, redrawy, 0Eh
            add redrawy, 10
        .elseif shape[di] == 3
            sub redrawx, 4
            sub redrawy, 10
            Hexagon redrawx, redrawy, 05h
            add redrawx, 4
            add redrawy, 10
        .elseif shape[di] == 4
            sub redrawx, 4
            sub redrawy, 10
            Octagon redrawx, redrawy, 02h
            add redrawx, 4
            add redrawy, 10
        .elseif shape[di] == 5
            sub redrawy, 5
            Triangle redrawx, redrawy, 04h
            add redrawy, 5

        .elseif shape[di] == 6
            sub redrawy, 6
            sub redrawx, 3
            Bomb redrawx, redrawy
            add redrawx, 3
            add redrawy, 6
        .elseif shape[di] == 0
            sub redrawx, 10
            sub redrawy, 6
            Rectangle redrawx, redrawy, 0Fh
            add redrawx, 10
            add redrawy, 6
        .endif

        Delay1
        inc bx
        inc count5
        .if count5 == 28
            sub redrawx, 14
            sub redrawy, 14

            mov fillvert, 0

            .while fillvert != 28
                mov al, 0Fh
                mov ah, 0ch
                mov cx, redrawx
                mov dx, redrawy
                int 10h
                inc redrawx
                inc fillvert
            .endw

            sub redrawx, 14
            add redrawy, 14
            mov count5, 0
        .endif
    .endw

    sub redrawx, 14
    sub redrawy, 14

    mov fillvert, 0

    .while fillvert != 28
        mov al, 0Fh
        mov ah, 0ch
        mov cx, redrawx
        mov dx, redrawy
        int 10h
        inc redrawx
        inc fillvert
    .endw

    sub redrawx, 14
    add redrawy, 14

    mov ax, redrawx
    mov bx, redrawy

ret
drawShape endp

RandomShape proc
    
    mov redrawx, ax
    mov redrawy, bx

    .if shape[di] == 1
        sub redrawx, 10
        sub redrawy, 10
        mov colour, 05h
        CandySquare redrawx, redrawy, colour
        add redrawx, 10
        add redrawy, 10
    .elseif shape[di] == 2
        sub redrawy, 10
        Pentagon redrawx, redrawy, 0Eh
        add redrawy, 10
    .elseif shape[di] == 3
        sub redrawx, 4
        sub redrawy, 10
        Hexagon redrawx, redrawy, 05h
        add redrawx, 4
        add redrawy, 10
    .elseif shape[di] == 4
        sub redrawx, 4
        sub redrawy, 10
        Octagon redrawx, redrawy, 02h
        add redrawx, 4
        add redrawy, 10
    .elseif shape[di] == 5
        sub redrawy, 5
        Triangle redrawx, redrawy, 04h
        add redrawy, 5

    .elseif shape[di] == 6
        sub redrawy, 6
        sub redrawx, 3
        Bomb redrawx, redrawy
        add redrawx, 3
        add redrawy, 6
    .elseif shape[di] == 0
        sub redrawx, 10
        sub redrawy, 6
        Rectangle redrawx, redrawy, 0Fh
        add redrawx, 10
        add redrawy, 6
    .endif

RandomShape endp

Dropping proc
;ax has remove shape x coordinates
;bx has remove shape y coordinates
;di has the type of removed shape
    push ax
    mov ax, 2
    int 33h
    pop ax

    .if di >= 0 && di <= 6
        mov store3, 6
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            add di, 7
            mov ax, 0
            mov al, shape[di]
            sub di, 7
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2
    .elseif di >= 7 && di <= 13
        mov store3, 5
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            add di, 7
            mov ax, 0
            mov al, shape[di]
            sub di, 7
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .elseif di >= 14 && di <= 20
        mov store3, 4
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            add di, 7
            mov ax, 0
            mov al, shape[di]
            sub di, 7
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2
    .elseif di >= 21 && di <= 27
        mov store3, 3
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            add di, 7
            mov ax, 0
            mov al, shape[di]
            sub di, 7
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .elseif di >= 28 && di <= 34
        mov store3, 2
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            add di, 7
            mov ax, 0
            mov al, shape[di]
            sub di, 7
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .elseif di >= 35 && di <= 41
        mov store3, 1
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            add di, 7
            mov ax, 0
            mov al, shape[di]
            sub di, 7
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2
        ;mov ax, drop1
    .endif

    push ax
    mov ax, 1
    int 33h
    pop ax

ret
Dropping endp

Dropping1 proc
;ax has remove shape x coordinates
;bx has remove shape y coordinates
;di has the type of removed shape
    push ax
    mov ax, 2
    int 33h
    pop ax

    .if di > 0 && di != 3 && di < 6
        mov store3, 6
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+7] != 8
                mov drop, bx
                add di, 7
                mov ax, 0
                mov al, shape[di]
                sub di, 7
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw
        .if shape[di] != 8
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            ;call RandomShape
        .endif
        mov di, store2

    .elseif di > 7 && di < 13
        mov store3, 5
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+7] != 8
                mov drop, bx
                add di, 7
                mov ax, 0
                mov al, shape[di]
                sub di, 7
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw
        .if shape[di] != 8
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            ;call RandomShape
        .endif
        mov di, store2

    .elseif di == 14
        mov drop1, ax
        mov store2, di
        mov drop, bx
        add di, 14
        mov ax, 0
        mov al, shape[di]
        sub di, 14
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 56
        add di, 14
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        mov di, store2

    .elseif di > 14 && di < 20
        mov store3, 4
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+7] != 8
                mov drop, bx
                add di, 7
                mov ax, 0
                mov al, shape[di]
                sub di, 7
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw
        .if shape[di] != 8
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            ;call RandomShape
        .endif
        mov di, store2

    .elseif di == 20
        mov drop1, ax
        mov store2, di
        mov drop, bx
        add di, 14
        mov ax, 0
        mov al, shape[di]
        sub di, 14
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 56
        add di, 14
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        mov di, store2

    .elseif di > 21 && di < 27
        mov store3, 3
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+7] != 8
                mov drop, bx
                add di, 7
                mov ax, 0
                mov al, shape[di]
                sub di, 7
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw
        .if shape[di] != 8
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            ;call RandomShape
        .endif
        mov di, store2

    .elseif di == 28
        mov drop1, ax
        mov store2, di
        mov drop, bx
        push bx
        Random
        pop bx
        mov bx, drop
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        ;call RandomShape
        mov di, store2

    .elseif di > 28 && di < 34
        mov store3, 2
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+7] != 8
                mov drop, bx
                add di, 7
                mov ax, 0
                mov al, shape[di]
                sub di, 7
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw
        .if shape[di] != 8
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            ;call RandomShape
        .endif
        mov di, store2

    .elseif di == 34
        mov drop1, ax
        mov store2, di
        mov drop, bx
        push bx
        Random
        pop bx
        mov bx, drop
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        ;call RandomShape
        mov di, store2

    .elseif di > 35 && di < 41
        mov store3, 1
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+7] != 8
                mov drop, bx
                add di, 7
                mov ax, 0
                mov al, shape[di]
                sub di, 7
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw
        .if shape[di] != 8
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
        .endif
        mov di, store2
    .endif

    push ax
    mov ax, 1
    int 33h
    pop ax

ret
Dropping1 endp

Dropping2 proc

;ax has remove shape x coordinates
;bx has remove shape y coordinates
;di has the type of removed shape
    push ax
    mov ax, 2
    int 33h
    pop ax

    .if di >= 0 && di <= 6
        mov store3, 5
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+7] != 9
                mov drop, bx
                add di, 7
                mov ax, 0
                mov al, shape[di]
                sub di, 7
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .else
                mov ax, 0
                mov al, shape[di+14]
                mov shape[di], al
                sub bx, 56
                add di, 14
            .endif
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2
    .elseif di >= 7 && di <= 13
        mov store3, 4
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+7] != 9
                mov drop, bx
                add di, 7
                mov ax, 0
                mov al, shape[di]
                sub di, 7
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .else
                mov ax, 0
                mov al, shape[di+14]
                mov shape[di], al
                sub bx, 56
                add di, 14
            .endif
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .elseif di >= 14 && di <= 20
        mov store3, 3
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+7] != 9
                mov drop, bx
                add di, 7
                mov ax, 0
                mov al, shape[di]
                sub di, 7
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .else
                mov ax, 0
                mov al, shape[di+14]
                mov shape[di], al
                sub bx, 56
                add di, 14
            .endif
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .elseif di >= 28 && di <= 34
        mov store3, 2
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            add di, 7
            mov ax, 0
            mov al, shape[di]
            sub di, 7
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .elseif di >= 35 && di <= 41
        mov store3, 1
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            add di, 7
            mov ax, 0
            mov al, shape[di]
            sub di, 7
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2
        ;mov ax, drop1
    .endif

    push ax
    mov ax, 1
    int 33h
    pop ax

ret
Dropping2 endp

squareBlack proc

    mov fillhoriz, ax
    mov fillvert, bx
    sub fillhoriz, 13
    sub fillvert, 13


    mov count1, 27
    mov count2, 27
    .while count2 != 0
        .while count1 != 0
            mov al, 00h
            mov ah, 0ch
            mov cx, fillhoriz
            mov dx, fillvert
            int 10h
            inc fillhoriz
            dec count1
        .endw
        mov ax, drop1
        mov fillhoriz, ax
        sub fillhoriz, 13
        mov count1, 27
        inc fillvert
        dec count2
    .endw
    mov ax, drop1


ret
squareBlack endp

squareGrey proc

    mov fillhoriz, ax
    mov fillvert, bx
    sub fillhoriz, 13
    sub fillvert, 13


    mov count1, 27
    mov count2, 27
    .while count2 != 0
        .while count1 != 0
            mov al, explodeColour
            mov ah, 0ch
            mov cx, fillhoriz
            mov dx, fillvert
            int 10h
            inc fillhoriz
            dec count1
        .endw
        mov ax, drop1
        mov fillhoriz, ax
        sub fillhoriz, 13
        mov count1, 27
        inc fillvert
        dec count2
    .endw
    mov ax, drop1

    mov greyx, ax
    mov greyy, bx

    .if shape[di] == 1
        sub greyx, 10
        sub greyy, 10
        mov colour, 05h
        CandySquare greyx, greyy, colour
        add greyx, 10
        add greyy, 10
    .elseif shape[di] == 2
        sub greyy, 10
        Pentagon greyx, greyy, 0Eh
        add greyy, 10
    .elseif shape[di] == 3
        sub greyx, 4
        sub greyy, 10
        Hexagon greyx, greyy, 05h
        add greyx, 4
        add greyy, 10
    .elseif shape[di] == 4
        sub greyx, 4
        sub greyy, 10
        Octagon greyx, greyy, 02h
        add greyx, 4
        add greyy, 10
    .elseif shape[di] == 5
        sub greyy, 5
        Triangle greyx, greyy, 04h
        add greyy, 5
    .elseif shape[di] == 6
        sub greyy, 6
        sub greyx, 3
        Bomb greyx, greyy
        add greyx, 3
        add greyy, 6
    .elseif shape[di] == 0
        sub greyx, 10
        sub greyy, 6
        Rectangle greyx, greyy, 0Fh
        add greyx, 10
        add greyy, 6
    .endif


ret
squareGrey endp

droppingColumn proc

    .if di >= 21 && di <= 27
        mov store3, 1
        .if four == 1
            dec store3
        .endif
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            add di, 21
            mov ax, 0
            mov al, shape[di]
            sub di, 21
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 56
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw

        .if four == 1
            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 56
            call drawShape
            sub bx, 28
            add di, 7
        .endif

        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 28
        call drawShape
        
        sub bx, 28
        add di, 7
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call drawShape

        sub bx, 28
        add di, 7
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .elseif di >= 14 && di <= 20
        mov store3, 2
        .if four == 1
            dec store3
        .endif
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            .if four == 1
                add di, 7
                sub bx, 28
            .endif
            add di, 21
            mov ax, 0
            mov al, shape[di]
            sub di, 21
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 56
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw

        .if four == 1
            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 56
            call drawShape
            sub bx, 28
            add di, 7
        .endif

        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 28
        call drawShape
        
        sub bx, 28
        add di, 7
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call drawShape

        sub bx, 28
        add di, 7
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .elseif di >= 7 && di <= 13
        mov store3, 3
        .if four == 1
            dec store3
        .endif
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            .if four == 1
                add di, 7
                sub bx, 28
            .endif
            add di, 21
            mov ax, 0
            mov al, shape[di]
            sub di, 21
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 56
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw

        .if four == 1
            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 56
            call drawShape
            sub bx, 28
            add di, 7
        .endif

        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 28
        call drawShape
        
        sub bx, 28
        add di, 7
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call drawShape

        sub bx, 28
        add di, 7
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .elseif di >= 0 && di <= 6
        mov store3, 4
        .if four == 1
            dec store3
        .endif
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            mov drop, bx
            .if four == 1
                add di, 7
                sub bx, 28
            .endif
            add di, 21
            mov ax, 0
            mov al, shape[di]
            sub di, 21
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 56
            call drawShape
            sub bx, 28
            add di, 7
            dec store3
        .endw

        .if four == 1
            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 56
            call drawShape
            sub bx, 28
            add di, 7
        .endif

        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 28
        call drawShape
        
        sub bx, 28
        add di, 7
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call drawShape

        sub bx, 28
        add di, 7
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2
    .else
        mov drop1, ax
        mov store2, di
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 28
        call drawShape
        
        sub bx, 28
        add di, 7
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call drawShape

        sub bx, 28
        add di, 7
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .endif

ret
droppingColumn endp

droppingColumn1 proc


    .if di > 21 && di < 27
        mov store3, 1
        .if four == 1
            dec store3
        .endif
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+21] != 8
                mov drop, bx
                add di, 21
                mov ax, 0
                mov al, shape[di]
                sub di, 21
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                sub bx, 56
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw

        .if shape[di] != 8
            .if four == 1
                mov drop, bx
                push bx
                Random
                pop bx
                mov ax, 0
                mov al, randnum
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                sub bx, 56
                call drawShape
                sub bx, 28
                add di, 7
            .endif

            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 28
            call drawShape
            
            sub bx, 28
            add di, 7
            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape

            sub bx, 28
            add di, 7
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            ;call RandomShape
            mov di, store2
        .endif

    .elseif di == 28
        mov drop1, ax
        mov store2, di
        mov drop, bx
        push bx
        Random
        pop bx
        mov bx, drop
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        ;call RandomShape
        mov di, store2
    .elseif di == 34
        mov drop1, ax
        mov store2, di
        mov drop, bx
        push bx
        Random
        pop bx
        mov bx, drop
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        ;call RandomShape
        mov di, store2
    .elseif di == 14
        mov drop1, ax
        mov store2, di
        mov drop, bx
        add di, 14
        mov ax, 0
        mov al, shape[di]
        sub di, 14
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 56
        add di, 14
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        mov di, store2

    .elseif di > 14 && di < 20
        mov store3, 2
        .if four == 1
            dec store3
        .endif
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+21] != 8
                mov drop, bx
                .if four == 1
                    add di, 7
                    sub bx, 28
                .endif
                add di, 21
                mov ax, 0
                mov al, shape[di]
                sub di, 21
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                sub bx, 56
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw

        .if shape[di] != 8
            .if four == 1
                mov drop, bx
                push bx
                Random
                pop bx
                mov ax, 0
                mov al, randnum
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                sub bx, 56
                call drawShape
                sub bx, 28
                add di, 7
            .endif

            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 28
            call drawShape
            
            sub bx, 28
            add di, 7
            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape

            sub bx, 28
            add di, 7
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            ;call RandomShape
        .endif
        mov di, store2

    .elseif di == 20
        mov drop1, ax
        mov store2, di
        mov drop, bx
        add di, 14
        mov ax, 0
        mov al, shape[di]
        sub di, 14
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 56
        add di, 14
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        mov di, store2
    
    .elseif di > 7 && di < 13
        mov store3, 3
        .if four == 1
            dec store3
        .endif
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+21] != 8
                mov drop, bx
                .if four == 1
                    add di, 7
                    sub bx, 28
                .endif
                add di, 21
                mov ax, 0
                mov al, shape[di]
                sub di, 21
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                sub bx, 56
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw

        .if shape[di] != 8
            .if four == 1
                mov drop, bx
                push bx
                Random
                pop bx
                mov ax, 0
                mov al, randnum
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                sub bx, 56
                call drawShape
                sub bx, 28
                add di, 7
            .endif

            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 28
            call drawShape
            
            sub bx, 28
            add di, 7
            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape

            sub bx, 28
            add di, 7
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            ;call RandomShape
        .endif
        mov di, store2

    .elseif di > 0 && di < 6
        mov store3, 4
        .if four == 1
            dec store3
        .endif
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if shape[di+21] != 8
                mov drop, bx
                .if four == 1
                    add di, 7
                    sub bx, 28
                .endif
                add di, 21
                mov ax, 0
                mov al, shape[di]
                sub di, 21
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                sub bx, 56
                call drawShape
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw

        .if shape[di] != 8
            .if four == 1
                mov drop, bx
                push bx
                Random
                pop bx
                mov ax, 0
                mov al, randnum
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                sub bx, 56
                call drawShape
                sub bx, 28
                add di, 7
            .endif

            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            sub bx, 28
            call drawShape
            
            sub bx, 28
            add di, 7
            mov drop, bx
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            call drawShape

            sub bx, 28
            add di, 7
            push bx
            Random
            pop bx
            mov ax, 0
            mov al, randnum
            mov shape[di], al
            mov ax, drop1
            call squareBlack
            ;call RandomShape
        .endif
        mov di, store2
    .else
        mov drop1, ax
        mov store2, di
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 28
        call drawShape
        
        sub bx, 28
        add di, 7
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call drawShape

        sub bx, 28
        add di, 7
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .endif

ret
droppingColumn1 endp

droppingColumn2 proc


    .if di >= 0 && di <= 6
        mov store3, 3
        mov drop1, ax
        mov store2, di
        .while store3 != 0
            .if store3 != 1
                mov drop, bx
                add di, 28
                mov ax, 0
                mov al, shape[di]
                sub di, 28
                mov shape[di], al
                mov ax, drop1
                call squareBlack
                call drawShape
                sub bx, 28
                add di, 7
            .else
                mov ax, 0
                mov al, shape[di+28]
                mov shape[di], al
                sub bx, 28
                add di, 7
            .endif
            dec store3
        .endw

        sub bx, 28
        add di, 7

        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 28
        call drawShape
        
        sub bx, 28
        add di, 7
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call drawShape

        sub bx, 28
        add di, 7
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        ;call RandomShape
        mov di, store2
    .else
        mov drop1, ax
        mov store2, di
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        sub bx, 28
        call drawShape
        
        sub bx, 28
        add di, 7
        mov drop, bx
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call drawShape

        sub bx, 28
        add di, 7
        push bx
        Random
        pop bx
        mov ax, 0
        mov al, randnum
        mov shape[di], al
        mov ax, drop1
        call squareBlack
        call RandomShape
        mov di, store2

    .endif

ret
droppingColumn2 endp

Explode Macro x, y

    mov bx, 00
    mov bx, x
    mov fillhoriz, bx
    mov bx, y
    mov fillvert, bx
    inc fillhoriz
    inc fillvert


    mov count1, 27
    mov count2, 27
    .while count2 != 0
        .while count1 != 0
            mov al, 00h
            mov ah, 0ch
            mov cx, fillhoriz
            mov dx, fillvert
            int 10h
            inc fillhoriz
            dec count1
        .endw
        mov bx, x
        mov fillhoriz, bx
        inc fillhoriz
        mov count1, 27
        inc fillvert
        dec count2
    .endw


ENDM

Explosion proc

    mov index, si
    mov ax, 0
    mov al, shape[di]
    mov si, 0
    mov di, 0
    .while di < 49
        .if al == shape[di] || shape[di] == 7
            mov holdshape, ax
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            mov explodeColour, 08h
            call squareGrey
            mov ax, holdshape
        .endif
        inc si
        inc si
        inc di
    .endw

    mov count6, 35
    .while count6 != 0
        Delay2
        dec count6
    .endw

    mov si, 0
    mov di, 0
    .while di < 49
        .if al == shape[di] || shape[di] == 7
            mov holdshape, ax
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            mov explodeColour, 00h
            call squareGrey
            mov ax, holdshape
        .endif
        inc si
        inc si
        inc di
    .endw

    mov count6, 35
    .while count6 != 0
        Delay2
        dec count6
    .endw

    mov si, 0
    mov di, 0
    .while di < 49
        .if al == shape[di] || shape[di] == 7
            mov holdshape, ax
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            mov explodeColour, 08h
            call squareGrey
            mov ax, holdshape
        .endif
        inc si
        inc si
        inc di
    .endw

    mov count6, 35
    .while count6 != 0
        Delay2
        dec count6
    .endw

    mov si, 0
    mov di, 0
    .while di < 49
        .if al == shape[di] || shape[di] == 7
            mov holdshape, ax
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            mov explodeColour, 00h
            call squareGrey
            mov ax, holdshape
        .endif
        inc si
        inc si
        inc di
    .endw

    mov count6, 35
    .while count6 != 0
        Delay2
        dec count6
    .endw

    mov si, 0
    mov di, 0
    .while di < 49
        .if al == shape[di] || shape[di] == 7
            mov holdshape, ax
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            mov explodeColour, 08h
            call squareGrey
            mov ax, holdshape
        .endif
        inc si
        inc si
        inc di
    .endw

    mov count6, 35
    .while count6 != 0
        Delay2
        dec count6
    .endw

    mov si, 0
    mov di, 0
    .while di < 49
        .if al == shape[di] || shape[di] == 7
            mov holdshape, ax
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            mov explodeColour, 00h
            call squareGrey
            mov ax, holdshape
        .endif
        inc si
        inc si
        inc di
    .endw

    mov count6, 35
    .while count6 != 0
        Delay2
        dec count6
    .endw

    mov si, 0
    mov di, 0
    .while di < 49
        .if al == shape[di] || shape[di] == 7
            mov holdshape, ax
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            call squareBlack
            mov shape[di], 7
            mov ax, holdshape
        .endif
        inc si
        inc si
        inc di
    .endw

    mov si, 0
    mov di, 0
    .while di < 49
        .if shape[di] == 7
            mov holdshape, ax
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            .if level == 1
                call Dropping
            .elseif level == 2
                call Dropping1
            .elseif level == 3
                call Dropping2
            .endif
            mov ax, holdshape
            inc score
        .endif
        inc si
        inc si
        inc di
    .endw

    add score, 5

    mov si, 0
    mov di, 0
    .while di < 49
        .if shape[di] == 7
            mov holdshape, ax
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            .if level == 1
                call Dropping
            .elseif level == 2
                call Dropping1
            .elseif level == 3
                call Dropping2
            .endif
            mov ax, holdshape
        .endif
        inc si
        inc si
        inc di
    .endw

    mov si, 0
    mov di, 0
    .while di < 49
        mov holdshape, ax
        mov ax, midx[si]
        mov drop1, ax
        mov bx, midy[si]
        mov explodeColour, 00h
        .if shape[di] != 9
            call squareGrey
        .endif
        mov ax, holdshape
        inc si
        inc si
        inc di
    .endw

    mov si, index
    mov di, holdswap
    
    
ret
Explosion endp

Swap proc 

    mov ax, 0
    mov bx, 0
    .if index == 1
        mov ax, sx
        mov index1, ax
        mov ax, 0
        mov ax, x1
        mov bx, di
        inc bx
    .elseif index == 2
        mov ax, sy
        mov index1, ax
        mov ax, 0
        mov ax, y1
        mov bx, di
        add bx, 7
    .elseif index == 3
        mov ax, sy
        mov index1, ax
        mov ax, 0
        mov ax, y1
        mov bx, di
        sub bx, 7
    .else
        mov ax, sx
        mov index1, ax
        mov ax, 0
        mov ax, x1
        mov bx, di
        dec bx
    .endif

    .while ax != index1
        .if shape[di] == 1
            sub x1, 10
            sub y1, 10
            mov colour, 00h
            CandySquare x1, y1, colour
            add x1, 10
            add y1, 10
        .elseif shape[di] == 2
            sub y1, 10
            Pentagon x1, y1, 00h
            add y1, 10
        .elseif shape[di] == 3
            sub x1, 4
            sub y1, 10
            Hexagon x1, y1, 00h
            add x1, 4
            add y1, 10
        .elseif shape[di] == 4
            sub x1, 4
            sub y1, 10
            Octagon x1, y1, 00h
            add x1, 4
            add y1, 10
        .elseif shape[di] == 5
            sub y1, 5
            Triangle x1, y1, 00h
            add y1, 5
        .elseif shape[di] == 6
            sub y1, 6
            sub x1, 3
            Bombclear x1, y1
            add x1, 3
            add y1, 6
        .elseif shape[di] == 0
            sub x1, 10
            sub y1, 6
            Rectangle x1, y1, 00h
            add x1, 10
            add y1, 6
        .endif
        

        .if shape[bx] == 1
            sub x2, 10
            sub y2, 10
            mov colour, 00h
            CandySquare x2, y2, colour
            add x2, 10
            add y2, 10
        .elseif shape[bx] == 2
            sub y2, 10
            Pentagon x2, y2, 00h
            add y2, 10
        .elseif shape[bx] == 3
            sub x2, 4
            sub y2, 10
            Hexagon x2, y2, 00h
            add x2, 4
            add y2, 10
        .elseif shape[bx] == 4
            sub x2, 4
            sub y2, 10
            Octagon x2, y2, 00h
            add x2, 4
            add y2, 10
        .elseif shape[bx] == 5
            sub y2, 5
            Triangle x2, y2, 00h
            add y2, 5
        .elseif shape[bx] == 6
            sub y2, 6
            sub x2, 3
            Bombclear x2, y2
            add x2, 3
            add y2, 6
        .elseif shape[bx] == 0
            sub x2, 10
            sub y2, 6
            Rectangle x2, y2, 00h
            add x2, 10
            add y2, 6
        .endif
        

        .if index == 1
            inc x1
            dec x2
        .elseif index == 2
            dec y1
            inc y2
        .elseif index == 3
            inc y1
            dec y2
        .else
            dec x1
            inc x2
        .endif

        .if shape[di] == 1
            sub x1, 10
            sub y1, 10
            mov colour, 05h
            CandySquare x1, y1, colour
            add x1, 10
            add y1, 10
        .elseif shape[di] == 2
            sub y1, 10
            Pentagon x1, y1, 0Eh
            add y1, 10
        .elseif shape[di] == 3
            sub x1, 4
            sub y1, 10
            Hexagon x1, y1, 05h
            add x1, 4
            add y1, 10
        .elseif shape[di] == 4
            sub x1, 4
            sub y1, 10
            Octagon x1, y1, 02h
            add x1, 4
            add y1, 10
        .elseif shape[di] == 5
            sub y1, 5
            Triangle x1, y1, 04h
            add y1, 5
        .elseif shape[di] == 6
            sub y1, 6
            sub x1, 3
            Bomb x1, y1
            add x1, 3
            add y1, 6
        .elseif shape[di] == 0
            sub x1, 10
            sub y1, 6
            Rectangle x1, y1, 0Fh
            add x1, 10
            add y1, 6
        .endif

        .if shape[bx] == 1
            sub x2, 10
            sub y2, 10
            mov colour, 05h
            CandySquare x2, y2, colour
            add x2, 10
            add y2, 10
        .elseif shape[bx] == 2
            sub y2, 10
            Pentagon x2, y2, 0Eh
            add y2, 10
        .elseif shape[bx] == 3
            sub x2, 4
            sub y2, 10
            Hexagon x2, y2, 05H
            add x2, 4
            add y2, 10
        .elseif shape[bx] == 4
            sub x2, 4
            sub y2, 10
            Octagon x2, y2, 02h
            add x2, 4
            add y2, 10
        .elseif shape[bx] == 5
            sub y2, 5
            Triangle x2, y2, 04h
            add y2, 5
        .elseif shape[bx] == 6
            sub y2, 6
            sub x2, 3
            Bomb x2, y2
            add x2, 3
            add y2, 6
        .elseif shape[bx] == 0
            sub x2, 10
            sub y2, 6
            Rectangle x2, y2, 0Fh
            add x2, 10
            add y2, 6
        .endif
        
        Delay
        .if index == 1
            mov ax, x1
        .elseif index == 2
            mov ax, y1
        .elseif index == 3
            mov ax, y1
        .else
            mov ax, x1
        .endif
    .endw   


    ;swapping shapes in array
    mov ax, 0
    mov ah, shape[di]
    mov al, shape[bx]
    mov shape[di], al
    mov shape[bx], ah
    ;checking for combo
    mov ax, 0
    mov bx, 0

   
ret
Swap endp

Moves proc
    mov si, 0
    mov di, 0
    .while di < 49
        mov holdshape, ax
        mov ax, midx[si]
        mov drop1, ax
        mov bx, midy[si]
        mov explodeColour, 00h
        .if shape[di] == 9
            call Block
        .else
            call squareGrey
        .endif
        mov ax, holdshape
        inc si
        inc si
        inc di
    .endw
    
    mov noswap, 0
    .if explodeflag == 1
        mov noswap, 1
    .endif

    check:
    mov di, 0
    mov si, 0
    mov count4, 0
    .while di < 49
        mov ax, 0
        mov al, shape[di]
        .if al == shape[di+1] && al == shape[di+2] && al != 9
            .if al == shape[di+3] && count4 != 4
                mov ax, 2
                int 33h
                Explode firstx[si], firsty[si]
                Explode firstx[si+2], firsty[si+2]
                Explode firstx[si+4], firsty[si+4]
                Explode firstx[si+6], firsty[si+6]
                .if di < 42
                    mov ax, midx[si]
                    mov bx, midy[si]
                    .if level == 1
                        call Dropping
                    .elseif level == 2
                        call Dropping1
                    .elseif level == 3
                        call Dropping2
                    .endif
                    mov ax, midx[si+2]
                    mov bx, midy[si+2]
                    inc di
                    .if level == 1
                        call Dropping
                    .elseif level == 2
                        call Dropping1
                    .elseif level == 3
                        call Dropping2
                    .endif
                    mov ax, midx[si+4]
                    mov bx, midy[si+4]
                    inc di
                    .if level == 1
                        call Dropping
                    .elseif level == 2
                        call Dropping1
                    .elseif level == 3
                        call Dropping2
                    .endif
                    mov ax, midx[si+6]
                    mov bx, midy[si+6]
                    inc di
                    .if level == 1
                        call Dropping
                    .elseif level == 2
                        call Dropping1
                    .elseif level == 3
                        call Dropping2
                    .endif
                    dec di
                    dec di
                    dec di
                .elseif shape[di] != 9
                    mov ax, 0
                    Random2
                    mov al, randnum
                    mov shape[di], al
                    mov ax, midx[si]
                    mov bx, midy[si]
                    call RandomShape
                    inc di
                    mov ax, 0
                    Random
                    mov al, randnum
                    mov shape[di+1], al
                    mov ax, midx[si+2]
                    mov bx, midy[si+2]
                    call RandomShape
                    inc di
                    mov ax, 0
                    Random2
                    mov al, randnum
                    mov shape[di+2], al
                    mov ax, midx[si+4]
                    mov bx, midy[si+4]
                    call RandomShape
                    inc di
                    mov ax, 0
                    Random
                    mov al, randnum
                    mov shape[di+3], al
                    mov ax, midx[si+6]
                    mov bx, midy[si+6]
                    call RandomShape
                    sub di, 3
                .endif
                mov si, 0
                mov di, 0
                .while di < 49
                    .if shape[di] == 7
                        mov holdshape, ax
                        mov ax, midx[si]
                        mov drop1, ax
                        mov bx, midy[si]
                        .if level == 1
                            call Dropping
                        .elseif level == 2
                            call Dropping1
                        .elseif level == 3
                            call Dropping2
                        .endif
                        mov ax, holdshape
                    .endif
                    inc si
                    inc si
                    inc di
                .endw
                mov si, 0
                mov di, 0
                .while di < 49
                    mov holdshape, ax
                    mov ax, midx[si]
                    mov drop1, ax
                    mov bx, midy[si]
                    mov explodeColour, 00h
                    .if shape[di] != 9
                        call squareGrey
                    .endif
                    mov ax, holdshape
                    inc si
                    inc si
                    inc di
                .endw
                mov ax, 1
                int 33h
                mov si, 0
                mov di, 0
                mov count4, 0
                mov noswap, 1
                add score, 4
                jmp check

            .elseif al != 9
                mov ax, 2
                int 33h
                Explode firstx[si], firsty[si]
                Explode firstx[si+2], firsty[si+2]
                Explode firstx[si+4], firsty[si+4]
                .if di < 42
                    mov ax, midx[si]
                    mov bx, midy[si]
                    .if level == 1
                        call Dropping
                    .elseif level == 2
                        call Dropping1
                    .elseif level == 3
                        call Dropping2
                    .endif
                    mov ax, midx[si+2]
                    mov bx, midy[si+2]
                    inc di
                    .if level == 1
                        call Dropping
                    .elseif level == 2
                        call Dropping1
                    .elseif level == 3
                        call Dropping2
                    .endif
                    mov ax, midx[si+4]
                    mov bx, midy[si+4]
                    inc di
                    .if level == 1
                        call Dropping
                    .elseif level == 2
                        call Dropping1
                    .elseif level == 3
                        call Dropping2
                    .endif
                    dec di
                    dec di
                .elseif shape[di] != 9
                    mov ax, 0
                    Random2
                    mov al, randnum
                    mov shape[di], al
                    mov ax, midx[si]
                    mov bx, midy[si]
                    call RandomShape
                    inc di
                    mov ax, 0
                    Random
                    mov al, randnum
                    mov shape[di+1], al
                    mov ax, midx[si+2]
                    mov bx, midy[si+2]
                    call RandomShape
                    inc di
                    mov ax, 0
                    Random2
                    mov al, randnum
                    mov shape[di+2], al
                    mov ax, midx[si+4]
                    mov bx, midy[si+4]
                    call RandomShape
                    sub di, 2
                .endif
                mov si, 0
                mov di, 0
                .while di < 49
                    .if shape[di] == 7
                        mov holdshape, ax
                        mov ax, midx[si]
                        mov drop1, ax
                        mov bx, midy[si]
                        .if level == 1
                            call Dropping
                        .elseif level == 2
                            call Dropping1
                        .elseif level == 3
                            call Dropping2
                        .endif
                        mov ax, holdshape
                    .endif
                    inc si
                    inc si
                    inc di
                .endw
                mov si, 0
                mov di, 0
                .while di < 49
                    mov holdshape, ax
                    mov ax, midx[si]
                    mov drop1, ax
                    mov bx, midy[si]
                    mov explodeColour, 00h
                    .if shape[di] != 9
                        call squareGrey
                    .endif
                    mov ax, holdshape
                    inc si
                    inc si
                    inc di
                .endw
                mov ax, 1
                int 33h
                mov si, 0
                mov di, 0
                mov count4, 0
                mov noswap, 1
                add score, 3
                jmp check
            .endif
        .endif
        
        
        inc di
        inc si
        inc si
        inc count4
        .if count4 == 5
            add di, 2
            add si, 4
            mov count4, 0
        .endif
    .endw

    mov di, 0
    mov si, 0
    mov columndrop, 1
    .while di < 35
        mov ax, 0
        mov al, shape[di]
        .if al == shape[di+7] && al == shape[di+14] && al != 9
            mov four, 0
            .if al == shape[di+21] && di < 28
                mov ax, 2
                int 33h
                Explode firstx[si], firsty[si]
                Explode firstx[si+14], firsty[si+14]
                Explode firstx[si+28], firsty[si+28]
                Explode firstx[si+42], firsty[si+42]
                mov ax, midx[si]
                mov bx, midy[si]
                mov four, 1
                .if level == 1
                    call droppingColumn
                .elseif level == 2
                    call droppingColumn1
                .endif
                mov si, 0
                mov di, 0
                .while di < 49
                    .if shape[di] == 7
                        mov holdshape, ax
                        mov ax, midx[si]
                        mov drop1, ax
                        mov bx, midy[si]
                        .if level == 1
                            call Dropping
                        .elseif level == 2
                            call Dropping1
                        .endif
                        mov ax, holdshape
                    .endif
                    inc si
                    inc si
                    inc di
                .endw
                mov si, 0
                mov di, 0
                .while di < 49
                    .if shape[di] == 7
                        mov holdshape, ax
                        mov ax, midx[si]
                        mov drop1, ax
                        mov bx, midy[si]
                        .if level == 1
                            call Dropping
                        .elseif level == 2
                            call Dropping1
                        .endif
                        mov ax, holdshape
                    .endif
                    inc si
                    inc si
                    inc di
                .endw
                mov si, 0
                mov di, 0
                .while di < 49
                    mov holdshape, ax
                    mov ax, midx[si]
                    mov drop1, ax
                    mov bx, midy[si]
                    mov explodeColour, 00h
                    call squareGrey
                    mov ax, holdshape
                    inc si
                    inc si
                    inc di
                .endw
                mov ax, 1
                int 33h
                mov si, 0
                mov di, 0
                mov noswap, 1
                add score, 4
                jmp check
            .elseif shape[di] != 9
                mov ax, 2
                int 33h
                Explode firstx[si], firsty[si]
                Explode firstx[si+14], firsty[si+14]
                Explode firstx[si+28], firsty[si+28]
                mov ax, midx[si]
                mov bx, midy[si]
                .if level == 1
                    call droppingColumn
                .elseif level == 2
                    call droppingColumn1
                .elseif level == 3
                    call droppingColumn2
                .endif
                mov si, 0
                mov di, 0
                .while di < 49
                    .if shape[di] == 7
                        mov holdshape, ax
                        mov ax, midx[si]
                        mov drop1, ax
                        mov bx, midy[si]
                        .if level == 1
                            call Dropping
                        .elseif level == 2
                            call Dropping1
                        .elseif level == 3
                            call Dropping2
                        .endif
                        mov ax, holdshape
                    .endif
                    inc si
                    inc si
                    inc di
                .endw
                mov si, 0
                mov di, 0
                .while di < 49
                    .if shape[di] == 7
                        mov holdshape, ax
                        mov ax, midx[si]
                        mov drop1, ax
                        mov bx, midy[si]
                        .if level == 1
                            call Dropping
                        .elseif level == 2
                            call Dropping1
                        .elseif level == 3
                            call Dropping2
                        .endif
                        mov ax, holdshape
                    .endif
                    inc si
                    inc si
                    inc di
                .endw
                mov si, 0
                mov di, 0
                .while di < 49
                    mov holdshape, ax
                    mov ax, midx[si]
                    mov drop1, ax
                    mov bx, midy[si]
                    mov explodeColour, 00h
                    .if shape[di] != 9
                        call squareGrey
                    .endif
                    mov ax, holdshape
                    inc si
                    inc si
                    inc di
                .endw
                mov ax, 1
                int 33h
                mov si, 0
                mov di, 0
                mov noswap, 1
                add score, 3
                jmp check
            .endif
        .endif
        
        inc di
        inc si
        inc si

    .endw

    .if again != 2
        inc again
        jmp check
    .endif

    

    .if noswap == 0
        inc restart
        mov di, holdswap
        mov ax, holdswap
        mov dx, 0
        mov bx, 2
        mul bx
        mov si, ax
        .if index == 1
            mov ax, 2
            int 33h
            mov ax, 0
            mov ax, midx[si]
            mov x1, ax
            mov fx, ax
            mov ax, midy[si]
            mov y1, ax
            mov fy, ax 
            mov ax, midx[si+2]
            mov x2, ax
            mov sx, ax
            mov ax, midy[si+2]
            mov y2, ax
            mov sy, ax
            call Swap
            mov bx, 0
            mov bx, midx[si]
            mov x1, bx
            mov bx, midy[si]
            mov y1, bx
            mov bx, midx[si+2]
            mov x2, bx
            mov bx, midy[si+2]
            mov y2, bx

            add x1, 14
            sub y1, 14

            mov fillvert, 0

            .while fillvert != 28
                mov al, 0Fh
                mov ah, 0ch
                mov cx, x1
                mov dx, y1
                int 10h
                inc y1
                inc fillvert
            .endw
            mov ax, 1
            int 33h

            .elseif index == 2
                mov ax, 2
                int 33h
                mov ax, 0
                mov ax, midx[si]
                mov x1, ax
                mov fx, ax
                mov ax, midy[si]
                mov y1, ax
                mov fy, ax
                mov ax, midx[si+14]
                mov x2, ax
                mov sx, ax
                mov ax, midy[si+14]
                mov y2, ax
                mov sy, ax
                call Swap
                mov bx, 0
                mov bx, midx[si]
                mov x1, bx
                mov bx, midy[si]
                mov y1, bx
                mov bx, midx[si+14]
                mov x2, bx
                mov bx, midy[si+14]
                mov y2, bx

                sub x1, 14
                sub y1, 14

                mov fillvert, 0

                .while fillvert != 28
                    mov al, 0Fh
                    mov ah, 0ch
                    mov cx, x1
                    mov dx, y1
                    int 10h
                    inc x1
                    inc fillvert
                .endw
                mov ax, 1
                int 33h
            .elseif index == 3
                mov ax, 2
                int 33h
                mov ax, 0
                mov ax, midx[si]
                mov x1, ax
                mov fx, ax
                mov ax, midy[si]
                mov y1, ax
                mov fy, ax
                mov ax, midx[si-14]
                mov x2, ax
                mov sx, ax
                mov ax, midy[si-14]
                mov y2, ax
                mov sy, ax
                call Swap
                mov bx, 0
                mov bx, midx[si]
                mov x1, bx
                mov bx, midy[si]
                mov y1, bx
                mov bx, midx[si-14]
                mov x2, bx
                mov bx, midy[si-14]
                mov y2, bx
                sub x1, 14
                add y1, 14

                mov fillvert, 0

                .while fillvert != 28
                    mov al, 0Fh
                    mov ah, 0ch
                    mov cx, x1
                    mov dx, y1
                    int 10h
                    inc x1
                    inc fillvert
                .endw

                mov ax, 1
                int 33h

            .elseif index == 4
                mov ax, 2
                int 33h
                mov ax, 0
                mov ax, midx[si]
                mov x1, ax
                mov fx, ax
                mov ax, midy[si]
                mov y1, ax
                mov fy, ax
                mov ax, midx[si-2]
                mov x2, ax
                mov sx, ax
                mov ax, midy[si-2]
                mov y2, ax
                mov sy, ax
                call Swap
                mov bx, 0
                mov bx, midx[si]
                mov x1, bx
                mov bx, midy[si]
                mov y1, bx
                mov bx, midx[si-2]
                mov x2, bx
                mov bx, midy[si-2]
                mov y2, bx

                sub x1, 14
                sub y1, 14

                mov fillvert, 0

                .while fillvert != 28
                    mov al, 0Fh
                    mov ah, 0ch
                    mov cx, x1
                    mov dx, y1
                    int 10h
                    inc y1
                    inc fillvert
                .endw

                mov ax, 1
                int 33h
        .endif
        ;inc finish
    .endif
    mov index, 0

    mov ax, 1
    int 33h


    .while count3 < 2

        ;selecting a box
        mov ax, 5
        .while ax != 1 && ax != 2
            secondClickDelay
            Delay2
            Delay2
            mov ax, 5
            int 33h
        .endw

        mov mousex, cx
        mov mousey, dx

        ;dividing x axis by 2 as default is 640x200
        MOV AX, mousex
        MOV DX, 0
        MOV BX, 2
        DIV BX
        mov cx, ax
        mov dx, mousey


        .if count3 == 1
            mov si, index
            mov di, index1
            .if shape[di] == 6
                mov explodeflag, 1
            .endif
    
            .if cx > thirdx[si+2] && cx < fourthx[si+2] && dx > firsty[si+2] && dx < thirdy[si+2] && shape[di+1] != 9
                mov ax, 2
                int 33h
                mov ax, 0
                mov ax, midx[si]
                mov x1, ax
                mov fx, ax
                mov ax, midy[si]
                mov y1, ax
                mov fy, ax 
                mov ax, midx[si+2]
                mov x2, ax
                mov sx, ax
                mov ax, midy[si+2]
                mov y2, ax
                mov sy, ax
                
                mov ax, midx[si+2]
                mov bx, midy[si+2]
                inc di
                mov drop1, ax
                mov explodeColour, 08h
                call squareGrey
                secondClickDelay
                mov explodeColour, 00h
                call squareGrey
                dec di
                mov ax, midx[si]
                mov bx, midy[si]
                mov drop1, ax
                call squareGrey
                mov ax, 0
                mov bx, 0

                mov index, 1
                call Swap
                mov bx, 0
                mov bx, midx[si]
                mov x1, bx
                mov bx, midy[si]
                mov y1, bx
                mov bx, midx[si+2]
                mov x2, bx
                mov bx, midy[si+2]
                mov y2, bx

                add x1, 14
                sub y1, 14

                mov fillvert, 0

                .while fillvert != 28
                    mov al, 0Fh
                    mov ah, 0ch
                    mov cx, x1
                    mov dx, y1
                    int 10h
                    inc y1
                    inc fillvert
                .endw

                mov storecoord, si
                mov storeshape, di
                mov si, 0
                mov di, 0
                .while di < 49
                    mov holdshape, ax
                    mov ax, midx[si]
                    mov drop1, ax
                    mov bx, midy[si]
                    mov explodeColour, 00h
                    .if shape[di] != 9
                        call squareGrey
                    .endif

                    mov ax, holdshape
                    inc si
                    inc si
                    inc di
                .endw
                mov di, storeshape
                mov si, storecoord
                mov ax, 0
                mov bx, 0
                
                .if explodeflag == 1
                    mov shape[di+1], 7
                    call Explosion
                    mov ax, 1
                    int 33h
                    inc count3
                    .break
                .else
                    mov ax, 1
                    int 33h
                    inc count3
                    .break
                .endif
            .elseif cx > thirdx[si+14] && cx < fourthx[si+14] && dx > firsty[si+14] && dx < thirdy[si+14] && shape[di+7] != 9
                mov ax, 2
                int 33h
                mov ax, 0
                mov ax, midx[si]
                mov x1, ax
                mov fx, ax
                mov ax, midy[si]
                mov y1, ax
                mov fy, ax
                mov ax, midx[si+14]
                mov x2, ax
                mov sx, ax
                mov ax, midy[si+14]
                mov y2, ax
                mov sy, ax

                mov ax, midx[si+14]
                mov bx, midy[si+14]
                add di, 7
                mov drop1, ax
                mov explodeColour, 08h
                call squareGrey
                secondClickDelay
                mov explodeColour, 00h
                call squareGrey
                sub di, 7
                mov ax, midx[si]
                mov bx, midy[si]
                mov drop1, ax
                call squareGrey
                mov ax, 0
                mov bx, 0

                mov index, 2
                call Swap
                mov bx, 0
                mov bx, midx[si]
                mov x1, bx
                mov bx, midy[si]
                mov y1, bx
                mov bx, midx[si+14]
                mov x2, bx
                mov bx, midy[si+14]
                mov y2, bx

                sub x1, 14
                sub y1, 14

                mov fillvert, 0

                .while fillvert != 28
                    mov al, 0Fh
                    mov ah, 0ch
                    mov cx, x1
                    mov dx, y1
                    int 10h
                    inc x1
                    inc fillvert
                .endw

                mov storecoord, si
                mov storeshape, di
                mov si, 0
                mov di, 0
                .while di < 49
                    mov holdshape, ax
                    mov ax, midx[si]
                    mov drop1, ax
                    mov bx, midy[si]
                    mov explodeColour, 00h
                    .if shape[di] != 9
                        call squareGrey
                    .endif
                    mov ax, holdshape
                    inc si
                    inc si
                    inc di
                .endw
                mov di, storeshape
                mov si, storecoord
                mov ax, 0
                mov bx, 0

                .if explodeflag == 1
                    mov shape[di+7], 7
                    call Explosion
                    mov ax, 1
                    int 33h
                    inc count3
                    .break
                .else
                    mov ax, 1
                    int 33h
                    inc count3
                    .break
                .endif
            .elseif cx > thirdx[si-14] && cx < fourthx[si-14] && dx > firsty[si-14] && dx < thirdy[si-14] && shape[di-7] != 9
                mov ax, 2
                int 33h
                mov ax, 0
                mov ax, midx[si]
                mov x1, ax
                mov fx, ax
                mov ax, midy[si]
                mov y1, ax
                mov fy, ax
                mov ax, midx[si-14]
                mov x2, ax
                mov sx, ax
                mov ax, midy[si-14]
                mov y2, ax
                mov sy, ax


                mov ax, midx[si-14]
                mov bx, midy[si-14]
                sub di, 7
                mov drop1, ax
                mov explodeColour, 08h
                call squareGrey
                secondClickDelay
                mov explodeColour, 00h
                call squareGrey
                add di, 7
                mov ax, midx[si]
                mov bx, midy[si]
                mov drop1, ax
                call squareGrey
                mov ax, 0
                mov bx, 0

                mov index, 3
                call Swap

                mov bx, 0
                mov bx, midx[si]
                mov x1, bx
                mov bx, midy[si]
                mov y1, bx
                mov bx, midx[si-14]
                mov x2, bx
                mov bx, midy[si-14]
                mov y2, bx
                sub x1, 14
                add y1, 14

                mov fillvert, 0

                .while fillvert != 28
                    mov al, 0Fh
                    mov ah, 0ch
                    mov cx, x1
                    mov dx, y1
                    int 10h
                    inc x1
                    inc fillvert
                .endw

                mov storecoord, si
                mov storeshape, di
                mov si, 0
                mov di, 0
                .while di < 49
                    mov holdshape, ax
                    mov ax, midx[si]
                    mov drop1, ax
                    mov bx, midy[si]
                    mov explodeColour, 00h
                    .if shape[di] != 9
                        call squareGrey
                    .endif
                    mov ax, holdshape
                    inc si
                    inc si
                    inc di
                .endw
                mov di, storeshape
                mov si, storecoord
                mov ax, 0
                mov bx, 0

                .if explodeflag == 1
                    mov shape[di-7], 7
                    call Explosion
                    mov ax, 1
                    int 33h
                    inc count3
                    .break
                .else
                    mov ax, 1
                    int 33h
                    inc count3
                    .break
                .endif
            .elseif cx > thirdx[si-2] && cx < fourthx[si-2] && dx > firsty[si-2] && dx < thirdy[si-2] && shape[di-1] != 9
                mov ax, 2
                int 33h
                mov ax, 0
                mov ax, midx[si]
                mov x1, ax
                mov fx, ax
                mov ax, midy[si]
                mov y1, ax
                mov fy, ax
                mov ax, midx[si-2]
                mov x2, ax
                mov sx, ax
                mov ax, midy[si-2]
                mov y2, ax
                mov sy, ax

                mov ax, midx[si-2]
                mov bx, midy[si-2]
                dec di
                mov drop1, ax
                mov explodeColour, 08h
                call squareGrey
                secondClickDelay
                mov explodeColour, 00h
                call squareGrey
                inc di
                mov ax, midx[si]
                mov bx, midy[si]
                mov drop1, ax
                call squareGrey
                mov ax, 0
                mov bx, 0

                mov index, 4
                call Swap
                mov bx, 0
                mov bx, midx[si]
                mov x1, bx
                mov bx, midy[si]
                mov y1, bx
                mov bx, midx[si-2]
                mov x2, bx
                mov bx, midy[si-2]
                mov y2, bx

                sub x1, 14
                sub y1, 14

                mov fillvert, 0

                .while fillvert != 28
                    mov al, 0Fh
                    mov ah, 0ch
                    mov cx, x1
                    mov dx, y1
                    int 10h
                    inc y1
                    inc fillvert
                .endw

                mov storecoord, si
                mov storeshape, di
                mov si, 0
                mov di, 0
                .while di < 49
                    mov holdshape, ax
                    mov ax, midx[si]
                    mov drop1, ax
                    mov bx, midy[si]
                    mov explodeColour, 00h
                    .if shape[di] != 9
                        call squareGrey
                    .endif
                    mov ax, holdshape
                    inc si
                    inc si
                    inc di
                .endw
                mov di, storeshape
                mov si, storecoord
                mov ax, 0
                mov bx, 0


                .if explodeflag == 1
                    mov shape[di-1], 7
                    call Explosion
                    mov ax, 1
                    int 33h
                    inc count3
                    .break
                .else
                    mov ax, 1
                    int 33h
                    inc count3
                    .break
                .endif
            .else
                mov ax, midx[si]
                mov bx, midy[si]
                mov drop1, ax
                mov explodeColour, 00h
                call squareGrey
                mov ax, 0
                mov bx, 0
                mov count3, 2
                mov index, 0
                ;inc finish
            .endif
        
        .endif

        ;first click
        mov count, 49
        mov bx, 0
        mov bx, count3
        mov store1, bx
        mov bx, 0
        mov si, 0
        mov di, 0
        .while count != 0 && count3 == 0
            mov explodeflag, 0
            .if cx > thirdx[si] && cx < fourthx[si] && dx > firsty[si] && dx < thirdy[si] && shape[di] != 9
                mov ax, 2
                int 33h
                mov index, si
                mov index1, di
                mov holdswap, di
                Fillblack firstx[si], firsty[si], 08h, midx[si], midy[si], di
                mov ax, 1
                int 33h
                inc count3
                .break
            .endif
            inc si
            inc si
            inc di
            dec count
        .endw

        mov ax, 4
        mov cx, mousex
        mov dx, mousey
        int 33h


    .endw

ret
Moves endp


main proc
;loading leaderboard file
mov ah, 3ch 
mov dx, offset fname 
mov cl, 1
int 21H
mov handle, ax
;front and instruction page
mov cx,pgnum
page1
l1:
mov ah, 01h
int 21H
mov movpg, al
cmp al, 13
je nextpg
jmp l1
nextpg:
inc cx
mov bx, cx
;mov bx, 1
int 10h
;;open an existing file;;storing player name in file
    mov ah, 3dh
    mov dx, offset fname
    mov al, 1;writing mode, 0:reading, 2 read write both
    int 21h
    mov handle, ax 

    mov ah, 40h;write karna hai
    mov bx, handle;kon si file
    mov cx, lengthof playername;
    mov dx, offset playername
    int 21h

    mov ah, 40h;write karna hai
    mov bx, handle;kon si file
    mov cx, lengthof arr;
    mov dx, offset arr
    int 21h
        
    ;closing file
    mov ah, 3eh
    int 21H
bgg
;;MOV TO THE NEXT PAGE
jmp l2
l2:
mov ah, 01h
int 21H
mov movpg, al
cmp al, 13
je nextpg1
jmp l2
nextpg1:
inc cx
mov bx, cx
;mov bx, 1
int 10h
jmp raheel

raheel:
;name with border
;returning board back to black
mov ah, 06h
mov al, 0
mov bh, 00h
mov cx, 0
mov dh, 80
mov dl, 80
int 10h

mov ah, 02H
mov bh, 00h
mov dh, 20
mov dl, 5
int 10H


mov count1, 38
mov count2, 152

Rectangle count1, count2, 0Fh

;Left of main board (colour cyan)

mov count1, 122
mov count2, 198

.while count2 != 0
    mov al, 0Bh
    mov ah, 0ch
    mov cx, count1
    mov dx, count2
    int 10h
    dec count2
.endw

mov count1, 1
mov count2, 198

.while count2 != 2
    Fill 0Bh, 122
    dec count2
.endw

;displaying name and lives:

mov ah, 02h
mov bh, 00h
mov dh, 1
mov dl, 1
int 10h
mov dx, offset name1
mov ah, 09H
int 21H

mov ah, 02h
mov bh, 00h
mov dh, 8
mov dl, 1
int 10h
mov dx, offset playername
mov ah, 09h
int 21h

mov ah, 02h
mov bh, 00h
mov dh, 10
mov dl, 1
int 10h
mov dx, offset arr
mov ah, 09h
int 21h

mov ah, 02h
mov bh, 00h
mov dh, 12
mov dl, 1
int 10h
mov dx, offset lives
mov ah, 09h
int 21h

mov ah, 02h
mov bh, 00h
mov dh, 12
mov dl, 8
int 10h
mov dl, livesnum
add dl, 48
mov ah, 02h
int 21h

;displaying name and lives:

mov ah, 02h
mov bh, 00h
mov dh, 1
mov dl, 1
int 10h
mov dx, offset name1
mov ah, 09H
int 21H

mov ah, 02h
mov bh, 00h
mov dh, 8
mov dl, 1
int 10h
mov dx, offset playername
mov ah, 09h
int 21h

mov ah, 02h
mov bh, 00h
mov dh, 10
mov dl, 1
int 10h
mov dx, offset arr
mov ah, 09h
int 21h

mov ah, 02h
mov bh, 00h
mov dh, 12
mov dl, 1
int 10h
mov dx, offset lives
mov ah, 09h
int 21h

mov ah, 02h
mov bh, 00h
mov dh, 12
mov dl, 8
int 10h
mov dl, livesnum
add dl, 48
mov ah, 02h
int 21h

mov ah, 02h
mov bh, 00h
mov dh, 14
mov dl, 1
int 10h
mov dx, offset target
mov ah, 09h
int 21h

mov ah, 02h
mov bh, 00h
mov dh, 16
mov dl, 1
int 10h
mov dx, offset scorestr
mov ah, 09h
int 21h


;making actual board
mov ax, 08h
mov cx, 0
mov dx, 198
int 33h
mov ax, 07h
mov cx, 246
mov dx, 638
int 33h
mov cx, 0
mov dx, 0
mov ax, 0

mov count1, 123
mov count2, 170


.if level == 1
call DrawBoard
.elseif level == 2
call DrawBoard1
.elseif level == 3
call DrawBoard3
.endif

GettingCornersOfBoxes


mov finish, 14

.while finish != 0
        .if restart == 3
            sub score, 10
            mov restart, 0
            mov di, 0
            .while di < 49
                .if shape[di] <= 6
                    Random
                    mov ax, 0
                    mov al, randnum
                    mov shape[di], al
                .endif
                inc di
            .endw

            mov si, 0
            mov di, 0
            .while di < 49
                mov holdshape, ax
                mov ax, midx[si]
                mov drop1, ax
                mov bx, midy[si]
                mov explodeColour, 00h
                .if shape[di] != 9
                    call squareGrey
                .endif
                mov ax, holdshape
                inc si
                inc si
                inc di
            .endw
        .endif
        mov si, 0
        mov di, 0
        mov again, 0
        .if finish == 4 || finish == 8 || finish == 12
            .if level == 1
                RandomBomb
                mov ax, 0
                mov al, randnum
                mov si, 0
                mov di, 0
                .while di < 49
                    .if di == ax
                        mov holdshape, ax
                        mov ax, midx[si]
                        mov drop1, ax
                        mov bx, midy[si]
                        call squareBlack
                        mov shape[di], 6
                        mov drop, bx
                        Bomb drop1, drop
                        mov ax, holdshape
                    .endif
                    inc si
                    inc si
                    inc di
                .endw
            .elseif level == 2
                RandomBomb
                mov ax, 0
                mov al, randnum
                .while al == 0 || al == 3 || al == 6 || al == 7 || al == 13 || al == 21 || al == 27 || al == 35 || al == 41 || al == 42 || al == 45 || al == 48
                    inc al
                .endw
                mov si, 0
                mov di, 0
                .while di < 49
                    .if di == ax
                        mov holdshape, ax
                        mov ax, midx[si]
                        mov drop1, ax
                        mov bx, midy[si]
                        call squareBlack
                        mov shape[di], 6
                        mov drop, bx
                        Bomb drop1, drop
                        mov ax, holdshape
                    .endif
                    inc si
                    inc si
                    inc di
                .endw
            .elseif level == 3
                RandomBomb
                mov ax, 0
                mov al, randnum
                .while al >= 21 && al <= 27 || al == 3 || al == 10 || al == 17 || al == 31 || al == 38 || al == 45
                    inc al
                .endw
                mov si, 0
                mov di, 0
                .while di < 49
                    .if di == ax
                        mov holdshape, ax
                        mov ax, midx[si]
                        mov drop1, ax
                        mov bx, midy[si]
                        call squareBlack
                        mov shape[di], 6
                        mov drop, bx
                        Bomb drop1, drop
                        mov ax, holdshape
                    .endif
                    inc si
                    inc si
                    inc di
                .endw
            .endif
        .endif
    mov ax, 0
    mov si, 0
    mov di, 0 
    call Moves
    mov count3, 0
    dec finish

    mov si, 0
    mov di, 0
    .while di < 49
        .if shape[di] == 7
            mov holdshape, ax
            mov shape[di], 4
            mov ax, midx[si]
            mov drop1, ax
            mov bx, midy[si]
            mov explodeColour, 00h
            .if shape[di] == 9
                call Block
            .else
                call squareGrey
            .endif
            mov ax, holdshape
        .endif
        inc si
        inc si
        inc di
    .endw
.endw

mov ah, 02h
mov bh, 02H
mov dh, 14
mov dl, 8
int 10h 
mov var2, 0
output score, var2


;check to see if middle coordinates are intact
; mov count, 49
; mov si, 0
; .while count != 0
;     mov al , 02H
;     mov ah, 0ch
;     mov cx, midx[si]
;     mov dx, midy[si]
;     int 10h
;     inc si
;     inc si
;     dec count
; .endw


MOV AH,4CH
INT 21h ; return 0

main endp
END