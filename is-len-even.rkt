(define (is-len-even l)
    (= 0 (modulo (length l) 2)))


(is-len-even '(1)); #f
(is-len-even '(1 2)); #t