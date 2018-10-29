# Example of breadth-first search of WordNet relations in Perl
#
# usage: bfs word#pos#sense word#pos#sense
# synopsis: finds the semantic distance in links between the two word senses
if ($#ARGV != 1) {
  print "usage: perl bfs.perl word#pos#sense word#pos#sense\n";
  exit
}
my $start = $ARGV[0]; # e.g. minibike#n#1
my $end = $ARGV[1];   # e.g. convertible#n#1

# USER-SETTABLE PARAMETERS
my $max = 800000; 		# max number of nodes to be explored
my @relations = ("hype", "hypo", "mero", "holo"); # semantic relations

use WordNet::QueryData;
#my $wn = WordNet::QueryData->new( noload => 0);
my $wn = WordNet::QueryData->new("/usr/local/Cellar/wordnet/3.1/dict/");

my @queue = ($start, 'm@rk');
my %seen = {};
my $found = 0;
my $n = 0;
my $distance = 0;

sub found {
  my $node = shift;
  my $end = shift;
  foreach $syn ($wn->querySense($node, "syns")) {
    if ($end eq $syn) {
      return 1
    }
  }
  return 0
}

if (found($start,$end)) {
  $found = 1;
} else {
 FOUND: while ($n < $max) {
    my $node = pop @queue;
    if ($node eq 'm@rk') {
      $distance++;
      unshift @queue, 'm@rk';
      $node = pop @queue;
    }
    $seen{$node} = 1;

    foreach $rel (@relations) {
      foreach $newnode ($wn->querySense($node, $rel)) {
	$n++;
	if (found($newnode,$end)) {
	  $found = 1;
	  last FOUND;
	} else {
	  if (!$seen{$newnode}) {
	    unshift @queue, $newnode;
	  }
	}
      }
    }
  }
}

if ($found) {
  print "Found at distance $distance ($n nodes explored)\n";
} else {
  print "Not found (distance $distance and $n nodes explored)\n";
}
