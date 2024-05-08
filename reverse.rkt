#lang racket

(define (concat l1 l2)
    (cond ((null? l1) l2)
        (else (cons (car l1) (concat (cdr l1) l2)))))

;reverses a list
(define (reverse l)
    (if (null? l)
        '()
        (concat (reverse (cdr l)) (list (car l)))))

(reverse `(1 2 3 4)) ;returns '(4 3 2 1)