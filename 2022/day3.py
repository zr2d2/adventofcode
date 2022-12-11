with open('day3input.txt') as f:
    bags = f.readlines()

value = 0
for bag in bags:
    compartment1 = bag[:len(bag)//2]
    compartment2 = bag[len(bag)//2:]
    common = set(compartment1).intersection(compartment2)
    for r in common:
        if r.islower():
            value += ord(r)-96
        else:
            value += ord(r)-38
        print("comonalities are {} with a value of {}".format(r, value))
print("total value of comonalities is {}".format(value))