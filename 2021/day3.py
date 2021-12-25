#read input
with open('day3input.txt') as f:
    lines = f.readlines()
    binaries = [i for i in lines]

bins = {}
#generate gamma and epsilon
#generate power consumption
for num in binaries:
    for i in range(0,len(num)-1):
        binNum = num[i]
        if not i in bins.keys():
            bins[i]={'0':0,'1':0}
        bins[i][binNum]=bins[i][binNum]+1
gama = ''
epsilon = ''
for num in bins.keys():
    zero=bins[num]['0']
    one=bins[num]['1']
    if zero > one:
        gama+='0'
        epsilon+='1'
    else:
        gama+='1'
        epsilon+='0'
print("gama is {}, epsilon is {}".format(int(gama,2),int(epsilon,2)))
print("power consumption is {}".format(int(gama,2)*int(epsilon,2)))