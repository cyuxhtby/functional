#lang racket

(define factorial
    (lambda (n)
        (cond
            ((= n 0) 1)
            ((< n 0) (* n (factorial (+ n 1)))) ; handles negative inputs
            (else (* n (factorial (- n 1))))
        )
    )
)

(factorial 10) ;returns 3628800
(factorial -5) ;returns -120