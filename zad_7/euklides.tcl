#!/usr/bin/env tclsh
set x [gets stdin]
set y [gets stdin]

proc nwd {a b} {
    while {!($b == 0)} {
        set c [expr $a % $b]
        set a $b
        set b $c
        }
    return $a
}

puts [nwd $x $y]