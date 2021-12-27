#read input
with open('day3input.txt') as f:
    lines = f.readlines()
    binaries = [i for i in lines]

bins = {}
for num in binaries:
    for i in range(0,len(num)-1):
        binNum = num[i]
        if not i in bins.keys():
            bins[i]={'0':0,'1':0}
        bins[i][binNum]=bins[i][binNum]+1
#generate gamma and epsilon
gama = ''
epsilon = ''
for num in bins.keys():
    zero=bins[num]['0']
    one=bins[num]['1']
    if zero > one:
        gama+='0'
        epsilon+='1'
        bins[num]['popular'] = '0'
    else:
        gama+='1'
        epsilon+='0'
        bins[num]['popular'] = '1'
print("gama is {}, epsilon is {}".format(int(gama,2),int(epsilon,2)))
#generate power consumption
print("power consumption is {}".format(int(gama,2)*int(epsilon,2)))

#part 2
import re

def select(selectedBins, index, prefix, selector, default):
    # return if num = 1
    if len(selectedBins) < 2:
        return [int(x.strip(),2) for x in selectedBins]
    
    # build new binMap
    binMap = {}
    for num in selectedBins:
        for i in range(0,len(num)-1):
            binNum = num[i]
            if not i in binMap.keys():
                binMap[i]={'0':0,'1':0}
            binMap[i][binNum]=binMap[i][binNum]+1
    
    # set prefix[index] based on majority
    zero=binMap[index]['0']
    one=binMap[index]['1']
    number = default
    if zero > one:
        if selector == 'x':
            number=0
        else:
            number=1
    prefix+=str(number)
    matches = [x for x in selectedBins if re.match(prefix+'.*',x)]
    #print('matches:{}'.format(str(matches)))
    # further select
    return select(matches, index+1, prefix, selector, default)

co2=select(binaries, 0, '', '2', 0)
ox=select(binaries, 0, '', 'x', 1)
print("life support rating is {}".format(ox[0]*co2[0]))