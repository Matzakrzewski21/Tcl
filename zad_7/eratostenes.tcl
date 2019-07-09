#!/usr/bin/env tclsh

for {set i 2} {$i <= 120} {incr i} {
    lappend base $i
}

puts "
All Digits: 
$base" 

foreach mul2 $base {
    if {$mul2 % 2 != 0} {
        lappend notmul2 $mul2
    } elseif {$mul2 == 2} {
        lappend notmul2 $mul2
    }
}

foreach mul3 $notmul2 {
    if {$mul3 % 3 != 0} {
        lappend notmul3 $mul3
    } elseif {$mul3 == 3} {
        lappend notmul3 $mul3
    }
}

foreach mul5 $notmul3 {
    if {$mul5 % 5 != 0} {
        lappend notmul5 $mul5
    } elseif {$mul5 == 5} {
        lappend notmul5 $mul5
    }
}

foreach mul7 $notmul5 {
    if {$mul7 % 7 != 0} {
        lappend notmul7 $mul7
    } elseif {$mul7 == 7} {
        lappend notmul7 $mul7
    }
}

foreach mul9 $notmul7 {
    if {$mul9 % 9 != 0} {
        lappend notmul9 $mul9
    }
}

puts "
Step 1 - Without multiplicity 2: 
$notmul2"
puts "
Step 2 - Without multiplicity 3:
$notmul3"
puts "
Step 3 - Without multiplicity 5:
$notmul5"
puts "
Step 4 - Without multiplicity 7:
$notmul7"
puts "
Step 5 - Without multiplicity 9:
$notmul9"
puts [llength $notmul9]