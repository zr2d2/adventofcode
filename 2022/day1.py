with open('day1input.txt') as f:
    supplies = f.readlines()

food = {}
most = 0
sum  = 0
elf = 0

for entry in supplies:
  if entry == "\n":
    food[elf] = sum 
    if sum > most:
      most = sum
    sum = 0
    elf+= 1
  else:
    callories = int(entry)
    #print(callories)
    sum+= callories
#print(food)
print("the most food is {}".format(most))