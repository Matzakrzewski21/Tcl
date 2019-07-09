#!/usr/bin/env tclsh

puts "How many rows stars do you want?"
set quantity [gets stdin]

for {set i 0} {$i < $quantity} {incr i} {
    for {set j 0} {$j < $quantity} {incr j} {
        puts -nonewline "*"
    }
    puts " "
}