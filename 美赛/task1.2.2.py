import csv

states = ['VA', 'OH', 'KY', 'PA', 'WV']
VA = ['CHESAPEAKE CITY', 'ARLINGTON']
OH = ['CUYAHOGA', 'FRANKLIN']
KY = ['BELL']
PA = ['ALLEGHENY', 'BUCKS']
WV = ['BERKELEY']


csvfile = open(states[0] + ".csv", "r")
reader = csv.reader(csvfile)
data = []
for line in reader:
    item = [int(line[0]) - 2009, line[2]]
    if line[1] == VA[0] and item not in data:
        data.append(item)
with open('CHESAPEAKE_CITY.csv', 'w', newline='') as outfile:
    writer = csv.writer(outfile)
    writer.writerows(data)