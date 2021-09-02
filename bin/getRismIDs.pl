#!/usr/bin/env perl
use strict;
my $composerslistFile = $ARGV[0];
my $xmlDir = $ARGV[1];

open(FILE, $composerslistFile);
my @composers = <FILE>;
close(FILE);
foreach my $x (@composers) {
  chomp $x;
}

my @xmlfiles = glob("$xmlDir/*");
my %composersIDs;

foreach my $x (@xmlfiles) {
  my @nameID = getNameIDfromXML($x);
  $composersIDs{$nameID[0]} = $nameID[1];
}

#foreach my $x (sort(keys(%composersIDs))) {
#  print "$x = $composersIDs{$x}\n";
#}

foreach my $x (@composers) {
  #print "$x\t$composersIDs{$x}\n";
  print "$composersIDs{$x}\n";
}



######################################

sub getNameIDfromXML {
  my ($filename) = @_;
  open(FILE, "$filename");
  my @content = <FILE>;
  close(FILE);
  my $name;
  my $ID;
  
  my $field100on;
  for (my $i = 0; $i < @content; $i++) {
    if ($content[$i] =~ /tag="100"/) {
      $field100on = 1;
      next;
    } 
    if ($field100on) {
      if ($content[$i] =~ /code="a"/) {
        $name = getValue($content[$i]);
      }
      if ($content[$i] =~ /code="0"/) {
        $ID = getValue($content[$i]);
      }
      if ($content[$i] =~ /<\/marc:datafield>/) {
        last;
      }
      
    }
    
  }
  my @return;
  $return[0] = $name;
  $return[1] = $ID;
  return @return;
}


sub getValue {
  my ($line) = @_;
  $line =~ s/\s*<[^>]*>//g;
  chomp $line;
  return $line;
}
