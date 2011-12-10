
package
VSO::Subtype;

use strict;
use warnings 'all';
our %types = ( );
sub new { my ($class,%args) = @_; my $s = bless \%args, $class; $s->init; $s; }
sub init
{
  my $s = shift;
  $s->{where} ||= sub { 1 };
  $VSO::Subtype::types{$s->{name}} = $s;
}# end init()
sub name    { $_[0]->{name}             }
sub as      { $_[0]->{as}               }
sub where   { $_[0]->{where}->( $_[1] )    }
sub message { $_[0]->{message}->( $_[1] )  }

sub find { $VSO::Subtype::types{$_[1]} || $_[1] }
sub subtype_exists { $VSO::Subtype::types{$_[1]} && 1 }

1;# return true:

