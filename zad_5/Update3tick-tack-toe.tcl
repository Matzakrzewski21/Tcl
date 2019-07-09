#!/usr/bin/env tclsh

proc randelem {list} {     
    lindex $list [expr {int(rand()*[llength $list])}]
}

proc step_2 {x} {
    puts "
========= Computer choices =========="
    set empty [lsearch -all $x "_"]
    set x [randelem $empty]
    return $x
}


proc select_char {char} {
    puts "
========== Select x or o ============"
    set char [gets stdin] 
    if {$char == "x" || $char == "o" || $char == "X" || $char == "O"} {
            set char $char
        } else {
                while {!($char == "x" || $char == "o" || $char == "X" || $char == "O")} {
                    puts "Wrong input"
                    set char [gets stdin]}
                }
    return $char
}
        
puts "
======= TICK === TACK === TOE ======="
puts "
=====================================
===== Click number in range 1-9 =====
===== and select place on board =====
====================================="

set matrixstart "| 1 | 2 | 3 | | 4 | 5 | 6 | | 7 | 8 | 9 |"
set up [lrange $matrixstart 0 6]
set middle [lrange $matrixstart 7 13]
set down [lrange $matrixstart 14 end]
puts $up
puts $middle
puts $down 
set choice [gets stdin]
set matrix "| _ | _ | _ | | _ | _ | _ | | _ | _ | _ |"
set player [select_char char]
if {$player == "x"} {
    set computer "o"
} elseif {$player == "o"} {
    set computer "x"
} elseif {$player == "X"} {
    set computer "O"
} elseif {$player == "O"} {
    set computer "X"}




proc board {indx sym matrix} {
    #indx w ktorym indeksie
    #sym kolko czy krzyzyk
    #matrix poprzednia "lista"
    lset matrix $indx $sym
    set up [lrange $matrix 0 6]
    set middle [lrange $matrix 7 13]
    set down [lrange $matrix 14 end]
    puts $up
    puts $middle
    puts $down    
    return $matrix
}

proc win {matrix} {  
    set sym1 {ooo}
    set sym11 {OOO}
    set sym2 {xxx}
    set sym22 {XXX}
    set win1 [lindex $matrix 1][lindex $matrix 3][lindex $matrix 5]
    set win2 [lindex $matrix 8][lindex $matrix 10][lindex $matrix 12]
    set win3 [lindex $matrix 15][lindex $matrix 17][lindex $matrix 19]
    set win4 [lindex $matrix 1][lindex $matrix 8][lindex $matrix 15]
    set win5 [lindex $matrix 3][lindex $matrix 10][lindex $matrix 17]
    set win6 [lindex $matrix 5][lindex $matrix 12][lindex $matrix 19]
    set win7 [lindex $matrix 1][lindex $matrix 10][lindex $matrix 19]
    set win8 [lindex $matrix 5][lindex $matrix 5][lindex $matrix 15]    

    if {$win1 == $sym1 || $win1 == $sym2 || $win2 == $sym1 || $win2 == $sym2 || $win3 == $sym1 || $win3 == $sym2 || $win4 == $sym1 || $win4 == $sym2 || $win5 == $sym1 || $win5 == $sym2 || $win6 == $sym1 || $win6 == $sym2 || $win7 == $sym1 || $win7 == $sym2 || $win8 == $sym1 || $win8 == $sym2 || $win1 == $sym11 || $win1 == $sym22 || $win2 == $sym11 || $win2 == $sym22 || $win3 == $sym11 || $win3 == $sym22 || $win4 == $sym11 || $win4 == $sym22 || $win5 == $sym11 || $win5 == $sym22 || $win6 == $sym11 || $win6 == $sym22 || $win7 == $sym11 || $win7 == $sym22 || $win8 == $sym11 || $win8 == $sym22} {
        puts "
======================================
==========YOU ARE THE WINNER==========
======================================"
        exit
    }
    return $matrix
}

while {$choice >= 1 || $choice <= 9} {
    set choice2 $choice
    switch $choice2 {
        1 { set matrix [board 1 $player $matrix]
            win $matrix
            set matrix [board [step_2 $matrix] $computer $matrix]
            win $matrix
            puts "Select next place"
            set choice [gets stdin]}
        2 { set matrix [board 3 $player $matrix]
            win $matrix
            set matrix [board [step_2 $matrix] $computer $matrix]
            win $matrix
            puts "Select next place"
            set choice [gets stdin]}
        3 { set matrix [board 5 $player $matrix]
            win $matrix
            set matrix [board [step_2 $matrix] $computer $matrix]
            win $matrix
            puts "Select next place"
            set choice [gets stdin]}
        4 { set matrix [board 8 $player $matrix]
            win $matrix
            set matrix [board [step_2 $matrix] $computer $matrix]
            win $matrix
            puts "Select next place"
            set choice [gets stdin]}
        5 { set matrix [board 10 $player $matrix]
            win $matrix
            set matrix [board [step_2 $matrix] $computer $matrix]
            win $matrix
            puts "Select next place"
            set choice [gets stdin]}
        6 { set matrix [board 12 $player $matrix]
            win $matrix
            set matrix [board [step_2 $matrix] $computer $matrix]
            win $matrix
            puts "Select next place"
            set choice [gets stdin]}
        7 { set matrix [board 15 $player $matrix]
            win $matrix
            set matrix [board [step_2 $matrix] $computer $matrix]
            win $matrix
            puts "Select next place"
            set choice [gets stdin]}
        8 { set matrix [board 17 $player $matrix]
            win $matrix
            set matrix [board [step_2 $matrix] $computer $matrix]
            win $matrix
            puts "Select next place"
            set choice [gets stdin]}
        9 { set matrix [board 19 $player $matrix]
            win $matrix
            set matrix [board [step_2 $matrix] $computer $matrix]
            win $matrix
            puts "Select next place"
            set choice [gets stdin]}
        default {puts "
            Wrong range! 
            Please try again (1-9)"
            set choice [gets stdin]}
    }
}
