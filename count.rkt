#lang racket

;counts how many times an element shows up in list
(define count
    (lambda (l element)
        (cond
            ((null? l) 0) ;if list is empty return 0
            ((equal? element (car l))
                (+ 1 (count (cdr l) element)) ;if a match, add 1 to the return
            )
            (else (count (cdr l) element)) ;else feed in rest of list
        )
    )
)

(count '(1 2 3 4 5 5 5 5 6) 5) ;returns 4