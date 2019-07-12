import numpy as np


grid = np.array([(1,1,1,2), (1,0,1,-1), (1,1,1,1)])


gama = 0.9
direction = [(-1, 0), (0, -1), (0, 1)]
positive = [0.8, 0.1, 0.1]

start = (2, 0)

def value_iteration():
    values = np.zeros((3, 4))
    actions = np.zeros((3, 4))
    while True:
        count = 0
        for i in range(3):
            for j in range(4):
                new_values = []
                if grid[i][j] == 1:
                    for k in range(3):
                        new_value = 0
                        x, y = i + direction[k][0], j + direction[k][1]
                        if x < 0 or y < 0 or y >= 4 or grid[x][y] == 0:
                            new_value += -0.03 + gama * values[i][j]
                        elif grid[x][y] == 2:
                            new_value += 1 + gama * values[x][y]
                        elif grid[x][y] == -1:
                            new_value += -1 + gama * values[x][y]
                        else:
                            new_value += -0.03 + gama * values[x][y]
                        new_values.append(new_value)
                    max_value = max(new_values)
                    if max_value == values[i][j]:
                        count += 1
                    values[i][j] = max_value
                    actions[i][j] = new_values.index(max_value) + 1
        if count == 9:
            break

        for i in range(3):
            for j in range(4):
                print(values[i][j], end=' ')
            print()
        print()
    for i in range(3):
        for j in range(4):
            if actions[i][j] == 1:
                print('上', end=' ')
            elif actions[i][j] == 2:
                print('左', end=' ')
            elif actions[i][j] == 3:
                print('右', end=' ')
            else:
                print('  ', end=' ')
        print()

def policy_iteration():
    values = np.zeros((3, 4))
    actions = np.zeros((3, 4))
    while True:
        while True:
            count = 0
            for i in range(3):
                for j in range(4):
                    new_value = 0
                    if grid[i][j] == 1:
                        x, y = i + direction[int(actions[i][j])][0], j + direction[int(actions[i][j])][1]
                        if x < 0 or y < 0 or y >= 4 or grid[x][y] == 0:
                            new_value += -0.03 + gama * values[i][j]
                        elif grid[x][y] == 2:
                            new_value += 1 + gama * values[x][y]
                        elif grid[x][y] == -1:
                            new_value += -1 + gama * values[x][y]
                        else:
                            new_value += -0.03 + gama * values[x][y]
                        if new_value == values[i][j]:
                            count += 1
                        values[i][j] = new_value
            if count == 9:
                break
        ccount = 0
        for i in range(3):
            for j in range(4):
                if grid[i][j] == 1:
                    new_values = []
                    for k in range(3):
                        new_value = 0
                        x, y = i + direction[k][0], j + direction[k][1]
                        if x < 0 or y < 0 or y >= 4 or grid[x][y] == 0:
                            new_value += -0.03 + gama * values[i][j]
                        elif grid[x][y] == 2:
                            new_value += 1 + gama * values[x][y]
                        elif grid[x][y] == -1:
                            new_value += -1 + gama * values[x][y]
                        else:
                            new_value += -0.03 + gama * values[x][y]
                        new_values.append(new_value)
                    new_action = new_values.index(max(new_values))
                    if new_action == actions[i][j]:
                        ccount += 1
                    actions[i][j] = new_action
        if ccount == 9:
            break

        for i in range(3):
            for j in range(4):
                print(values[i][j], end=' ')
            print()
        print()

    for i in range(3):
        for j in range(4):
            if grid[i][j] == 1:
                if actions[i][j] == 0:
                    print('上', end=' ')
                elif actions[i][j] == 1:
                    print('左', end=' ')
                elif actions[i][j] == 2:
                    print('右', end=' ')
            else:
                print('  ', end=' ')
        print()


if __name__ == "__main__":
    print("值迭代：")
    value_iteration()
    print("\n\n策略迭代：")
    policy_iteration()