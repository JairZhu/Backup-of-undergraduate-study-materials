import matplotlib.pyplot as plt

Iter = []
D_loss = []
G_loss = []
data = []
with open('out.txt', 'r') as file:
    for row in file.readlines():
        row = row.strip('\n').split(' ')
        data.append(row)

for line in data:
    if line[0] == 'Iter:':
        Iter.append(int(line[1]))
    elif line[0] == 'D_loss:':
        D_loss.append(float(line[1]))
    elif line[0] == 'G_loss:':
        G_loss.append(float(line[1]))

plt.plot(Iter, G_loss, label='G_loss')
plt.plot(Iter, D_loss, label='D_loss')
plt.legend()
plt.show()