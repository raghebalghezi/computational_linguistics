# Example of breadth-first search of WordNet relations in Perl
#
# usage: bfs word#pos#sense word#pos#sense [max]
# synopsis: finds the semantic distance in links between the two word senses
# prints the list of relations connecting the two word senses
# looks for all paths of minimum length

if ($#ARGV != 1 && $#ARGV != 2) {
  print "usage: perl bfs2.perl word#pos#sense word#pos#sense [max]\n";
  exit
}
my $start = $ARGV[0]; # e.g. minibike#n#1
my $end = $ARGV[1];   # e.g. convertible#n#1

# USER-SETTABLE PARAMETERS
my $max = 200000; 		# max number of nodes to be explored
if ($#ARGV == 2) {
  $max = $ARGV[2]+0;
  print "Max set to: $max\n";
}

my @relations = ("hype", "hypo", "mero", "holo", "enta", "caus"); # for querySense
my @relations2 = ("ants", "also", "deri", "pert"); # for queryWord

use WordNet::QueryData;
#my $wn = WordNet::QueryData->new( noload => 0);
my $wn = WordNet::QueryData->new("/usr/local/Cellar/wordnet/3.1/dict/");
my @queue = ([$start], ['m@rk']);
my %seen = {};
my $found = 0;
my $n = 0;
my $distance = 0;
my $node_ref;

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

sub reportpath {
  my $ref = shift;
  print "Found at distance $distance ($n nodes explored)\n";
  print "@{$ref}", "\n";
}

if (found($start,$end)) {
  $found = 1;
} else {
DONE: while ($n < $max) {
    $node_ref = pop @queue;
    if (@{$node_ref}[0] eq 'm@rk') {
      if ($found) {
	print "All minimal solutions found\n";
	last DONE;
      } else {
	$distance++;
	unshift @queue, ['m@rk'];
	$node_ref = pop @queue;
      }
    }
    $seen{@{$node_ref}[0]} = 1;

    foreach $rel (@relations) {
      foreach $newnode ($wn->querySense(@{$node_ref}[0], $rel)) {
	$n++;
	if (found($newnode,$end)) {
	  $found = 1;
	  unshift @{$node_ref}, ($newnode, $rel);
	  reportpath $node_ref
	} else {
	  if (!$seen{$newnode}) {
	    my @new = @{$node_ref};
	    unshift @new, ($newnode, $rel);
	    unshift @queue, \@new;
	  }
	}
      }
    }

    foreach $rel (@relations2) {
      foreach $newnode ($wn->queryWord(@{$node_ref}[0], $rel)) {
	$n++;
	if (found($newnode,$end)) {
	  $found = 1;
	  unshift @{$node_ref}, ($newnode, $rel);
	  reportpath $node_ref
	} else {
	  if (!$seen{$newnode}) {
	    my @new = @{$node_ref};
	    unshift @new, ($newnode, $rel);
	    unshift @queue, \@new;
	  }
	}
      }
    }
  }
}

if (!$found) {
  print "Not found (distance $distance and $n nodes explored)\n";
}
