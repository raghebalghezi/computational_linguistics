# -*- coding: utf-8 -*-
import random
random.seed()


import nltk

raw=nltk.corpus.gutenberg.raw('carroll-alice.txt')

sents=nltk.sent_tokenize(raw)

rand_sent = random.randrange(1,len(sents))

words = nltk.tokenize.word_tokenize(sents[rand_sent])

sent_pos = nltk.pos_tag(words)

print(rand_sent) #I have chosen sent. #865 for POS accuracy analysis
print(sent_pos)
print(sents[865])

#865
#[("'And", 'RB'), ('be', 'VB'), ('quick', 'JJ'), ('about', 'IN'), ('it', 'PRP'), 
# (',', ','), ("'", "''"), ('added', 'VBD'), ('the', 'DT'), ('Hatter', 'NNP'), 
# (',', ','), ("'or", "''"), ('you', 'PRP'), ("'ll", 'MD'), ('be', 'VB'), 
# ('asleep', 'RB'), ('again', 'RB'), ('before', 'IN'), ('it', 'PRP'), ("'s", 'VBZ'),
# ('done', 'VBN'), ('.', '.'), ("'", "''")]

print(sents[865])
#'And be quick about it,' added the Hatter, 'or you'll be asleep again
#before it's done.'
