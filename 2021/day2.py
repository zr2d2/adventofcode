import pprint

depth = 0
horizonal = 0

with open('day2input.txt') as f:
    lines = f.readlines()
    instructions = [i.split() for i in lines]

#Part 1
for inst in instructions:
    if (inst[0] == 'down'):
        depth = depth - int(inst[1])
    elif (inst[0] == 'up'):
        depth = depth + int(inst[1])
    elif (inst[0] == 'forward'):
        horizonal = horizonal + int(inst[1])
    else:
        print("don't know how to process command {} with number {}".format(depth,horizonal))
    print("after {}, you are at {},{}".format(inst, depth, horizonal))

print("you are at {},{}".format(depth,horizonal))
print("your multiple is {}".format(depth*horizonal))

#Part 2
depth = 0
horizonal = 0
aim = 0
for inst in instructions:
    if (inst[0] == 'down'):
        aim = aim - int(inst[1])
    elif (inst[0] == 'up'):
        aim = aim + int(inst[1])
    elif (inst[0] == 'forward'):
        horizonal = horizonal + int(inst[1])
        depth = depth - int(inst[1])*aim
    else:
        print("don't know how to process command {} with number {}".format(depth,horizonal))
print("you are at {},{} with aim {}".format(depth, horizonal, aim))
print("your multiple is {}".format(depth*horizonal))