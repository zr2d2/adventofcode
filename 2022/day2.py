code = {'A': 'rock', 'B': 'paper', 'C': 'scissors', 'X': 'rock', 'Y': 'paper', 'Z': 'scissors'}
score = {'rock':1,'paper':2,'scissors':3}
win = {"A":"B", "B":"C", "C":"A"}
loose = {"A":"C","C":"B","B":"A"}
#Rock defeats Scissors, Scissors defeats Paper, and Paper defeats Rock
#  1             2         2                3         3            1
def match(outcome, them):   
    if outcome == 'Y':
        you = them
        print("You draw and get {} points".format(score[code[you]] + 3))
        return score[code[you]] + 3
    elif (outcome == 'Z'):
        you = win[them]
        print("You win and get {} points".format(score[code[you]] + 6))
        return score[code[you]] + 6
    else:
        you = loose[them]
        print("You loose and get {} points".format(score[code[you]]))
        return score[code[you]]

with open('day2input.txt') as f:
    rounds = f.readlines()

points = 0
for entry in rounds:
    they     = entry[0]
    outcome  = entry[2]

    points += match(outcome, they)
print("you have {} points".format(points))