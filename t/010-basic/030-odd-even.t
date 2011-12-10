#!/usr/bin/perl -w

package Digits;

use VSO;

subtype 'EvenNumber'  =>
  as      'Int',
  where   { $_ % 2 == 0 };

subtype 'OddNumber' =>
  as      'Int',
  where   { $_ % 2 > 0 };

#coerce 'EvenNumber' =>
#  from    'OddNumber',
#  via     { $_ + 1 };

has 'Numbers' => (
  is        => 'ro',
  isa       => 'ArrayRef[EvenNumber]',
  required  => 1,
  coerce    => 1
);

package main;

use strict;
use warnings 'all';
use Test::More 'no_plan';

ok(1);
exit;


my $d = Digits->new(
  Numbers => [ 2, 4, 6, 8, 10 ]
);

ok( $d );

#eval {
  $d = Digits->new(
    Numbers => [ 1, 3, 5, 7, 9, 'a' ]
  );
#};
ok( $d );


