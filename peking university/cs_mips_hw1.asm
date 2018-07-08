# cs_mips_hw1.asm
# Author: zhaozhichao 
# Peking University coursera: Computer Organization Week3 Homework
# Test Environment： Mac OS X 10.14 & Mars4_5.jar

    .data
alphanum: .ascii "Alpha\0\0\0\0", "Bravo\0\0\0\0", "China\0\0\0\0", "Delta\0\0\0\0", "Echo\0\0\0\0\0", "Foxtrot\0\0", "Golf\0\0\0\0\0", "Hotel\0\0\0\0", "India\0\0\0\0", "Juliet\0\0\0", "Kilo\0\0\0\0\0", "Lima\0\0\0\0\0", "Mary\0\0\0\0\0", "November\0", "Oscar\0\0\0\0", "Paper\0\0\0\0", "Quebec\0\0\0", "Research\0", "Sierra\0\0\0", "Tango\0\0\0\0", "Uniform\0\0", "Victor\0\0\0", "Whisky\0\0\0", "X-ray\0\0\0\0", "Yankee\0\0\0", "Zulu\0\0\0\0\0", "zero\0\0\0\0\0", "First\0\0\0\0","Second\0\0\0", "Third\0\0\0\0", "Fourth\0\0\0", "Fifth\0\0\0\0", "Sixth\0\0\0\0", "Seventh\0\0", "Eighth\0\0\0", "Ninth\0\0\0\0", "alpha\0\0\0\0", "bravo\0\0\0\0", "china\0\0\0\0", "delta\0\0\0\0", "echo\0\0\0\0\0", "foxtrot\0\0", "golf\0\0\0\0\0", "hotel\0\0\0", "india\0\0\0\0", "juliet\0\0\0", "kilo\0\0\0\0\0", "lima\0\0\0\0\0", "mary\0\0\0\0\0", "november\0", "oscar\0\0\0\0", "paper\0\0\0\0", "quebec\0\0\0", "research\0", "sierra\0\0\0", "tango\0\0\0\0", "uniform\0\0\0", "victor\0\0\0", "whisky\0\0\0", "x-ray\0\0\0\0", "yankee\0\0\0", "zulu\0\0\0\0\0"
index: .asciiz "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"

# test segment
    .text       
    .globl main
main:
    li $s1, '\n'
    la $a0, index
    la $a1, alphanum

read:
    li $v0, 12  
    syscall
    beq $v0, '?', end     # end 
    li $t1, 0
loop:
    lb $s3, index($t1)  
    beq $v0, $s3, success  # search success
    beq $s1, $s3, fail  # search fail
    addi $t1, $t1, 1 
    j loop
 
success:
# TODO
    move $a0, $t1 # location
    mul $a0, $a0, 9
    la $t0, alphanum
    add $a0, $a0, $t0
    li $v0,4
    syscall 

    li $a0, '\n' # \n
    li $v0, 11
    syscall
    j read

# end TODO

fail:
    li $a0, '*'  
    li $v0, 4
    syscall
    move $a0, $s1 # \n
    li $v0, 11
    syscall
    j read

end:  
    li $v0, 10
    syscall