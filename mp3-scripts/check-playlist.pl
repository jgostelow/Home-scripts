#!/usr/bin/perl -w

use strict;

while(<STDIN>) {

        chomp;
        print "$_ does not exist\n" if(! -f $_);

}
