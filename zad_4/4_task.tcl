#!/usr/bin/env tclsh

proc cal {} {
    puts "
    ================================================
    ============== SIMPLE CALCULATOR ===============
    ================================================"
    puts "
    Enter first digit(s)"
    set var_1 [gets stdin]
    puts "
    Enter symbol mathematical activity (+ - * /)"
    set symbol [gets stdin]
    while {$symbol != "/" && $symbol != "*" && $symbol != "-" && $symbol != "+"} {
        puts "
            !!!!! Wrong symbol choosen !!!!!
            Try again or press ctrl+c to exit"
        set symbol [gets stdin] }
    puts "
    Enter second digit(s)"
    set var_2 [gets stdin]i
    while {regexp -inline -all {[0-9]} $var_2 } {
        puts "
            Wrong digit
            Try again with numbers"
        set var_2 [gets stdin]
        }
}

#starterpack
set start [cal]
puts $start

