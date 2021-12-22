import pprint

depths = []
slices = []

def chunks(lst, n):
    sums = []
    for i in range(0, len(lst)-n+1):
        j=i+n
        s = sum(lst[i:j])
        sums.append(s)
    return sums

with open('day1input.txt') as f:
    lines =f.readlines()
    depths = [int(i.strip()) for i in lines]

depths = list(chunks(depths, 3))

inc = 0
lastDepth = 0
for depth in depths:
    if depth > lastDepth:
        inc +=1
    lastDepth = int(depth)
inc = inc - 1

print("there were {} increases".format(inc))