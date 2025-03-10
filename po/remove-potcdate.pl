#! /usr/bin/perl -n

use warnings;
use strict;

my $seen_potcdate;

BEGIN {
    $seen_potcdate = 0;
}

if (not $seen_potcdate and /^"POT-Creation-Date: .*"/) {
    $seen_potcdate = 1;
    next;
}
print;
