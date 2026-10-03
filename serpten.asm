;=============basic============
%macro write_host 2
	mov rax,1
	mov rdi,1
	mov rsi,%1 ;printible text
	mov rdx,%2 ;printible text lenght
%endmacro
%macro read_host 2
	mov rax,0
	mov rdi,0
	mov rsi,%1
	mov rdx,%2
%endmacro

%macro exit_program
	mov rax,60
	mov rdi,1
%endmacro

;=======File Process===========
%macro make_file 1
	mov rax,2 ;sys open
	mov rdi,%1 ;write file
	mov rsi,65 ;create file
	mov rdx,0644o ;premissions
%endmacro
%macro write_file 2
    
    mov rax, 2                      
    mov rdi, %1                  
    mov rsi, 65                     
    mov rdx, 0644o                  
    syscall                      
    

    mov rbx, rax                    

    mov rax, 1                      
    mov rdi, rbx                   
    mov rsi, %2                    
    mov rdx, %2_len                
    syscall       

    
    mov rax, 3                     
    mov rdi, rbx                
    syscall
%endmacro
%macro apend_file 3
	mov rax,2
	mov rdi,%1
	mov rsi,1089
	mov rdx,0644o
	syscall
	mov r12, rax  

	mov rax, 1          
    mov rdi, r12
    mov rsi, %2
    mov rdx, %3
    syscall    

    mov rax, 3         
    mov rdi, r12
    syscall
%endmacro
%macro read_file 3
	mov rax,2
	mov rdi,%1
	mov rsi,0
	mov rdx,0
	syscall
	mov r12,rax

	mov rax,0
	mov rdi,r12
	mov rsi,%2
	mov rdx,%3
	syscall
	mov rax, 3  
	mov rdi,r12
	syscall
%macro delete_file 1
	mov rax,87
	mov rdi,%1
	syscall
%endmacro

;=========Dicrectory===========
%macro create_folder 1
	mov rax,83
	mov rdi,%1
	mov rsi,0755o
	syscall
%endmacro 
%macro delete_folder 1
	mov rax,84
	mov rdi,%1
	syscall
%endmacro
%macro Check_file 1
	mov rax,21
	mov rdi,%1
	mov rsi,0
	syscall
%endmacro
