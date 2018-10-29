use WordNet::QueryData;

#my $wn = WordNet::QueryData ->new( onload => 1);

my $wn = WordNet::QueryData->new("/usr/local/Cellar/wordnet/3.1/dict");

print "Synset: ", join (", ", $wn->querySense("cat#n#7","syns"))," \n";
