from itertools import permutations

def solve():
    houses = list(permutations(('red', 'green', 'ivory', 'yellow', 'blue')))
    wheres = list(permutations(('englishman', 'spaniard', 'ukranian', 'norwegian', 'japanese')))
    petses = list(permutations(('dog', 'snails', 'fox', 'horse', 'zebra')))
    drinks = list(permutations(('coffee', 'tea', 'milk', 'orange juice', 'water')))
    smokes = list(permutations(('old gold', 'kools', 'chesterfields', 'lucky strike', 'parliaments')))
    return next((h,w,p,d,s)
            for w in wheres
            if w.index('norwegian')==0
            for d in drinks
            if d.index('milk')==2 
            if w.index('ukranian')==d.index('tea')
            for h in houses
            if h.index('ivory')-h.index('green')==1 
            if w.index('englishman')==h.index('red')
            if d.index('coffee')==h.index('green') 
            if abs(w.index('norwegian')-h.index('blue'))==1
            for s in smokes
            if s.index('kools')==h.index('yellow') 
            if s.index('lucky strike')==d.index('orange juice')
            if w.index('japanese')==s.index('parliaments')
            for p in petses
            if w.index('spaniard')==p.index('dog') 
            if s.index('old gold')==p.index('snails')
            if abs(s.index('chesterfields')-p.index('fox'))==1 
            if abs(s.index('kools')-p.index('horse'))==1)
                                        

print(solve())