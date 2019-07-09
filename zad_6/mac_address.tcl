#!/usr/bin/env tclsh
puts "Enter Mac Address"
set input [gets stdin]
set l_input [split $input ""]
while {[llength $l_input] != 12} {
    puts "Wrong Mac Address
    Try Again"
    set input [gets stdin]
    set l_input [split $input ""]}

set oui [lrange $l_input 0 5]
set mac [lrange $l_input 6 11]

set oui2 [join [lreplace [lreplace [lreplace [join $oui " : "] 1 1] 4 4] 7 7] ""]
set mac2 [join [lreplace [lreplace [lreplace [join $mac " : "] 1 1] 4 4] 7 7] ""]
puts "
Organisational Unique Identifier (OUI): "
puts $oui2
puts "
Network Interface Specific Identifier: "
puts $mac2

set 1byte [join [lrange $l_input 10 11] ""]
set 2byte [join [lrange $l_input 8 9] ""]
set 3byte [join [lrange $l_input 6 7] ""]

proc hex_to_dec {hex} {
    expr 0x$hex}

proc dec_to_hex {dec} {
    format %x $dec}

set 1dec [hex_to_dec $1byte]
set 2dec [hex_to_dec $2byte]
set 3dec [hex_to_dec $3byte]

puts "
Network Interface Specific Identifier in decimal: 
$3dec:$2dec:$1dec"
