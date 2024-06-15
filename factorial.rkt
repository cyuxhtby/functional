#lang racket

(define factorial
    (lambda (n)
        (cond
            ((< n 0) (error "Only non-negative integers"))
            ((= n 0) 1)
            (else (* n (factorial (- n 1))))
        )
    )
)

(factorial 10) ;returns 3628800
(factorial -5) ;throws error