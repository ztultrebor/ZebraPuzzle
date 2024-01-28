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
    (filter (lambda (l) (and (= (position (second l) "spaniard") (position (third l) "dog"))
                          (= (position (fifth l) "old gold") (position (third l) "snails"))
                          (= (abs (- (position (fifth l) "chesterfields") (position (third l) "fox"))) 1)
                          (= (abs (- (position (fifth l) "kools") (position (third l) "horse"))) 1)))
    (foldr append '() (map (lambda (p)
    (filter (lambda (l) (and (= (position (fifth l) "kools") (position (first l) "yellow"))
                          (= (position (fifth l) "lucky strike") (position (fourth l) "orange juice"))
                          (= (position (second l) "japanese") (position (fifth l) "parliaments"))))
        (foldr append '() (map (lambda (s)
            (filter (lambda (l) (and
                                    (= (position (second l) "englishman") (position (first l) "red"))
                                    (= (position (fourth l) "coffee") (position (first l) "green"))
                                    (= (abs (- (position (second l) "norwegian") (position (first l) "blue"))) 1)))
                (foldr append '() (map (lambda (h)
                    (filter (lambda (l) (= (position (second l) "ukranian") (position (fourth l) "tea")))
                        (foldr append '() (map (lambda (d)
                            (map (lambda (w) (list h w p d s))
                                (filter (lambda (w) (= (position w "norwegian") 0)) ws)))
                                (filter (lambda (d) (= (position d "milk") 2)) ds)))))
                                (filter (lambda (h) (= (- (position h "ivory") (position h "green")) 1)) hs)))))
                                ss))))
                                ps)))
    #;
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