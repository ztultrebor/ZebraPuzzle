from itertools import permutations

houses = list(permutations(('red', 'green', 'ivory', 'yellow', 'blue')))
wheres = list(permutations(('englishman', 'spaniard', 'ukranian', 'norwegian', 'japanese')))
petses = list(permutations(('dog', 'snails', 'fox', 'horse', 'zebra')))
drinks = list(permutations(('coffee', 'tea', 'milk', 'orange juice', 'water')))
smokes = list(permutations(('old gold', 'kools', 'chesterfields', 'lucky strike', 'parliaments')))

ans = []
for h in houses:
    if h.index('ivory')-h.index('green')==1:
        for w in wheres:
            if (w.index('englishman')==h.index('red')
            and w.index('norwegian')==0
            and abs(w.index('norwegian')-h.index('blue'))==1):
                for p in petses:
                    if w.index('spaniard')==p.index('dog'):
                        for d in drinks:
                            if (d.index('coffee')==h.index('green')
                            and w.index('ukranian')==d.index('tea')
                            and d.index('milk')==2):
                                for s in smokes:
                                    if (s.index('old gold')==p.index('snails')
                                    and s.index('kools')==h.index('yellow')
                                    and abs(s.index('chesterfields')-p.index('fox'))==1
                                    and abs(s.index('kools')-p.index('horse'))==1
                                    and s.index('lucky strike')==d.index('orange juice')
                                    and w.index('japanese')==s.index('parliaments')):
                                        ans.append((h,w,p,d,s))

print(ans)

