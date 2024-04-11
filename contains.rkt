#lang racket

(define contains
    (lambda (l element)
        (cond
            ((null? l) #f)
            ((equal? element (car l)) #t) ;
            (else (contains (cdr l) element))
        )
    )
)

(contains '(1 2 3 4 5) 6) ;returns #f
(contains '(1 2 3 4 5) 2) ;returns #t

