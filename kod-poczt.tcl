#!/usr/bin/env tclsh

puts "Podaj pierwszy kod pocztowy "
set x [join [split [gets stdin] "-"] ""]
puts "Podaj koncowy kod pocztowy: "
set y [join [split [gets stdin] "-"] ""]

for {set i $x} {$i <= $y} {incr i} {
    puts [join [concat [join [lrange [split [list $i] ""] 0 1] ""] {-} [join [lrange [split [list $i] ""] 2 end]]] ""]
}
