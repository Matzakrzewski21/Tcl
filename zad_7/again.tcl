#!/usr/bin/env tclsh

proc check {var} {
    while {![regexp -all {[0-9]} $var]} {
        puts "Wrong input. Try again with digits"
        set var [gets stdin]
    }
    return $var
}

puts "Podaj bok a"
set var1 [check [gets stdin]]
puts "Podaj bok b"
set var2 [check [gets stdin]]
puts "Podaj bok c"
set var3 [check [gets stdin]]

proc triangle {var1 var2 var3} {
    while {True} {
        if {[expr $var1 * $var1 + $var2 * $var2] == [expr $var3 * $var3]} {
            puts "To jest trójkąt prostokątny"
            break
        } else {
            puts "To nie jest trójkąt prostokątny
            Wprowadź nowe dane żeby sprawdzić inna kombinajcę"
            puts " Podaj bok a"
            set $var1 [gets stdin]
            puts "Podaj bok b"
            set $var2 [gets stdin]
            puts "podaj bok c"
            set $var3 [gets stdin]
    }
}
}
set result [triangle $var1 $var2 $var3]
#puts $result


