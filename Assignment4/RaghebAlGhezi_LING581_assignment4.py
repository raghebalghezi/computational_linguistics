# -*- coding: utf-8 -*-

import nltk
from nltk.corpus import ptb



tagged_corpus = ptb.tagged_words(categories=['news'])

#print(len(tagged_corpus))

def nonWord_strip(x):
    return x != '-NONE-' and x != '-LRB-' and x != '-RRB-' and x != 'SYM' and x != ':' and x != '.' and x != ',' and x != '``' and x != "''"
    

print("*********       QUESTION 1     ***************")
#
words_without_lst = [x[0] for x in tagged_corpus if nonWord_strip(x[1])]

#words_without_lst2 = [x[0].lower() for x in tagged_corpus if nonWord_strip(x[1])]




print("The number of words without NON-words is ", len(words_without_lst))


words_without_set = set([x[0] for x in ptb.tagged_words(categories=['news']) if nonWord_strip(x[1])])

print("The number of distinct words without NON-words is ", len(words_without_set))

print("Lexical diversity is ", len(words_without_set) / len(words_without_lst))


dist = nltk.FreqDist(words_without_lst)

print(dist.plot(50,cumulative=True))

words_without_Sorted_lst = sorted(dist.items(),key=lambda t:t[1],reverse=True)

#print(words_without_Sorted_lst[:10])

sum_of_freq = 0
top_words = []

for x in words_without_Sorted_lst:
    if sum_of_freq < len(words_without_lst) / 2:
       sum_of_freq += x[1]
       top_words.append(x[0])

print("the number of top word that constitute 50% of the corpus is ", len(top_words))

print("Those words are: ", top_words)





print("*********       QUESTION 2     ***************")

words_without_lst2 = [x[0].lower() for x in tagged_corpus if nonWord_strip(x[1])]



print("The number of words without NON-words is ", len(words_without_lst))


words_without_set2 = set([x[0].lower() for x in tagged_corpus if nonWord_strip(x[1])])

print("The number of distinct words without NON-words is ", len(words_without_set2))

print("Lexical diversity is ", len(words_without_set2) / len(words_without_lst2))


dist = nltk.FreqDist(words_without_lst2)

print(dist.plot(50,cumulative=True))

words_without_Sorted_lst = sorted(dist.items(),key=lambda t:t[1],reverse=True)

#print(words_without_Sorted_lst[:10])

sum_of_freq = 0
top_words = []

for x in words_without_Sorted_lst:
    if sum_of_freq < len(words_without_lst) / 2:
       sum_of_freq += x[1]
       top_words.append(x[0])

print("the number of top word that constitute 50% of the corpus is ", len(top_words))

print("Those words are: ", top_words)