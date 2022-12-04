with open('day1input.txt') as f:
    supplies = f.readlines()

food = []
most = 0
sum  = 0
elf = 0

for entry in supplies:
  if entry == "\n":
    food.append(sum)
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
food.sort(reverse=True)
sum = food[0] + food[1] + food[2]
print("the top 3 elves are carying {} calories".format(sum))