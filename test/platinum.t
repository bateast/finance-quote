#!/usr/bin/perl -w
use strict;
use Test;
use Data::Dumper;
BEGIN {plan tests => 6};

use Finance::Quote;

# Test Platinum functions.

my $q      = Finance::Quote->new();

my %quotes = $q->platinum("PLA0001AU","BOGUS");
ok(%quotes);

# Check the nav values are defined.  These are the most
#  used and most reliable indicators of success.
ok($quotes{"PLA0001AU","last"} > 0);
ok(length($quotes{"PLA0001AU","name"}) > 0);
ok($quotes{"PLA0001AU","success"});
ok($quotes{"PLA0001AU", "currency"} eq "AUD");

# Check that a bogus stock returns no-success.
ok(! $quotes{"BOGUS","success"});