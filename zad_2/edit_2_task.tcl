#!/usr/bin/env tclsh

set plik $argv  

#file copy $plik ./plik_old.txt

puts "Plik plik.txt ma rozmiar [file size $plik] bajtow"
puts "Rozszerzenie pliku to [file extension $plik]"

set file [open $plik]
set input [read $file]

foreach line $input {
    lappend odczyt $line
}
close $file 
set last [lindex [split $odczyt " "] end]

set ostatnie [split $last ""]


set bit_6 [lindex $ostatnie end]
set bit_5 [lindex $ostatnie end-1]
set bit_4 [lindex $ostatnie end-2]
set bit_3 [lindex $ostatnie end-3]
set bit_2 [lindex $ostatnie end-4]
set bit_1 [lindex $ostatnie end-5]

puts "
Ostatnia linijka liczb w zapisie hex: 
$ostatnie"
puts "
Ostatnie 3 bajty zapisane w hex:
$bit_1 $bit_2 $bit_3 $bit_4 $bit_5 $bit_6"

set last_bytes [list $bit_1 $bit_2 $bit_3 $bit_4 $bit_5 $bit_6]
#puts [join $last_bytes ""]

proc hex2bin {hex} {
  binary scan [binary format H* $hex] B* bin
  return $bin
}

proc bin2hex {bin} {
    binary scan [binary format B* $bin] H* hex
    return $hex
}
bin2hex
set bytes_1 [join [list $bit_5 $bit_6] ""]
set bytes_2 [join [list $bit_3 $bit_4] ""]
set bytes_3 [join [list $bit_1 $bit_2] ""]

set all_bits [hex2bin $bytes_3][hex2bin $bytes_2][hex2bin $bytes_1]
puts "Zachodzi zamiana z systemu hex na binarny
Wszystkie 24 ostatnie bity w postaci binarnej:  
[split $all_bits ""]"

set bits_20 [lrange [split [list $all_bits] ""] 4 end]
puts $bits_20

puts "
Ostatnie 20 bitow:  
$bits_20"

foreach change $bits_20 {
    if {$change == 0} {
        lappend new_bin "1"
    } elseif {$change == 1} {
        lappend new_bin $change
    }
}

puts "
Po zmianie ostatnich 20 bitow: 
$new_bin"

set new_all_bits [join [list {0 1 0 0} $new_bin] " "]

puts "
Ostatnie 24 zmienione bity: 
$new_all_bits"

set newbit_6 [lrange $new_all_bits 0 3]
set newbit_5 [lrange $new_all_bits 4 7]
set newbit_4 [lrange $new_all_bits 8 11]
set newbit_3 [lrange $new_all_bits 12 15]
set newbit_2 [lrange $new_all_bits 16 19]
set newbit_1 [lrange $new_all_bits 20 23]

set newbyteshex_1 [join [list $newbit_6 $newbit_5] " "]
set newbyteshex_2 [join [list $newbit_4 $newbit_3] " "]
set newbyteshex_3 [join [list $newbit_2 $newbit_1] " "]

set to_hex_1 [join $newbyteshex_1 ""]
set to_hex_2 [join $newbyteshex_2 ""]
set to_hex_3 [join $newbyteshex_3 ""]
#set newbyteshex_2 {
puts "
Bajt 3-ci w postaci binarnej:
$newbyteshex_1"
puts "
Bajt 3-ci w postaci hex:
[bin2hex $to_hex_1]"

puts "
Bajt 2-gi w postaci binarnej:
$newbyteshex_2"
puts "
Bajt 2-gi w postaci hex:
[bin2hex $to_hex_2]"

puts "
Bajt 1-szy w postaci binarnej:
$newbyteshex_3"
puts "
Bajt 1-szy w postaci hex:
[bin2hex $to_hex_3]"

set hex_1 [bin2hex $to_hex_1]
set hex_2 [bin2hex $to_hex_2]
set hex_3 [bin2hex $to_hex_3]

puts "
Trzy ostatnie bajty w postaci hex:
[join [list $hex_1 $hex_2 $hex_3] " "]"

set bytes_3_after_change [join [list $hex_1 $hex_2 $hex_3] " "]
set all [join [list [lrange $ostatnie 0 17] $bytes_3_after_change] " "]

puts "
Caly zapis ostatniej linijki w postaci hex:
[join $all "" ]"

set all [join [list [lrange $ostatnie 0 17] $bytes_3_after_change] " "]

#seek $file -19 end 
#puts $file $all
