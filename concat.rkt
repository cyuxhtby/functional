#lang racket

;concatenates two lists
(define concat
    (lambda (l1 l2)
        (cond
            ((null? l1) l2) ;once l1 is empty, return l2
            (else 
                ;construct a new list with first element of l1 and the result of concatenating the rest of l1 with l2
                (cons (car l1) (concat (cdr l1) l2))
            )
        )
    )
)

(concat '(1 2 3 4 5) '(6 7 8 9)) ;returns '(1 2 3 4 5 6 7 8 9)
