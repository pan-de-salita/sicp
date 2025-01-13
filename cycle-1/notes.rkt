#lang racket

;; READING:
;; Section 1.1, pages 1-31

;; QUOTABLES:
;;
;; --- Foreword
;; - The programmer must seek both perfection of part and aequacy of collection.
;; - Using Lisp we restrict or limit not what we may program, but only the notation for
;; our program descriptions.
;; - Thus even though our programs are carefully handcrafted discrete collections of symbols,
;; mosaics of interlocking functions, they continually evolve: we change them as our perception of
;; the model deepends, enlarges, generalizes until the model ultimately attains a metastable place
;; within still another model with which we struggle.
;; - If art interprets our dreams, the computer executs them in the guise of programs! (Foreword)
;; - As in every other symbolic activit, we become convinced of program truth through argument.
;; Since large programs grow from small ones, it is crucial that we develop an arsenal of standard
;; program structures of whose correctness we have become sure -- we call them idioms -- and learn
;; to combine them into large strucures using organizational techniques of proven value.
;; - Unlike programs, computers must obey the laws of physics.
;; - Lisp is for building organism -- imposing, breathtaking, dynamic structures built by squads
;; fitting fluctuating myriads of simpler organisms into place.
;; - Invent and fit; have fits and reinvent!
;;
;; --- Preface to the Second Edition
;; - Is it possible that software is not like anything else, that it is meant to be discarded: that
;; the whole point is to always see it as a soap bubble?
;;
;; --- Preface to the First Edition
;; - Our goal is that students who complete this subject should have a good feel for the elements
;; of style and the aesthetics of programming. They should have command of the majob techniques for
;; controlling complexity in a large system. They should be capable of reading a 50-page-long
;; program, if it is written in an exemplary style. They should know what not to read, and what
;; they need not understand at any moment. They should feel secure about modifying a program,
;; retaining the spirit and style of the original author.
;; - Mathematics provides a framework for dealing with notions of "what is". Computation provides
;; a framework for dealing precisely with notions of "how to".

;; THOUGHTS:
;;
;; --- Program as:
;; - Descripiton
;; - Model, always evolving
;;
;; --- Recursive relation between software and hardware:
;; Programs, because ran on computers, are bound by the laws of physics, which in turn are also
;; decribed by computational/programmatic models
;;
;; --- Lisp and agility:
;; - Lisp, due to its simplicity and reliance on a relatively small set of data structures (the
;; chief of which being the list), demands that the programmer be agile and open to evolution
;;
;; --- Two major (pedagogical?) concerns of SICP:
;; - A computer language is not just a way of getting a computer to perform operations but rather
;; [...] a novel formal medium for expressing ideas about methodology
;; - The focus of techniques used to control the intellectual complexity of large software systems
;;
;; --- Ways to control complexity:
;; - Building abstractions that hide details when appropriate
;; - Establishing conventional interfaces that enable us to construct systems by combining standard,
;; well-understood pieces in a "mix and match" way
;; - Establishing new languages for describing a design, each of which emphasizes particular
;; aspects of the design and deemphasizes others
;;
;; --- Procedural epistemology:
;; - The study of the structure of knowledge from an imperative point of view, as opposed to the
;; more declarative point of view taken by classical mathematical subjects
;;
;; --- SICP program design: Figure out:
;; 1. What we want to compute
;; 2. How we will decopose problems into manageable parts
;; 3. How we will work on the parts

(define (square x) (* x x))
