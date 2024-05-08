#lang racket

(define coordinate0 (cons 2 5)) ;dotted pairs
(define coordinate1 (cons 3 7))

(define (display-coordinates c0 c1)
    (printf "Coordinate0: x = ~a, y = ~a\n" (car c0) (cdr c0))
    (printf "Coordinate1: x = ~a, y = ~a\n" (car c1) (cdr c1)))

(define (midpoint c0 c1)
    (let (
        [x (/ (+ (car c0) (car c1)) 2)]
        [y (/ (+ (cdr c0) (cdr c1)) 2)])
    (printf "Midpoint: x = ~a, y = ~a\n" x y)
    (cons x y)))

(display-coordinates coordinate0 coordinate1)
(midpoint coordinate0 coordinate1)

