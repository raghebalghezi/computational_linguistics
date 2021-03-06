# Example of breadth-first search of WordNet relations in Perl
# Changes: 2016/4 'm@rk' instead of 'mark', sub found takes 2 args
#
# usage: bfs word#pos#sense word#pos#sense
# synopsis: finds the semantic distance in links between the two word senses
# prints the list of relations connecting the two word senses

if ($#ARGV != 1) {
  print "usage: perl bfs2.perl word#pos#sense word#pos#sense\n";
  exit
}
my $start = $ARGV[0]; # e.g. minibike#n#1
my $end = $ARGV[1];   # e.g. convertible#n#1

# USER-SETTABLE PARAMETERS
my $max = 300000; 		# max number of nodes to be explored
my @relations = ("hype", "hypo", "mero", "holo"); # semantic relations

use WordNet::QueryData;
# my $wn = WordNet::QueryData->new( noload => 0);
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

if (found($start,$end)) {
  $found = 1;
} else {
 FOUND: while ($n < $max) {
    $node_ref = pop @queue;
    if (@{$node_ref}[0] eq 'm@rk') {
      $distance++;
      unshift @queue, ['m@rk'];
      $node_ref = pop @queue;
    }
    $seen{@{$node_ref}[0]} = 1;

    foreach $rel (@relations) {
      foreach $newnode ($wn->querySense(@{$node_ref}[0], $rel)) {
	$n++;
	if (found($newnode,$end)) {
	  $found = 1;
	  unshift @{$node_ref}, ($newnode, $rel);
	  last FOUND;
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

if ($found) {
  print "Found at distance $distance ($n nodes explored)\n";
  print "@{$node_ref}", "\n";
} else {
  print "Not found (distance $distance and $n nodes explored)\n";
}
