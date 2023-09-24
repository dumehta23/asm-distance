;Author: Drashti Mehta
;Date: 09/05/2023
;Program name: 240 Section 03 Assignment 01 - Las Vegas

extern printf
extern scanf


section .data
    prompt_1 db 'Please enter the speed for the initial segment of the trip: ', 0
    prompt_2 db 'For how many miles will you maintain this average speed? ', 0
    prompt_3 db 'What will be your speed during the final segment of the  trip (mph)? ', 0
    format_in db "%lf", 0
    
    format_out1 db 'Your average speed will be %lf mph.', 10, 0
    format_out2 db 'The total travel time will be %lf hours.', 10, 0
   
  
    totalDistance dq 253.5
  
   
section .text
    global calc_totalTime 

calc_totalTime:
    ; Save registers that printf may modify
    push rdi            
    push rsi
    push rax
   
 
   ; prompt message 1  
    mov rax, 0
    mov rdi, prompt_1
    call printf
    
    mov rax, 0
    mov rdi, format_in
    mov rsi, rsp
    call scanf
    movsd xmm11, qword [rsp]
    
  
    
    
    
    
    ; prompt message 2  
    mov rax, 0
    mov rdi, prompt_2
    call printf
    
    mov rax, 0
    mov rdi, format_in
    mov rsi, rsp
    call scanf
    movsd xmm12, qword [rsp]
 
    
    
    
    
    ; prompt message 3  
    mov rax, 0 
    mov rdi, prompt_3
    call printf
    
    mov rax, 0
    mov rdi, format_in
    mov rsi, rsp
    call scanf
    movsd xmm13, qword [rsp]
    
  
    
    ; Calculate averageSpeed
    ; xmm11= initial speed xmm12 = initial distance xmm13 = final speed
    
    movq xmm8, xmm12
    movq xmm9, qword [totalDistance]
    divsd xmm8, xmm9 
    mulsd xmm8, xmm11
    
    movq xmm14, qword [totalDistance]
    movq xmm15, qword [totalDistance]
    subsd xmm14, xmm12
    divsd xmm14, xmm15
    mulsd xmm14, xmm13
    
    addsd xmm14, xmm8
    
    mov rax, 1
    mov rdi, format_out1 
    movq rsi, xmm14
    movsd xmm0, xmm14
    call printf
    
    ; Calculate totaltime
    divsd xmm15, xmm14
   
    
    mov rax, 1
    mov rdi, format_out2
    movq rsi, xmm15
    movsd xmm0, xmm15
    call printf
    
 
    
    ; Restore registers
    pop rax             
    pop rsi
    pop rdi
  
    movq [rdi], xmm15
      
    ret
