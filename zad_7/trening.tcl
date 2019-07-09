#!/usr/bin/env tclsh

puts "How many rows stars do you want?"
set quantity [expr [gets stdin] -1]
proc fundament {var} {
    for {set i 0} {$i <= $var} {incr i} {
        puts -nonewline "*"
    }
}

puts [fundament $quantity]
for {set i 2} {$i <= $quantity} {incr i} {
    for {set j 0} {$j <= $quantity} {incr j} {
        if {$j == 0} {
        puts -nonewline "*"
        } elseif {$j == $quantity} {
            puts -nonewline "*"
        } else { 
            puts -nonewline " "
        }
    }
    puts " "
}
puts [fundament $quantity]