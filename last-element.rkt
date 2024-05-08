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

;same function but no lambda
(define (last-element-no-lamda l)
    (cond
        ((null? l) error "Empty List")
        ((null? (cdr l)) (car l))
        (else (last-element-no-lamda(cdr l)))))

(last-element '(3 4 5 6 7 8)) ;returns 8