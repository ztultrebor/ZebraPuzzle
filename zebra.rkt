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
    (local ((define contented? (lambda (l) (not (empty? l))))
            (define (solve h w p d s)
                (cond
                    [(and (= (position w "norwegian") 0)
                          (= (position d "milk") 2)
                          (= (position w "ukranian") (position d "tea"))
                          (= (- (position h "ivory") (position h "green")) 1)
                          (= (position w "englishman") (position h "red"))
                          (= (position d "coffee") (position h "green"))
                          (= (abs (- (position w "norwegian") (position h "blue"))) 1)
                          (= (position s "kools") (position h "yellow"))
                          (= (position s "lucky strike") (position d "orange juice"))
                          (= (position w "japanese") (position s "parliaments"))
                          (= (position w "spaniard") (position p "dog"))
                          (= (position s "old gold") (position p "snails"))
                          (= (abs (- (position s "chesterfields") (position p "fox"))) 1)
                          (= (abs (- (position s "kools") (position p "horse"))) 1))
                            (list h w p d s)]
                    [else '()])))
    ; - IN -
    (filter contented? (map (lambda (w) 
        (filter contented? (map (lambda (d) 
            (filter contented? (map (lambda (h) 
                (filter contented? (map (lambda (s) 
                    (filter contented? (map (lambda (p) (solve h w p d s)) ps))) ss))) hs))) ds))) ws))))



(define houses (permute '("red" "green" "ivory" "yellow" "blue")))
(define wheres (permute '("englishman" "spaniard" "ukranian" "norwegian" "japanese")))
(define petses (permute '("dog" "snails" "fox" "horse" "zebra")))
(define drinks (permute '("coffee" "tea" "milk" "orange juice" "water")))
(define smokes (permute '("old gold" "kools" "chesterfields" "lucky strike" "parliaments")))

(solve houses wheres petses drinks smokes)