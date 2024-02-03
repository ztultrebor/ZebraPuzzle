from itertools import permutations

def solve():
    houses = (0,1,2,3,4)
    return next((zebra, water)
            for (englishman, spaniard, ukranian, norwegian, japanese) in permutations(houses)
            if norwegian==0
            for (coffee, tea, milk, orange_juice, water) in permutations(houses)
            if milk==2 
            if ukranian==tea
            for (red, green, ivory, yellow, blue) in permutations(houses)
            if ivory-green==1 
            if englishman==red
            if coffee==green
            if abs(norwegian-blue)==1
            for (old_gold, kools, chesterfields, lucky_strike, parliaments) in permutations(houses)
            if kools==yellow
            if lucky_strike==orange_juice
            if japanese==parliaments
            for (dog, snails, fox, horse, zebra) in permutations(houses)
            if spaniard==dog
            if old_gold==snails
            if abs(chesterfields-fox)==1 
            if abs(kools-horse)==1)
                                        

print(solve())