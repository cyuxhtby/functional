#lang r5rs

;returns the minimum distance to the target (T) one can achieve by placing a + or – in front of every number in the list (L) and getting the total
(define min-distance
  (lambda (L T current-sum)
    (cond
      ((null? L) (abs (- current-sum T)))  ;once list is empty, return the absolute difference between the current sum and the target
      (else  ;recursively calculate both adding and subtracting the current element from current sum, recursive call returns element closest to target
        (if (< (abs (min-distance (cdr L) T (+ current-sum (car L)))) 
               (abs (min-distance (cdr L) T (- current-sum (car L)))))
            (min-distance (cdr L) T (+ current-sum (car L)))
            (min-distance (cdr L) T (- current-sum (car L)))
        )
      )
    )
  )
)

(min-distance `(1 2 3) 5 0) ;1
(min-distance `(2 2 2) 2 0) ;0
(min-distance `(73 98 71 17 15 34 38 16 68 43) 400 0) ;3
(min-distance `(41 98 5 29 93 58 82 38 3 68 49 77 59 47 72 93 42 43 82 9) 1042 0) ;12
(min-distance `(858 555 868 790 301 696 505 333 838 375 198 329 836 677 912) 1 0) ;0



