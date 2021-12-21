with open('day1input.txt') as f:
    depths = f.readlines()

inc = 0
lastDepth = 0
for depth in depths:
    if int(depth) > lastDepth:
        inc +=1
    lastDepth = int(depth)
inc = inc - 1

print("there were {} increases".format(inc))