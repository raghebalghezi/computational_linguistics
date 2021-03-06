;           Copyright (c) 2004, Daniel M. Bikel.
;                         All rights reserved.
; 
;                Developed at the University of Pennsylvania
;                Institute for Research in Cognitive Science
;                    3401 Walnut Street
;                    Philadelphia, Pennsylvania 19104
; 			
; 
; For research or educational purposes only.  Do not redistribute.  For
; complete license details, please read the file LICENSE that accompanied
; this software.
; 
; DISCLAIMER
; 
; Daniel M. Bikel makes no representations or warranties about the suitability of
; the Software, either express or implied, including but not limited to the
; implied warranties of merchantability, fitness for a particular purpose, or
; non-infringement. Daniel M. Bikel shall not be liable for any damages suffered
; by Licensee as a result of using, modifying or distributing the Software or its
; derivatives.
; 
;; a list of contexts in which children can be considered arguments
;;; (complements)
;;; the syntax is: (arg-contexts <context>+)
;;; where
;;; <context>      ::= (<parent> <child list>)
;;;
;;; <parent>       ::= the symbol of a parent nonterminal
;;;
;;; <child list>   ::= <nt-list> | <head-list>
;;;
;;; <nt-list>      ::= (<nt>+)
;;;                    a list of symbols of child nonterminals s.t. when their
;;;                    parent is <parent>, they are candidates for being
;;;                    relabeled as arguments
;;;
;;; <nt>           ::= a nonterminal label (a symbol), or a match pattern
;;;                    containing Kleene star, such as * or *-A, where the
;;;                    former matches any nonterminal symbol, and the latter
;;;                    matches any nonteminal symbol bearing the "-A"
;;;                    augmentation
;;;
;;; <head-list>    ::= (head <integer>) |
;;;                    (head-pre <search-set>) |
;;;                    (head-post <search-set>)
;;;
;;; <integer>      ::= an integer that is the amount to add to the head index
;;;                    (this integer can also be negative, but not zero)
;;;                    e.g., (head 1) indicates that the first child after the
;;;                    head is a candidate for being relabeled as an argument
;;;
;;; <search-set>   ::= <direction> [<not>] <nt>+
;;;
;;; <direction>    ::= first | last
;;;                    first indicates a left-to-right search of the children
;;;                    of <parent>
;;;                    last indicates a right-to-left search
;;;                    e.g., (head-post first PP NP WHNP) indicates to perform
;;;                    a left-to-right search on the right side of the head,
;;;                    where the first child found whose label is one of
;;;                    {PP, NP, WHNP} will be a candidate for being relabeled
;;;                    as an argument
;;;
;;; <not>          ::= not
;;;                    indicates to search for something not in the set of
;;;                    nonterminals specified by <nt>+
;;;
(arg-contexts (* (*-SBJ *-OBJ *-DTV *-CLR))
	      (VP (SBAR S VP))
	      (SBAR (S))
	      (PP (head 1)))
;              (PP (head-post first not PRN IN , : $ # CC CD DT EX FW JJ JJR JJS -LRB- LS MD NN NNP NNPS NNS PDT POS PRP PRP$ RB RBR RBS RP -RRB- SYM TO UH VB VBD VBG VBN VBP VBZ WDT WP WP$ WRB)))
;;; a list of semantic tags on Penn Treebank nonterminals that prevent
;;; children in the appropriate contexts from being relabeled as arguments
(sem-tag-arg-stop-list (ADV VOC BNF DIR EXT LOC MNR TMP PRP))

;;; a list of nodes to be pruned from training data parse trees
(prune-nodes ('' .))

;;; a set of mappings from the morphological Arabic tags to the original
;;; Penn Treebank tag set
;;; each mapping is a list of two symbols, of the form (<from> <to>)
(tag-map 
    ; PUNC: special handling done int #transformTag(Word)

    ; don't map NUMERIC_COMMA

    ; don't map NON_ALPHABETIC

    ; don't map NON_ARABIC

    ; don't map NO_FUNC

    ; NN
    (ABBREV NN)
    (LATIN NN)
    (DET+NOUN NN)
    (DET+NOUN+NSUFF_FEM_SG NN)
    (NOUN NN)
    (NOUN+NSUFF_FEM_SG NN)
    (NOUN+NSUFF_MASC_SG_ACC_INDEF NN)
    (DEM+NOUN NN)
    (DET+NOUN+CASE_DEF_ACC NN)
    (DET+NOUN+CASE_DEF_GEN NN)
    (DET+NOUN+CASE_DEF_NOM NN)
    (DET+NOUN+NSUFF_FEM_SG+CASE_DEF_ACC NN)
    (DET+NOUN+NSUFF_FEM_SG+CASE_DEF_GEN NN)
    (DET+NOUN+NSUFF_FEM_SG+CASE_DEF_NOM NN)
    (NOUN+CASE_DEF_ACC NN)
    (NOUN+CASE_DEF_GEN NN)
    (NOUN+CASE_DEF_NOM NN)
    (NOUN+CASE_INDEF_ACC NN)
    (NOUN+CASE_INDEF_GEN NN)
    (NOUN+CASE_INDEF_NOM NN)
    (NOUN+NSUFF_FEM_SG+CASE_DEF_ACC NN)
    (NOUN+NSUFF_FEM_SG+CASE_DEF_GEN NN)
    (NOUN+NSUFF_FEM_SG+CASE_DEF_NOM NN)
    (NOUN+NSUFF_FEM_SG+CASE_INDEF_ACC NN)
    (NOUN+NSUFF_FEM_SG+CASE_INDEF_GEN NN)
    (NOUN+NSUFF_FEM_SG+CASE_INDEF_NOM NN)
    (NEG_PART+NOUN NN)

    ; NNS
    (DET+NOUN+NSUFF_FEM_DU_ACCGEN NNS)
    (DET+NOUN+NSUFF_FEM_DU_NOM NNS)
    (DET+NOUN+NSUFF_FEM_PL NNS)
    (DET+NOUN+NSUFF_MASC_DU_ACCGEN NNS)
    (DET+NOUN+NSUFF_MASC_DU_NOM NNS)
    (DET+NOUN+NSUFF_MASC_PL_ACCGEN NNS)
    (DET+NOUN+NSUFF_MASC_PL_NOM NNS)
    (NOUN+NSUFF_FEM_DU_ACCGEN NNS)
    (NOUN+NSUFF_FEM_DU_ACCGEN_POSS NNS)
    (NOUN+NSUFF_FEM_DU_NOM NNS)
    (NOUN+NSUFF_FEM_DU_NOM_POSS NNS)
    (NOUN+NSUFF_FEM_PL NNS)
    (NOUN+NSUFF_MASC_DU_ACCGEN NNS)
    (NOUN+NSUFF_MASC_DU_ACCGEN_POSS NNS)
    (NOUN+NSUFF_MASC_DU_NOM NNS)
    (NOUN+NSUFF_MASC_DU_NOM_POSS NNS)
    (NOUN+NSUFF_MASC_PL_ACCGEN NNS)
    (NOUN+NSUFF_MASC_PL_ACCGEN_POSS NNS)
    (NOUN+NSUFF_MASC_PL_NOM NNS)
    (NOUN+NSUFF_MASC_PL_NOM_POSS NNS)
    (DET+NOUN+NSUFF_FEM_PL+CASE_DEF_ACCGEN NNS)
    (DET+NOUN+NSUFF_FEM_PL+CASE_DEF_NOM NNS)
    (DET+NOUN+NSUFF_FEM_PL+CASE_DEF_ACC NNS)
    (Det+NOUN+NSUFF_FEM_PL+CASE_DEF_GEN NNS)
    (NOUN+NSUFF_FEM_PL+CASE_DEF_ACCGEN NNS)
    (NOUN+NSUFF_FEM_PL+CASE_DEF_NOM NNS)
    (NOUN+NSUFF_FEM_PL+CASE_INDEF_ACCGEN NNS)
    (NOUN+NSUFF_FEM_PL+CASE_DEF_ACC NNS)
    (NOUN+NSUFF_FEM_PL+CASE_INDEF_ACC NNS)
    (NOUN+NSUFF_FEM_PL+CASE_INDEF_GEN NNS)
    (NOUN+NSUFF_FEM_PL+CASE_INDEF_NOM NNS)

    ; NNP
    (DET+NOUN_PROP NNP)
    (DET+NOUN_PROP+NSUFF_FEM_SG NNP)
    (DET+NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_ACC NNP)
    (DET+NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_GEN NNP)
    (DET+NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_NOM NNP)
    (NOUN_PROP NNP)
    (NOUN_PROP+NSUFF_FEM_SG NNP)
    (NOUN_PROP+NSUFF_MASC_SG_ACC_INDEF NNP)
    (NOUN_PROP+CASE_DEF_ACC NNP)
    (NOUN_PROP+CASE_DEF_GEN NNP)
    (NOUN_PROP+CASE_DEF_NOM NNP)
    (NOUN_PROP+CASE_INDEF_GEN NNP)
    (NOUN_PROP+CASE_INDEF_NOM NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_GEN NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_ACC NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_DEF_NOM NNP)
    (NOUN_PROP+NSUFF_FEM_SG+CASE_INDEF_GEN NNP)

    ; NNPS
    (DET+NOUN_PROP+NSUFF_FEM_PL NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_DU_ACCGEN NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_PL_ACCGEN NNPS)
    (DET+NOUN_PROP+NSUFF_MASC_PL_NOM NNPS)
    (NOUN_PROP+NSUFF_FEM_PL NNPS)
    (NOUN_PROP+NSUFF_FEM_PL+CASE_INDEF_ACCGEN NNPS)
    (NOUN_PROP+NSUFF_MASC_PL_ACCGEN NNPS)
    (DET+NOUN_PROP+CASE_DEF_ACC NNPS)
    (DET+NOUN_PROP+CASE_DEF_GEN NNPS)
    (DET+NOUN_PROP+CASE_DEF_NOM NNPS)
    (DET+NOUN_PROP+NSUFF_FEM_PL+CASE_DEF_ACCGEN NNPS)

    ; JJ
    (ADJ JJ)
    (ADJ+NSUFF_FEM_DU_ACCGEN JJ)
    (ADJ+NSUFF_FEM_DU_ACCGEN_POSS JJ)
    (ADJ+NSUFF_FEM_DU_NOM JJ)
    (ADJ+NSUFF_FEM_PL JJ)
    (ADJ+NSUFF_FEM_SG JJ)
    (ADJ+NSUFF_MASC_DU_ACCGEN JJ)
    (ADJ+NSUFF_MASC_DU_ACCGEN_POSS JJ)
    (ADJ+NSUFF_MASC_DU_NOM JJ)
    (ADJ+NSUFF_MASC_DU_NOM_POSS JJ)
    (ADJ+NSUFF_MASC_PL_ACCGEN JJ)
    (ADJ+NSUFF_MASC_PL_ACCGEN_POSS JJ)
    (ADJ+NSUFF_MASC_PL_NOM JJ)
    (ADJ+NSUFF_MASC_PL_NOM_POSS JJ)
    (ADJ+NSUFF_MASC_SG_ACC_INDEF JJ)
    (ADJ_PROP JJ)
    (ADJ_PROP+NSUFF_FEM_SG JJ)
    (ADJ_PROP+NSUFF_MASC_PL_NOM JJ)
    (ADJ_PROP+NSUFF_MASC_SG_ACC_INDEF JJ)
    (DET+ADJ JJ)
    (DET+ADJ+NSUFF_FEM_DU_ACCGEN JJ)
    (DET+ADJ+NSUFF_FEM_DU_NOM JJ)
    (DET+ADJ+NSUFF_FEM_PL JJ)
    (DET+ADJ+NSUFF_FEM_SG JJ)
    (DET+ADJ+NSUFF_MASC_DU_ACCGEN JJ)
    (DET+ADJ+NSUFF_MASC_DU_NOM JJ)
    (DET+ADJ+NSUFF_MASC_PL_ACCGEN JJ)
    (DET+ADJ+NSUFF_MASC_PL_NOM JJ)
    (DET+ADJ_PROP JJ)
    (DET+ADJ_PROP+NSUFF_FEM_SG JJ)
    (DET+ADJ_PROP+NSUFF_MASC_PL_ACCGEN JJ)
    (ADJ+CASE_DEF_ACC JJ)
    (ADJ+CASE_DEF_GEN JJ)
    (ADJ+CASE_DEF_NOM JJ)
    (ADJ+CASE_INDEF_ACC JJ)
    (ADJ+CASE_INDEF_GEN JJ)
    (ADJ+CASE_INDEF_NOM JJ)
    (ADJ+NSUFF_FEM_SG+CASE_DEF_ACC JJ)
    (ADJ+NSUFF_FEM_SG+CASE_INDEF_ACC JJ)
    (ADJ+NSUFF_FEM_SG+CASE_INDEF_GEN JJ)
    (ADJ+NSUFF_FEM_SG+CASE_INDEF_NOM JJ)
    (ADJ+NSUFF_FEM_PL+CASE_DEF_ACCGEN JJ)
    (ADJ+NSUFF_FEM_PL+CASE_DEF_NOM JJ)
    (ADJ+NSUFF_FEM_PL+CASE_INDEF_ACCGEN JJ)
    (ADJ+NSUFF_FEM_PL+CASE_INDEF_NOM JJ)
    (ADJ+NSUFF_FEM_SG+CASE_DEF_GEN JJ)
    (ADJ+NSUFF_FEM_SG+CASE_DEF_NOM JJ)
    (DET+ADJ JJ)
    (DET+ADJ+CASE_DEF_ACC JJ)
    (DET+ADJ+CASE_DEF_GEN JJ)
    (DET+ADJ+CASE_DEF_NOM JJ)
    (DET+ADJ+NSUFF_FEM_SG+CASE_DEF_ACC JJ)
    (DET+ADJ+NSUFF_FEM_SG+CASE_DEF_GEN JJ)
    (DET+ADJ+NSUFF_FEM_SG+CASE_DEF_NOM JJ)
    (DET+ADJ+NSUFF_FEM_PL+CASE_DEF_ACCGEN JJ)
    (DET+ADJ+NSUFF_FEM_PL+CASE_DEF_NOM JJ)

    ; RB
    (ADV RB)
    (ADV+NSUFF_FEM_SG RB)
    (ADV+NSUFF_MASC_SG_ACC_INDEF RB)
    (DET+ADV+NSUFF_FEM_SG     RB)
    (ADV+CASE_DEF_ACC RB)

    ; CC
    (CONJ CC)
    ;(CONJ+NEG_PART CC)

    ; DT
    (DEM_PRON_F DT)
    (DEM_PRON_FD DT)
    (DEM_PRON_FS DT)
    (DEM_PRON_MD DT)
    (DEM_PRON_MP DT)
    (DEM_PRON_MS DT)
    (DEM_PRON_MP+CASE_DEF_GEN DT)
    (DET DT)
    ;(DET+NEG_PART DT)
    ;(DET+PREP DT)

    ; RP
    (EMPHATIC_PARTICLE RP)
    (EMPHATIC_PART RP)
    (EXCEPT_PART RP)
    (INTERROG_PART RP)
    (NEG_PART RP)
    (NEG_PART+CASE_DEF_GEN RP)
    (NEG_PART+CASE_DEF_NOM RP)
    (NEG_PART+CASE_DEF_ACC RP)
    (NEG_PART+PVSUFF_SUBJ:3MS RP)
    (PART RP)
    (RESULT_CLAUSE_PARTICLE RP)
    (SUBJUNC RP)
    (VERB_PART RP)
    (FUT_PART RP)
    (INTERROG_PART+NEG_PART+PVSUFF_SUBJ:3FS RP)
    (INTERROG_PART+NEG_PART+PVSUFF_SUBJ:3MS RP)

    ; IN
    (FUNC_WORD IN)
    (PREP IN)
    (PREP+NSUFF_FEM_SG IN)
    (PREP+NSUFF_MASC_SG_ACC_INDEF IN)
    (PREP_PROP IN)
    (SUB_CONJ IN)
    (SUB_CONJ+NEG_PART IN)
    ; these next several are errors, but I'm putting them with IN just to
    ; get a mapping for them.  They should really be split at the +s.
    (PREP+PRON_3MP IN)
    (SUB_CONJ+PRON_3MP IN)

    ; VBP (old present tense tag used for imperfect verbs)
    (FUT+IV1P+VERB_IMPERFECT VBP)
    (FUT+IV1S+VERB_IMPERFECT VBP)
    (FUT+IV2MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (FUT+IV2MS+VERB_IMPERFECT VBP)
    (FUT+IV3FS+VERB_IMPERFECT VBP)
    (FUT+IV3MD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (FUT+IV3MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (FUT+IV1P+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (FUT+IV1S+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (FUT+IV2D+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (FUT+IV2MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (FUT+IV2MS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (FUT+IV3FD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (FUT+IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (FUT+IV3MS+VERB_IMPERFECT VBP)
    (IV1P+VERB_IMPERFECT VBP)
    (IV1P+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV1P+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (IV1S+VERB_IMPERFECT VBP)
    (IV1S+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV1S+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (IV1S+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBP)
    (IV1S+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBP)
    (IV2D+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (IV2FP+VERB_IMPERFECT+IVSUFF_SUBJ:FP VBP)
    (IV2FS+VERB_IMPERFECT+IVSUFF_SUBJ:2FS_MOOD:SJ VBP)
    (IV2MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (IV2MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (IV2MS+VERB_IMPERFECT VBP)
    (IV2MS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV2MS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (IV3FD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (IV3FD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:SJ VBP)
    (IV3FP+VERB_IMPERFECT+IVSUFF_SUBJ:FP VBP)
    (IV3FS+VERB_IMPERFECT VBP)
    (IV3MD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:I VBP)
    (IV3MD+VERB_IMPERFECT+IVSUFF_SUBJ:D_MOOD:SJ VBP)
    (IV3MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:I VBP)
    (IV3MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (IV3MS+VERB_IMPERFECT VBP)
    (FUT+IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (FUT+IV3MS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (IV3MS+VERB_IMPERFECT+IVSUFF_MOOD:I VBP)
    (IV3MS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV3FS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV3MS+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV1P+VERB_IMPERFECT VBP)
    (SUBJUNC+IV1P+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV1S+VERB_IMPERFECT VBP)
    (SUBJUNC+IV1S+VERB_IMPERFECT+IVSUFF_MOOD:S VBP)
    (SUBJUNC+IV3FS+VERB_IMPERFECT VBP)
    (SUBJUNC+IV3MP+VERB_IMPERFECT+IVSUFF_SUBJ:MP_MOOD:SJ VBP)
    (SUBJUNC+IV3MS+VERB_IMPERFECT VBP)
    (NEG_PART+PVSUFF_SUBJ:3FS VBP)
    (NEG_PART+PVSUFF_SUBJ:1P VBP)
    (NEG_PART+PVSUFF_SUBJ:3MS VBP)
    (NEG_PART+PVSUFF_SUBJ:3MP VBP)

    ; VBN (passive verb, using old past participle tag)
    (FUT+IV3FS+VERB_PASSIVE VBN)
    (FUT+IV3MS+VERB_PASSIVE VBN)
    (IV1P+VERB_PASSIVE VBN)
    (IV1S+VERB_PASSIVE VBN)
    (IV2MS+VERB_PASSIVE VBN)
    (IV3FS+VERB_PASSIVE VBN)
    (IV3MP+VERB_PASSIVE+IVSUFF_SUBJ:MP_MOOD:I VBN)
    (IV3MS+VERB_PASSIVE VBN)
    (VERB_PASSIVE VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:1S VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:3FS VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:3MD VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:3MP VBN)
    (VERB_PASSIVE+PVSUFF_SUBJ:3MS VBN)
    (FUT+IV3FS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (FUT+IV3FS+VERB_IMPERFECT_PASSIVE VBN)
    (FUT+IV3MP+VERB_IMPERFECT_PASSIVE+IVSUFF_SUBJ:MP_MOOD:I VBN)
    (FUT+IV3MS+VERB_IMPERFECT_PASSIVE VBN)
    (FUT+IV3MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV3FS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV3MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV1P+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV1S+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV1S+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (IV2MS+VERB_IMPERFECT_PASSIVE VBN)
    (IV2MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:I VBN)
    (IV2MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (IV3FS+VERB_IMPERFECT_PASSIVE VBN)
    (IV3FS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (IV3MP+VERB_IMPERFECT_PASSIVE+IVSUFF_SUBJ:MP_MOOD:I VBN)
    (IV3MP+VERB_IMPERFECT_PASSIVE+IVSUFF_SUBJ:MP_MOOD:SJ VBN)
    (IV3MS+VERB_IMPERFECT_PASSIVE VBN)
    (IV3MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3FS VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3FP VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3MD VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3MP VBN)
    (VERB_PERFECT_PASSIVE+PVSUFF_SUBJ:3MS VBN)
    (SUBJUNC+IV3MS+VERB_IMPERFECT_PASSIVE+IVSUFF_MOOD:S VBN)

    ; UH
    (INTERJ UH)
    (INTERJ+NSUFF_MASC_SG_ACC_INDEF UH)
    (INTERJ+CASE_INDEF_NOM UH)

    ; PRP
    (CVSUFF_DO:3MS PRP)
    (IVSUFF_DO:1P PRP)
    (IVSUFF_DO:1S PRP)
    (IVSUFF_DO:2MP PRP)
    (IVSUFF_DO:2MS PRP)
    (IVSUFF_DO:3D PRP)
    (IVSUFF_DO:3FS PRP)
    (IVSUFF_DO:3MP PRP)
    (IVSUFF_DO:3MS PRP)
    (PRON PRP)
    (PRON_1P PRP)
    (PRON_1S PRP)
    (PRON_2FS PRP)
    (PRON_2MP PRP)
    (PRON_2MS PRP)
    (PRON_3D PRP)
    (PRON_3FP PRP)
    (PRON_3FS PRP)
    (PRON_3MP PRP)
    (PRON_3MS PRP)
    (PVSUFF_DO:1P PRP)
    (PVSUFF_DO:1S PRP)
    (PVSUFF_DO:2MS PRP)
    (PVSUFF_DO:3D PRP)
    (PVSUFF_DO:3FS PRP)
    (PVSUFF_DO:3MP PRP)
    (PVSUFF_DO:3MS PRP)
    (PVSUFF_SUBJ:1P PRP)
    (PVSUFF_SUBJ:1S PRP)
    (PVSUFF_SUBJ:3FS PRP)

    ; PRP$
    (POSS_PRON_1P PRP$)
    (POSS_PRON_1S PRP$)
    (POSS_PRON_2FS PRP$)
    (POSS_PRON_2MP PRP$)
    (POSS_PRON_2MS PRP$)
    (POSS_PRON_3D PRP$)
    (POSS_PRON_3FP PRP$)
    (POSS_PRON_3FS PRP$)
    (POSS_PRON_3MP PRP$)
    (POSS_PRON_3MS PRP$)

    ; WRB
    (REL_ADV WRB)

    ; WP
    (REL_PRON WP)
    (REL_PRON+NSUFF_MASC_SG_ACC_INDEF WP)
    ;(REL_PRON+PREP WP)

    ; VBD
    (VERB_PERFECT VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:1P VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:1S VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:2FS VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:2MP VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:2MS VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3FD VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3FP VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3FS VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3MD VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3MP VBD)
    (VERB_PERFECT+PVSUFF_SUBJ:3MS VBD)
    (NEG_PART+VERB_PERFECT+PVSUFF_SUBJ:3FS VBD)
    (NEG_PART+VERB_PERFECT+PVSUFF_SUBJ:3MS VBD)

    ; VB (used for imperative here)
    (VERB_IMPERATIVE+CVSUFF_SUBJ:2MP VB)
    (VERB_IMPERATIVE+CVSUFF_SUBJ:2MS VB)

    ; CD
    (NUM CD))


;;; THE FOLLOWING DATA IS CURRENTLY NOT USED BY danbikel.parser.english.Training

;;; a list of contexts in which baseNP's can occur
;;; the syntax is: (base-np <context>+)
;;; where
;;; <context>    ::= (<parent> (<child>+)) | (<parent> <context>)
;;; <parent>     ::= the symbol of a parent nonterminal
;;; <child>      ::= <childsym> | (not <childsym>)
;;; <childsym>   ::= the symbol of a child nonterminal
;;;
;;; where (not <childsym>) matches any symbol that is not <childsym>.
(base-np (NP ((not NP)))
	 (NP (NP (head POS))))
