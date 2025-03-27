#!/usr/bin/env perl

use strict ;
use IPC::System::Simple qw(systemx runx capturex $EXITVAL);
use String::ShellQuote ;
use File::Basename;

{
  v_systemx([0], [@ARGV]) ;
}

sub v_systemx {
  croak( "v_systemx: must specify exit codes") unless (ref($_[0]) eq 'ARRAY') ;
  my $codes = shift ;
  my @cmd = @{ shift @_ } ;
  my %args = @_ ;


  print STDERR join(' ', "$0:", map { shell_quote($_) } @cmd)."\n" ;

  return runx($codes, @cmd) ;
}
