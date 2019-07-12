import matplotlib.pyplot as plot
import numpy as np

msr = {}
with open("data/training/msr_training_words.utf8", "r", encoding="utf-8") as file:
    for line in file.readlines():
        word = line.strip()
        msr[word] = 0

pku = {}
with open("data/training/pku_training_words.utf8", "r", encoding="utf-8") as file:
    for line in file.readlines():
        word = line.strip()
        pku[word] = 0

msrWordLength = [len(i) for i in msr.keys()]
pkuWordLength = [len(i) for i in pku.keys()]

plot.hist(msrWordLength, bins=20, density=True, range=[0, 20], alpha=0.3, label="msr_train_words", color="blue")
plot.hist(pkuWordLength, bins=20, density=True, range=[0, 20], alpha=0.3, label="pku_train_words", color="green")
plot.xticks(np.arange(0, 21, 1))
plot.xlabel("word length")
plot.ylabel("frequency")
plot.legend()
plot.show()