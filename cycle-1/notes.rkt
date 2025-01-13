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
