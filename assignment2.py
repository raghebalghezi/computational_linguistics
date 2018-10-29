# -*- coding: utf-8 -*-
from nltk.corpus import cmudict
import re


def numberSyllables(word):
    try:
        slist = cmudict.dict()[word]
        for i in slist:
            vowels = list('AIEUOY')
            SyllNum = 0
            for f in i:
                if f[0]in vowels and len(f)>1:
                    SyllNum+=1
            return word + ": " + str(SyllNum)
    except KeyError:
        print("The word you entered isn't found in CMUDICT")


def writtenMethod(word):
    pattern = re.compile(r'[aeiou]{2,3}')
    SyllNum = 0
    for letter in word:
        vowels = ['a','e','i','o','u','y']
        if letter in vowels:
            SyllNum+=1
    if word.endswith("e"):
        SyllNum-=1
    if pattern.search(word) != None:
        SyllNum-=1
    if word.endswith("le") and word[-3] not in vowels or word.endswith("les") and word[-4] not in vowels:
        SyllNum+=1    
    return(word + ": " + str(SyllNum))

