#!/usr/bin/env perl
use strict;
use warnings;

if (scalar(@ARGV) != 3) {
    print "Error: expected 3 arguments <a> <op> <b>\n";
    exit 1;
}

my ($a, $op, $b) = @ARGV;

unless ($a =~ /^-?(\d+\.?\d*|\.\d+)$/ && $b =~ /^-?(\d+\.?\d*|\.\d+)$/) {
    print "Error: invalid number\n";
    exit 1;
}

$a += 0;
$b += 0;
my $result;

if ($op eq '+') {
    $result = $a + $b;
} elsif ($op eq '-') {
    $result = $a - $b;
} elsif ($op eq '*') {
    $result = $a * $b;
} elsif ($op eq '/') {
    if ($b == 0) {
        print "Error: division by zero\n";
        exit 1;
    }
    $result = $a / $b;
} else {
    print "Error: unknown operator\n";
    exit 1;
}

if ($result == int($result)) {
    print int($result), "\n";
} else {
    print "$result\n";
}
