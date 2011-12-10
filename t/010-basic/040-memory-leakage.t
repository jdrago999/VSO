#!/usr/bin/perl -w

package Foo;

use VSO;

package main;

use strict;
use warnings 'all';
use Test::More 'no_plan';
use Test::Memory::Cycle;

use lib 't/lib';
use State;

for( 1..1000 )
{
my $state = State->new(
  name        => 'Colorado',
  capital     => 'Denver',
  population  => 5_000_000,
  foo         => { bar => bless {}, 'Foo' },
  func        => sub { }
);

memory_cycle_ok( $state );
last;
}

