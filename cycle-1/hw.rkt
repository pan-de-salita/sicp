#lang racket
(require test-engine/racket-tests)

;;;; 2.
;; [List-of Number] -> [List-of Number] | Null
;; Given a List of Numbers lon, returns a List of the squares of the Numbers.
(define (squares lon [res null])
  (if (null? lon)
      res
      (squares (cdr lon) (append res (list (sqr (car lon)))))))

(check-expect (squares '()) '())
(check-expect (squares '(1 2 3 4 5)) '(1 4 9 16 25))

;;;; 3.
;; [List-of Symbol] -> [List-of Symbol] | Null
;; Given a List of Symbols sent, returns a List of Symbols in which every instance of the words "I"
;; or "me" is replaced by "you", while every instance of "you" is replaced by "me" except at the
;; beginning of the sentence, where it's replaced by "I". Capitalization of letters is ignored.
(define (switch sent)
  (define (switch-car sym)
    (cond [(or (symbol=? sym 'i) (symbol=? sym 'me)) 'you]
          [(symbol=? sym 'you) 'i]
          [else sym]))

  (define (switch-cdr sent-cdr [res null])
    (cond [(null? sent-cdr) res]
          [(or (symbol=? (car sent-cdr) 'i) (symbol=? (car sent-cdr) 'me))
           (switch-cdr (cdr sent-cdr) (append res '(you)))]
          [(symbol=? (car sent-cdr) 'you)
           (switch-cdr (cdr sent-cdr) (append res '(me)))]
          [else (switch-cdr (cdr sent-cdr)
                            (append res (list (car sent-cdr))))]))

  (if (null? sent)
      null
      (cons (switch-car (symbol-downcase (car sent)))
            (switch-cdr (cdr (sent-downcase sent))))))

(check-expect (switch '(You told me that I should wake you up))
              '(i told you that you should wake me up))

;; Symbol -> Symbol
;; Given a Symbol sym, returns a Symbol that is the downcase version of sym.
(define (symbol-downcase sym)
  (string->symbol (string-downcase (symbol->string sym))))

(check-expect (symbol-downcase 'I) 'i)
(check-expect (symbol-downcase 'You) 'you)

;; [List-of Symbol] -> [List-of Symbol]
;; Given a List of Symbols sent, returns a List of the Symbols of sent in lower case.
(define (sent-downcase sent [res null])
  (if (null? sent)
      res
      (sent-downcase (cdr sent)
                     (append res (list (symbol-downcase (car sent)))))))

(check-expect (sent-downcase '(You told me that I should wake you up))
              '(you told me that i should wake you up))

;;;; 4.
;; [List-of Number] -> Boolean
;; Checks whether a List of Numbers lon is ordered by ascending order.
;; (define (ordered? lon)
;;   (if (or (null? lon) (null? (cdr lon)))
;;       #t
;;       (if (not (<= (car lon) (cadr lon)))
;;           #f
;;           (ordered? (cdr lon)))))

(define (ordered? lon)
  (or (or (null? lon)
          (null? (cdr lon)))
      (and (<= (car lon) (cadr lon))
           (ordered? (cdr lon)))))

(check-expect (ordered? '()) #t)
(check-expect (ordered? '(1 2 3 4 5)) #t)
(check-expect (ordered? '(2 5 1 4 3)) #f)
(check-expect (ordered? '(5 4 3 2 1)) #f)

;;;; 5.
;; [List-of Symbols] -> [List-of Symbols]
;; Given a List of Symbols los, returns a List of Symbols containing only those words of the argument
;; whose last letter is "E".
(define (ends-e los [res null])
  (if (null? los)
      res
      (ends-e (cdr los)
              (if (or (symbol=? (symbol-last-char (car los)) 'e)
                      (symbol=? (symbol-last-char (car los)) 'E))
                  (append res (list (car los)))
                  res))))

(check-expect (ends-e '(please put the salami above the blue elephant))
              '(please the above the blue))

;; Symbol -> Symbol
;; Returns the last character of a Symbol.
(define (symbol-last-char sym)
  (string->symbol
    (substring (symbol->string sym)
               (sub1 (string-length (symbol->string sym))))))

(check-expect (symbol-last-char 'word) 'd)

(test)
