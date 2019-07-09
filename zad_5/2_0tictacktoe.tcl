#!/usr/bin/env tclsh

proc board {p } {
    set matrix "| _ | _ | _ | | _ | _ | _ | | _ | _ | _ |"
    
    
    set up [lrange $matrix 0 6]
    set middle [lrange $matrix 7 13]
    set down [lrange $matrix 14 end]
    puts $up
    puts $middle
    puts $down


proc start {x y} {
    puts "Hello
    your



