from itertools import permutations

def solve():
    houses = list(permutations(('red', 'green', 'ivory', 'yellow', 'blue')))
    wheres = list(permutations(('englishman', 'spaniard', 'ukranian', 'norwegian', 'japanese')))
    petses = list(permutations(('dog', 'snails', 'fox', 'horse', 'zebra')))
    drinks = list(permutations(('coffee', 'tea', 'milk', 'orange juice', 'water')))
    smokes = list(permutations(('old gold', 'kools', 'chesterfields', 'lucky strike', 'parliaments')))
    for w in wheres:
        if w.index('norwegian')==0:
            for d in drinks:
                if (d.index('milk')==2
                and w.index('ukranian')==d.index('tea')):
                    for h in houses:
                        if (h.index('ivory')-h.index('green')==1
                        and w.index('englishman')==h.index('red')
                        and abs(w.index('norwegian')-h.index('blue'))==1
                        and d.index('coffee')==h.index('green')):
                            for s in smokes:
                                if (s.index('kools')==h.index('yellow')
                                and s.index('lucky strike')==d.index('orange juice')
                                and w.index('japanese')==s.index('parliaments')):
                                    for p in petses:
                                        if (w.index('spaniard')==p.index('dog')
                                        and s.index('old gold')==p.index('snails')
                                        and abs(s.index('chesterfields')-p.index('fox'))==1
                                        and abs(s.index('kools')-p.index('horse'))==1):
                                            return (h,w,p,d,s)

print(solve())