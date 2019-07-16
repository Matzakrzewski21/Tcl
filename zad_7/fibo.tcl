#!/usr/bin/env tclsh


proc fibo {n} {
    if {$n == 0} {
        puts $n
    }
    if {$n == 1} {
        puts $n
    }
    set a 1
    set b 1
    for {set i 2} {$i < $n} {incr i} {
        set c [expr $b + $a]
        set a $b
        set b $c
    }
    return $b
}

puts "Element pierwszy [fibo 1]"

puts "Element piaty [fibo 7]"

puts "Element dziesiaty [fibo 11]"