#lang racket

;return a new list with first occurance of element removed
(define delete
    (lambda (l elem)
        (cond
            ((null? l) '()) ;return empty list
            ((equal? (car l) elem) ;if first element is elem
                (cdr l) ;return rest of list instead
            )
            (else (cons (car l) (delete (cdr l) elem))) ;otherwise keep element and feed in rest of list
        )
    )
)

(delete '(1 2 2 3) 2) ;returns '(1 2 3)