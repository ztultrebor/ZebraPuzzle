#lang Racket



;======================
; functions


(define (permute lst)
; [ListOf X] -> [ListOf [ListOf X]]
; create all permutations of given lst
    (local ((define-struct intermute [prefix suffix])
            (define (permute im)
                (match im
                    [(intermute prefix '()) (list prefix)]
                    [(intermute prefix suffix)
                    (foldr append '()
                            (map permute
                                (map (lambda (c) (make-intermute (cons c prefix) (remove c suffix)))
                                    suffix)))])))
    ; - IN -
    (permute (make-intermute '() lst))))


(define (position l x)
    ; [ListOf X] X -> N
    ; returns the position of x in l
    (local ((define (position l n)
                (cond
                    [(empty? l) #f]
                    [(equal? (first l) x) n]
                    [else (position (rest l) (add1 n))])))
    ; - IN -
    (position l 0)))
        

(define (solve hs ws ps ds ss)
    ; [ListOf String] [ListOf String] -> [ListOf [ListOf String]]
    ; returns a valid solution to the zebra puzzle
    (filter (lambda (l) (and
        (= (position (fifth l) "lucky strike") (position (fourth l) "orange juice"))
        (= (position (fifth l) "kools") (position (first l) "yellow"))
        (= (position (second l) "spaniard") (position (third l) "dog"))
        (= (position (second l) "japanese") (position (fifth l) "parliaments"))))
    (foldr append '() 
            (map (lambda (l2) 
            (map (lambda (l1) (list (first l1) (second l1) (first l2) (third l1) (second l2)))
    (filter (lambda (l) (and
        (= (position (third l) "coffee") (position (first l) "green"))
        (= (position (second l) "ukranian") (position (third l) "tea"))))
    (foldr append '() (map (lambda (d) (map (lambda (l) (list (first l) (second l) d))
    (filter (lambda (l) (and 
        (= (position (second l) "englishman") (position (first l) "red"))
        (= (abs (- (position (second l) "norwegian") (position (first l) "blue"))) 1)))
    (foldr append '() (map (lambda (w) (map (lambda (h) (list h w))
    (filter (lambda (h) (= (- (position h "ivory") (position h "green")) 1)) hs)))
    (filter (lambda (w) (= (position w "norwegian") 0)) ws))))))
    (filter (lambda (d) (= (position d "milk") 2)) ds))))))
    (filter (lambda (l) (and 
        (= (position (second l) "old gold") (position (first l) "snails"))
        (= (abs (- (position (second l) "chesterfields") (position (first l) "fox"))) 1)
        (= (abs (- (position (second l) "kools") (position (first l) "horse"))) 1)))
    (foldr append '() (map (lambda (s) (map (lambda (p) (list p s)) ps)) ss)))))))



;=========================
; constants


(define houses (permute '("red" "green" "ivory" "yellow" "blue")))
(define wheres (permute '("englishman" "spaniard" "ukranian" "norwegian" "japanese")))
(define petses (permute '("dog" "snails" "fox" "horse" "zebra")))
(define drinks (permute '("coffee" "tea" "milk" "orange juice" "water")))
(define smokes (permute '("old gold" "kools" "chesterfields" "lucky strike" "parliaments")))


;========================
; action!


(solve houses wheres petses drinks smokes)