INCLUDE 'emu8086.inc'     
.data
op dw 1 ;operand
rez dw 1;rezultat
str db 6 dup('$') ;rezultat zecimal  

jmp code

w equ 50 ;dimensiune dreptunghi
h equ 80

code:
                        
mov ah, 0
mov al, 13h ;trecere in mod grafic 320x200
int 10h


LEA     SI, msg1
CALL    print_string

CALL    scan_num
mov op,cx 


         
;factorial
factorial:
mov ax,op
mul rez ;rezultat
mov rez,ax
dec op

mov bx,rez
mov dx,op

cmp op,1
jge factorial
            
            
mov  ax,rez
call number2string


PUTC 13
PUTC 10

LEA     SI, msg2
CALL    print_string

mov  ah, 9
mov  dx, offset str
int  21h
    
   

        
;BLOC    
                     
    ; afisare latura superioara
    mov cx, 100+w  ; coloana
    mov dx, 100
    mov al, 15
    
b1: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 100
    jae b1    
    
    ; afisare latura inferioara
    mov cx, 100+w
    mov dx, 100+h
    mov al, 15 
    
b2: mov ah, 0ch
    int 10h
    dec cx
    cmp cx, 100
    ja b2
    
    ; latura din stanga
    mov cx, 100
    mov dx, 100+h
    mov al, 15 
    
b3: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 100
    ja b3
    
    ; latura din dreapta
    mov cx, 100+w
    mov dx, 100+h
    mov al, 15  
    
b4: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 100
    ja b4
    
    ;afisare linie acoperis dreapta
    mov cx, 100+w
    mov dx, 100
    mov al, 15 
    
b5: mov ah, 0ch
    int 10h
    dec dx
    dec cx
    cmp cx, 125
    ja b5 
    
    ;afisare linie acoperis stanga
    mov cx, 100
    mov dx, 100
    mov al, 15 
        
b6: mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 125
    jb b6
      
    ;efect 3D oblic bloc jos
    mov cx, 100+w
    mov dx, 100+h
    mov al, 15  
    
b7: mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 159
    jbe b7 
     
    ;efect 3D oblic bloc sus    
    mov cx, 100+w
    mov dx, 100
    mov al, 15  
    
b8: mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 159
    jbe b8          
    
    ;efect 3D latura bloc
    mov cx, 159
    mov dx, 170
    mov al, 15  
    
b9: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 91
    jae b9 
        
    ;efect 3D acoperis
    mov cx, 159
    mov dx, 91
    mov al, 15 
    
b10: mov ah, 0ch
    int 10h
    dec cx 
    dec cx
    dec dx
    cmp cx, 125
    ja b10 


;USA
    
    ;afisare latura usa stanga         
    mov cx, 120
    mov dx, 100+h
    mov al, 15   
    
u1: mov ah, 0ch
    int 10h
    dec dx
    cmp dx, 159
    ja u1
    
    ;afisare latura usa dreapta
    mov cx, 130
    mov dx, 100+h
    mov al, 15 
    
u2: mov ah, 0ch
    int 10h 
    dec dx
    cmp dx, 159
    ja u2 
    
    ;afisare latura usa sus        
    mov cx, 130
    mov dx, 159
    mov al, 15 
    
u3: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 120
    jae u3           
 
;GEAMURI JOS 

    ;afisare geam dreapta latura sus
    mov cx, 145
    mov dx, 145
    mov al, 15

g1: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 130
    jae g1
     
    ;afisare geam dreapta latura jos
    mov cx, 145
    mov dx, 155
    mov al, 15

g2: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 130
    jae g2
    
    ;afisare geam dreapta latura dreapta
    mov cx, 145
    mov dx, 155
    mov al, 15

g3: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 145
    jae g3
    
    ;afisare geam dreapta latura stanga
    mov cx, 130
    mov dx, 155
    mov al, 15

g4: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 145
    jae g4
      
    ;afisare geam stanga latura sus
    mov cx, 120
    mov dx, 145
    mov al, 15
    
g5: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 105
    jae g5  
    
    
    ;afisare geam stanga latura jos
    mov cx, 120
    mov dx, 155
    mov al, 15
    
g6: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 105
    jae g6 
    
    
    ;afisare geam stanga latura dreapta
    mov cx, 120
    mov dx, 155
    mov al, 15
    
g7: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 145
    jae g7
    
    
    ;afisare geam stanga latura stanga
    mov cx, 105
    mov dx, 155
    mov al, 15
    
g8: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 145
    jae g8 
    
;GEAMURI MIJLOC 

    ;afisare geam dreapta latura sus
    mov cx, 145
    mov dx, 125
    mov al, 15

g1m: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 130
    jae g1m
     
    ;afisare geam dreapta latura jos
    mov cx, 145
    mov dx, 135
    mov al, 15

g2m: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 130
    jae g2m
    
    ;afisare geam dreapta latura dreapta
    mov cx, 145
    mov dx, 135
    mov al, 15

g3m: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 125
    jae g3m
    
    ;afisare geam dreapta latura stanga
    mov cx, 130
    mov dx, 135
    mov al, 15

g4m: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 125
    jae g4m
      
    ;afisare geam stanga latura sus
    mov cx, 120
    mov dx, 125
    mov al, 15
    
g5m: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 105
    jae g5m  
    
    
    ;afisare geam stanga latura jos
    mov cx, 120
    mov dx, 135
    mov al, 15
    
g6m: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 105
    jae g6m 
    
    
    ;afisare geam stanga latura dreapta
    mov cx, 120
    mov dx, 135
    mov al, 15
    
g7m: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 125
    jae g7m 
    
    
    ;afisare geam stanga latura stanga
    mov cx, 105
    mov dx, 135
    mov al, 15
    
g8m: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 125
    jae g8m 
 
;GEAMURI SUS
    
    ;afisare geam dreapta latura sus
    mov cx, 145
    mov dx, 105
    mov al, 15

g1s: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 130
    jae g1s
     
    ;afisare geam dreapta latura jos
    mov cx, 145
    mov dx, 115
    mov al, 15

g2s: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 130
    jae g2s
    
    ;afisare geam dreapta latura dreapta
    mov cx, 145
    mov dx, 115
    mov al, 15

g3s: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 105
    jae g3s
    
    ;afisare geam dreapta latura stanga
    mov cx, 130
    mov dx, 115
    mov al, 15

g4s: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 105
    jae g4s
      
    ;afisare geam stanga latura sus
    mov cx, 120
    mov dx, 105
    mov al, 15
    
g5s: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 105
    jae g5s  
    
    
    ;afisare geam stanga latura jos
    mov cx, 120
    mov dx, 115
    mov al, 15
    
g6s: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 105
    jae g6s 
    
    
    ;afisare geam stanga latura dreapta
    mov cx, 120
    mov dx, 115
    mov al, 15
    
g7s: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 105
    jae g7s 
    
    
    ;afisare geam stanga latura stanga
    mov cx, 105
    mov dx, 115
    mov al, 15
    
g8s: mov ah, 0ch
    int 10h
    dec dx 
    cmp dx, 105
    jae g8s 
    

jmp sfarsit      

start:

        ;citire de la tastatura
LEA     SI, msg3
CALL    print_string
                
PUTC    13 ; linie noua
PUTC    10
                
LEA     SI, msg4
CALL    print_string

CALL    scan_num                        
        ; verificare alegere
cmp cx,1
je sosea
cmp cx,2
je parcare 

jmp sfarsit 

        ; etapa desenare sosea
sosea:   

;SOSEA  
    
    ;afisare linie oblica sosea stanga
    mov cx, 190
    mov dx, 200
    mov al, 15 
    
s1:    
    
    mov al,7
    mov ah, 0eh
    int 10h
    
    mov ah, 0ch
    int 10h
    dec dx
    inc cx               
    cmp cx, 320
    jb s1       
    
    ;afisare linie oblica sosea mijloc 
    mov cx, 205
    mov dx, 200
    mov al, 15  
           
s2:  

    mov al,7
    mov ah, 0eh
    int 10h

    mov ah, 0ch
    int 10h
    dec dx
    inc cx      
    cmp cx, 230
    jb s2  
    
    mov cx, 250
    mov dx, 155
    mov al, 15
             
s3:   

    mov al,7
    mov ah, 0eh
    int 10h

    mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 275
    jb s3 
    
    mov cx, 300
    mov dx, 105
    mov al, 15  
           
s4: 
    
    mov al,7
    mov ah, 0eh
    int 10h
    
    mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 320
    jb s4 
    
    ;afisare linie oblica sosea drapta
    mov cx, 220
    mov dx, 200
    mov al, 15  
           
s5: 
    
    mov al,7
    mov ah, 0eh
    int 10h
    
    mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 320
    jb s5  

;END SOSEA 

jmp sfarsit                
         
           ;etapa desenare parcare   
            
parcare:
  
;PARCARE
    
    ;afisare linie oblica parcare stanga
    mov cx, 170
    mov dx, 180
    mov al, 15  
           
parcare_1: mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 190
    jb parcare_1      
    
    ;afisare linie oblica parcare dreapta
    mov cx, 280
    mov dx, 180
    mov al, 15 
            
parcare_2: mov ah, 0ch
    int 10h
    dec dx
    inc cx
    cmp cx, 300
    jb parcare_2
    
    ;afisare linie latura sus
    mov cx, 300
    mov dx, 160
    mov al, 15
parcare_3: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 260
    jae parcare_3 
    
    mov cx, 230
    mov dx, 160
    mov al, 15 
    
parcare_4: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 190
    jae parcare_4   
    
    ;afisare linie latura mijloc
    mov cx, 290
    mov dx, 170
    mov al, 15 
    
parcare_5: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 250
    jae parcare_5  
    
    mov cx, 220
    mov dx, 170
    mov al, 15   
    
parcare_6: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 180
    jae parcare_6 
    
    ;afisare linie latura jos
    mov cx, 280
    mov dx, 180
    mov al, 15  
    
parcare_7: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 240
    jae parcare_7   
    
    mov cx, 210
    mov dx, 180
    mov al, 15
    
parcare_8: mov ah, 0ch
    int 10h
    dec cx 
    cmp cx, 170
    jae parcare_8   
        
;END PARCARE
                          
jmp sfarsit                
             
      
 sfarsit:
           
    mov AH,2
    mov DH,0
    mov DL,0
    INT 10h
         
    mov ah,00
    int 16h
 jmp start   
              
              
              
;Nr de convertit se introduce in AX.
;ALGORITM : Se extrag cifrele una cate una si se introduc in stiva.
;Apoi se extrag invers pentru a crea string-ul.

proc number2string
  mov  bx, 10 ;Cifrele sunt extrase prin impartire la 10
  mov  cx, 0  ;Contor pentru cifrele extrase
cycle1:       
  mov  dx, 0  ;Necesar pentru a imparti la BX
  div  bx ;DX:AX / 10 = AX:coeficient DX:rest
  push dx ;Pastrare cifra extrasa ulterior
  inc  cx ;Incrementare contor pentru fiecare cifra extrasa
  cmp  ax, 0  
  jne  cycle1 ;Daca e diferit de 0 => LOOP 

;Preulare rezultat
  mov  si, offset str
cycle2:  
  pop  dx        
  add  dl, 48 ;Convertire cifra in caracter
  mov  [ si ], dl
  inc  si
  loop cycle2  

  ret
endp 


                                             
msg1     DB      'FACTORIAL: introduceti operand: ', 0        ; msg afisat pe ecran
msg2     DB      'Rezultat: ', 0                              ; msg afisat pe ecran   
msg3     DB      'Desenare: 1-sosea, 2-parcare     ' , 0      ; msg afisat pe ecran  
msg4     DB      'Introduceti 1 sau 2 si ENTER: ', 0          ; msg afisat pe ecran
 
 
                                                                           
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS