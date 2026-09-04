#!/usr/bin/env tclsh
if {[llength $argv] != 3} {
    puts "Error: expected 3 arguments <a> <op> <b>"
    exit 1
}

set a [lindex $argv 0]
set op [lindex $argv 1]
set b [lindex $argv 2]

if {![string is double -strict $a] || ![string is double -strict $b]} {
    puts "Error: invalid number"
    exit 1
}

switch -- $op {
    "+" { set result [expr {$a + $b}] }
    "-" { set result [expr {$a - $b}] }
    "*" { set result [expr {$a * $b}] }
    "/" {
        if {$b == 0} {
            puts "Error: division by zero"
            exit 1
        }
        set result [expr {double($a) / $b}]
    }
    default {
        puts "Error: unknown operator"
        exit 1
    }
}

if {$result == int($result)} {
    puts [expr {int($result)}]
} else {
    puts $result
}
