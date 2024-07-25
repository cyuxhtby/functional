#lang racket

; Enables the creation of anonymous recursive functions
(define YCombinator
    ; 1st nested lamda takes in a function to be made recursive
    (lambda (f)
        ; 2nd nested lambda establishes the self-referential behavior
        ((lambda (x) (x x))
            ; 3rd nested lambda creates the recursive structure
            (lambda (g)
                (f (lambda args 
                    ; (g g) reconstructs the entire self-referential structure
                    ; f receives this lambda, which uses the reconstructed structure:
                    ; `(f (lambda args (apply (g g) args)))`
                    ; For each recursive call, a new instance of this structure is created
                    ; Since this structure handles arbitrary arguments, f is able to handle recursive execution without explicitly defining itself
                    (apply (g g) args)))))))


; Exemplified use ----
(define factorial
    (YCombinator (lambda (f)
        (lambda (n)
        (cond
        ((< n 0) (error "Only non-negative integers"))
            ((= n 0) 1)
            (else (* n (f (- n 1)))))))))

(define print
    (YCombinator (lambda (f)
        (lambda (element amount)
            (cond
                ((= amount 0) (newline))
                (else
                    (begin
                        (display element)
                        (display " ")
                        (f element (- amount 1)))))))))

(display (factorial 5)) ; 120
(newline)
(print "Yo" 3) ; Yo Yo Yo