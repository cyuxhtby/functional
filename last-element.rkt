#lang racket

;returns last element of a list
(define last-element
    (lambda (l)
        (cond 
            ((null? l) "Empty list")
            ((null? (cdr l)) (car l)) ;if current element points to null, return it
            (else (last-element(cdr l))) ;feed in rest of list
        )
    )
)

(last-element '(3 4 5 6 7 8)) ;returns 8