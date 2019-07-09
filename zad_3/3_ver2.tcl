#!/usr/bin/env tclsh

proc simple_menu {} {
    puts "
    "
    puts "
    ===================== SIMPLE MENU ======================="
    puts "
    ---------------------------------------------------------
    1 - Display current date and time"
    puts "
    ---------------------------------------------------------
    2 - Display information about your current folder"
    puts "
    ---------------------------------------------------------
    3 - Display content of the file and sort alphabetically"
    puts "
    ---------------------------------------------------------
    4 - Add some words to end of file"
    puts "
    ---------------------------------------------------------
    5 - Find specific word in file"
    puts "
    ---------------------------------------------------------
    6 - Delete file"
    puts "
    ---------------------------------------------------------
    7 - Stop program"
    puts "
    ---------------------------------------------------------
    Choose one of options: "
    set again [choice]
    puts $again
}
   
proc timedate {} {
    set systemTime [clock seconds]
    puts "
    The time is: [clock format $systemTime -format %H:%M:%S]"
    puts "
    The date is: [clock format $systemTime -format %D]"
    puts "
    " 
    puts "Press Enter to return menu"
    gets stdin
    set back [simple_menu]
    puts $back
}

proc information {} {
    puts " 
	Choose your operation system"
    puts " 
    Press U for Unix
    Press W for Windows"
	set os [gets stdin]
    if {$os == "U" || $os == "u"} {
	    puts " 
        Localization of current working directory
        [exec pwd ]"
        puts "
        Content of current working directory
        [exec ls -lah]"
    	} elseif {$os == "W" || $os == "w"} {
        puts "
	    Content of current directory
	    [exec cmd /c dir]"
	    } else { puts "Wrong option choosen"}
    puts "Press Enter to return menu"
    gets stdin
    set back [simple_menu]
    puts $back
}

proc cont_sort {} {
    puts "
    Enter file name"
    set argument [gets stdin]
    set input [read [open $argument]]
    set readed $input
    set readedsorted [lsort $readed]        
    puts "
    Content of input file:"
    puts $readed
    puts "
	Content of input file_sorted alphabetically"
    puts $readedsorted
    puts "Press Enter to return menu"
    gets stdin
    set back [simple_menu]
    puts $back
    }
    
proc addtext {} {
    puts "
    Enter file name"
    set argument [gets stdin]
    puts "
    Enter new words and add the end of file: "
    set ofor_add [open $argument a]
    set newtext [gets stdin]
    foreach different_content $newtext {
        puts $ofor_add $different_content
    }
    close $ofor_add
    puts "
    Words added"
    puts "
    Press Enter to return menu"
    gets stdin
    set back [simple_menu]
    puts $back
    }

proc searchtext {} {
    puts "
    Enter file name"
    set argument [gets stdin]
    set input [read [open $argument]]
    set readed $input
    puts "
    Enter sign(s) and check that exist in file: "
    set searchword [lsearch -all -inline -regexp $readed [gets stdin]]
    puts "
    This sign(s) exist in words: 
    $searchword"
    set wcsearchword [llength $searchword] 
    puts "
    This sign(s) exist $wcsearchword time(s)"
    puts "
    Press Enter to return menu"
    gets stdin
    set back [simple_menu]
    puts $back
    }

proc deletefile {} {
    puts "
    !!!!!!!!!!!!!!!! Warning !!!!!!!!!!!!!!!!!"
    puts "
        Do you really want delete your file?"
    puts "
        If you want abort this procedure press ctrl+c"
    puts "
        Or click Enter continue"
    set check [gets stdin]
    puts "
        Enter file name to delete"
    set argument [gets stdin]
    file delete $argument
    puts "
        File deleted!"
    puts "
    Press Enter to return menu"
    gets stdin
    set back [simple_menu]
    puts $back
    }

proc wrong_opt {} {
    puts "
    =================== Exit ======================
    "
    exit
    }

proc choice {} {
    puts "
    Your choice:
    "
    set option [gets stdin]
    switch $option { 
    1 {set first [timedate]
        puts $first}
    2 {set second [information]
        puts $second}
    3 {set third [cont_sort]
        puts $third}
    4 {set fourth [addtext]
        puts $fourth}
    5 {set fifth [searchtext]
        puts $fifth}
    6 {set sixth [deletefile]
        puts $sixth}
    7 {set seventh [wrong_opt]
        puts $seventh}
    default {
        puts "
    !!!!!! Wrong option choosen !!!!!!"
        puts "
    ====== Press Enter and try again ======"
        gets stdin
        set back [simple_menu]
        puts $back
}
}
}
#StarterPack
set start [simple_menu]
puts $start
