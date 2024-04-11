#lang racket

;returns length of a list
(define list-length
    (lambda (l)
        (cond 
            ((null? l) 0) ;empty list
            (else (+ 1 (list-length (cdr l)))) ;add 1 to result and process rest of list
        )
    )
)

(list-length (quote(1 2 3 4))) ;returns 4