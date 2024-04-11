#lang racket

;replaces instances of x with y 
(define replace
    (lambda (l x y)
        (cond
            ((null? l) l) ;if list is empty, return it
            ((equal? (car l) x)
                (cons y (replace (cdr l) x y)) ;if first element is x, replace with y
            ) 
            (else
                (cons (car l) (replace (cdr l) x y)) ;else, keep first element and continue
            )
        )
    )
)

(replace '(1 1 0 1 0 1) 0 1) ;returns '(1 1 1 1 1 1)