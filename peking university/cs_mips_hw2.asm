# cs_mips_hw1.asm
# Author: zhaozhichao 
# Peking University coursera: Computer Organization Week3 Homework
# Test Environment： Mac OS X 10.14 & Mars4_5.jar

# data segment
    .data
string: .byte 0:100       
find: .asciiz "Success! Location:"
not_find: .asciiz "Fail!"

# test segment
    .text       
    .globl main
main:
    li $s1, '\n'
    la $a0, string

    li $v0, 8  # input a string
    syscall
read:
    li $v0,12  # input a char
    syscall
    beq $v0,'?', end     # end the program
    li $t1, 0
loop:
    lb $s3, string($t1) 
    addi $t1, $t1, 1  
    beq $v0, $s3, success  # search success
    beq $s1, $s3, fail  # search fail
    j loop

fail:
    la $a0, not_find  # statement
    li $v0, 4
    syscall
    move $a0, $s1 # \n
    li $v0, 11
    syscall
    j read
 
success:
    la $a0, find # statement
    li $v0, 4
    syscall
    move $a0, $t1 # location  
    li $v0,1
    syscall  
    move $a0, $s1 # \n
    li $v0, 11
    syscall
    j read

end:  
    li $v0, 10
    syscall