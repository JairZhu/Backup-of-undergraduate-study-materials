wordDict = {}
maxLength = 0
with open("data/training/msr_training_words.utf8", "r", encoding="utf-8") as file:
    for line in file.readlines():
        word = line.strip()
        maxLength = len(word) if len(word) > maxLength else maxLength
        wordDict[word] = 0

with open("data/training/pku_training_words.utf8", "r", encoding="utf-8") as file:
    for line in file.readlines():
        word = line.strip()
        maxLength = len(word) if len(word) > maxLength else maxLength
        wordDict[word] = 0

msrTestSet = []
with open("data/testing/msr_test.utf8", "r", encoding="utf-8") as file:
    for line in file.readlines():
        msrTestSet.append(line.strip())

with open("data/testing/pku_test.utf8", "r", encoding="utf-8") as file:
    for line in file.readlines():
        msrTestSet.append(line.strip())

msrGoldSet = []
with open("data/gold/msr_test_gold.utf8", "r", encoding="utf-8") as file:
    for line in file.readlines():
        msrGoldSet.append(line.split())

with open("data/gold/pku_test_gold.utf8", "r", encoding="utf-8") as file:
    for line in file.readlines():
        msrGoldSet.append(line.split())

msrOutput = []
for line in msrTestSet:
    line = line.strip()
    end = len(line)
    result = []
    while(end != 0):
        index = end - maxLength if end - maxLength > 0 else 0
        while(line[index:end] not in wordDict and end - index > 1):
            index += 1
        if (line[index:end] in wordDict):
            result.append(line[index:end])
        else:
            result.append(line[index])
        end = index
    result.reverse()
    msrOutput.append(result)

forewordOutput = []
for line in msrTestSet:
    line = line.strip()
    start = 0
    result = []
    while (start != len(line)):
        index = start + maxLength if start + maxLength < len(line) else len(line)
        while (line[start:index] not in wordDict and index - start > 1):
            index -= 1
        if (line[start:index] in wordDict):
            result.append(line[start:index])
        else:
            result.append(line[start])
        start = index
    forewordOutput.append(result)

for i in range(len(forewordOutput)):
    if len(forewordOutput[i]) < len(msrOutput[i]):
        msrOutput[i] = forewordOutput[i]

def rate(num):
    msrRight = 0
    for i in range(len(msrOutput)):
        count = 0
        for word in msrGoldSet[i]:
            if word in msrOutput[i]:
                count += 1
        if len(msrGoldSet[i]) == 0 or count / len(msrGoldSet[i]) >= num:
            msrRight += 1
    print("以" + str(num) + "为阈值的正确率：", msrRight / len(msrOutput))

rate(0.6)
rate(0.7)
rate(0.8)
rate(0.9)
rate(1)
