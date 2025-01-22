#lang racket
(require test-engine/racket-tests)

;; Number -> Number
;; Using Newton's Method, returns the approximate square root of a number x.
(define (sqrt-newton x)
  (define INITIAL-GUESS 1.0)

  (define (good-enough? guess)
    (< (abs (- (sqr guess) x)) EPSILON))

  (define (improve guess)
    (avg guess (/ x guess)))

  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (sqrt-iter INITIAL-GUESS))

(define EPSILON 0.001)

(define (avg x y)
  (/ (+ x y) 2))

(check-within (sqrt-newton 4) 2 EPSILON)

(test)
