#!/usr/bin/env perl

$p = `pwd` ;

$p =~ s,^/cygdrive/([a-z]),$1:, ;
$p =~ s,/,\\,gs ;

print $p;
