#lang racket
(require test-engine/racket-tests)

;;;; 1.1
10
;; => 10
(+ 5 3 4)
;; => 12
(- 9 1)
;; => 8
(/ 6 2)
;; => 3
(+ (* 2 4) (- 4 6))
;; 6
(define a 3)
;; => Empty result.
(define b (+ a 1))
;; => Empty result.
(+ a b (* a b))
;; => 19
(= a b)
;; #f
(if (and (> b a) (< b (* a b)))
    b
    a)
;; => 3

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;; => 16

(+ 2 (if (> b a) b a))
;; => 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
;; => 16

;;;; 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;;;; 1.3
;; Number Number Number -> Number
;; Given three numbers, computes the sum of the squares of the two larger numbers.
(define (sum-of-two-largest-squared small medium large)
  (cond [(> small medium) (sum-of-two-largest-squared medium small large)]
        [(> medium large) (sum-of-two-largest-squared small large medium)]
        [else (+ (sqr medium) (sqr large))]))

(check-expect (sum-of-two-largest-squared 1 2 3) 13)
(check-expect (sum-of-two-largest-squared 1 3 2) 13)
(check-expect (sum-of-two-largest-squared 2 3 1) 13)

;;;; 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;; Depending on whether b is positive, the `if` expression evaluatates to either + or -, giving the
;; combination a primitive operator.

;;;; 1.5
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;; Applicative-order evaluation
;; (test 0 (p)) never finishes evaluation. In applicative-order evaluation, all subexpressions of an
;; expression are evaluated before the resulting operator is applied to the resulting operands.
;; Evaluating (test 0 (p)) gives us the following progression:
;;
;; (test 0 (p))
;; ((lambda (x y) (if (= x 0) 0 y)) 0 (p))
;; ((lambda (x y) (if (= x 0) 0 y)) 0 ((lambda () (p))))
;; ((lambda (x y) (if (= x 0) 0 y)) 0 (p))
;; ((lambda (x y) (if (= x 0) 0 y)) 0 ((lambda () (p))))
;; ((lambda (x y) (if (= x 0) 0 y)) 0 (p))
;; ...
;;
;; Note how the recursive nature of `p` leads to an infinite loop, thus causing the operation to
;; never terminate.

;; Normal-order evaluation
;; (test 0 (p)) does finish evaluation, yielding 0. In normal-order evaluation, operand expressions
;; are substituted for parameters until the evaluation obtains an expression involving only primitive
;; operators. Only then is evaluation performed. However, operands are only evaluated until their
;; values are needed, meaning in an `if` expression, if a consequent expression is evaluated, the
;; alternative is ignored:
;;
;; (test 0 (p))
;; ((lambda (x y) (if (= x 0) x y)) 0 (p))
;; (if (= x 0) 0 (p))
;; (if #t 0 (p))
;; => 0

(test)

