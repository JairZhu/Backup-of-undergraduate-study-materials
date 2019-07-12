import numpy as np
import math
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

def train_matrix(train_data,pi,A,B):

    for line in train_data:
        word_list = line.split("  ")
        first_word = word_list[0]
        last_word_state = 3
        if(len(first_word) == 1):
            pi[3] += 1
            last_word_state = 3
        else:
            pi[0] += 1
            last_word_state = 2
        for i in range(1,len(word_list)):
            word = word_list[i].strip()
            length = len(word)
            if length == 0:
                continue
            elif length == 1:
                A[last_word_state][3] += 1
                B[3][ord(word)] += 1
                last_word_state = 3
            elif length == 2:
                A[last_word_state][0] += 1
                A[0][2] += 1
                B[0][ord(word[0])] += 1
                B[2][ord(word[1])] += 1
                last_word_state = 2
            else:
                A[last_word_state][0] += 1
                A[0][1] += 1
                A[1][2] += 1
                A[1][1] += length - 3
                B[0][ord(word[0])] += 1
                B[2][ord(word[length - 1])] += 1
                for j in range(1,length - 1):
                    B[1][ord(word[j])] += 1
                last_word_state = 2
    return pi,A,B
def log_matrix(pi,A,B):
    pi = pi / np.sum(pi)
    for i in range(A.shape[0]):
        A[i] = A[i] / np.sum(A[i])
    for i in range(B.shape[0]):
        B[i] = B[i] / np.sum(B[i])
    for i in range(0,4):
        if pi[i] == 0:
            pi[i] = pow(0.1,260)
    for i in range(0,4):
        for j in range(0,4):
            if A[i][j] == 0:
                A[i][j] = pow(0.1,260)
    for i in range(0,4):
        for j in range(0,65536):
            if B[i][j] == 0:
                B[i][j] = pow(0.1,260)
    pi = np.log10(pi)
    A = np.log10(A)
    B = np.log10(B)
    return pi,A,B

def predict(p_str,pi,A,B):
    data_matrix = np.zeros((4,len(p_str)))
    state_matrix = np.zeros((4,len(p_str)))
    for i in range(0,4):
        data_matrix[i][0] = pi[i] + B[i][ord(p_str[0])]
    for i in range(1,len(p_str)):
        for j in range(0,4):
            temp_A = data_matrix[0][i - 1] + A[0][j]
            temp_B = data_matrix[1][i - 1] + A[1][j]
            temp_C = data_matrix[2][i - 1] + A[2][j]
            temp_D = data_matrix[3][i - 1] + A[3][j]
            max_temp = max(max(temp_A,temp_B),max(temp_C,temp_D))
            data_matrix[j][i] = max_temp + B[j][ord(p_str[i])]
            if max_temp == temp_A:
                state_matrix[j][i] = 0
            elif max_temp == temp_B:
                state_matrix[j][i] = 1
            elif max_temp == temp_C:
                state_matrix[j][i] = 2
            elif max_temp == temp_D:
                state_matrix[j][i] = 3
    last_state = 0
    temp_A = data_matrix[0][len(p_str) - 1]
    temp_B = data_matrix[1][len(p_str) - 1]
    temp_C = data_matrix[2][len(p_str) - 1]
    temp_D = data_matrix[3][len(p_str) - 1]
    max_temp = max(max(temp_A, temp_B), max(temp_C, temp_D))
    if max_temp == temp_A:
        last_state = 0
    elif max_temp == temp_B:
        last_state = 1
    elif max_temp == temp_C:
        last_state = 2
    elif max_temp == temp_D:
        last_state = 3
    answer = str(last_state)
    for i in range(1,len(p_str)):
        temp = int(state_matrix[last_state][len(p_str) - i])
        answer += str(temp)
        last_state = temp

    answer = answer[::-1]
    answer_str = ""
    for i in range(0,len(p_str)):
    	answer_str += p_str[i]
    	if answer[i] == "2" or answer[i] == "3":
    		answer_str += "  "
    return answer_str

pi = np.zeros(4)
A = np.zeros((4, 4))
B = np.zeros((4, 65536))

with open("msr_training.utf8","r",encoding="utf-8") as obj:
	data = obj.readlines()
	pi,A,B= train_matrix(data,pi,A,B)
	
# with open("msr_training.utf8","r",encoding="utf-8") as obj:
# 	data = obj.readlines()
# 	pi,A,B = train_matrix(data,pi,A,B)

pi,A,B= log_matrix(pi,A,B)
test_sentences = []
with open("msr_test.utf8","r",encoding="utf-8") as test_obj:
	temp_sentences = test_obj.readlines()
	for sen in temp_sentences:
		test_sentences.append(predict(sen,pi,A,B))

# print(test_sentences[0])



with open("msr_test_gold.utf8","r",encoding="utf-8") as ans_obj:
	ans_sentences = ans_obj.readlines()

answer_list = []
range_list = [0.6,0.7,0.8,0.9,1]
for j in range(6,11):
    index = 0
    for i in range(0,len(test_sentences)):
    	temp1 = test_sentences[i].strip()
    	temp2 = ans_sentences[i].strip()
    	temp1_list = temp1.split("  ")
    	temp2_list = temp2.split('  ')
    	temp_index = 0
    	for word in temp1_list:
    		if word in temp2_list:
    			temp_index += 1
    	if temp_index / len(temp1_list) >= j / 10:
    		index += 1
    answer_list.append(index / len(test_sentences))
    print("句子准确率： " + str(j / 10),end=" ")
    print("数据集准确率： " + str(index / len(test_sentences)))

plt.bar(range_list,answer_list,0.1,color="blue")
for a,b in zip(range_list,answer_list):
    plt.text(a,b+0.05,'%.2f' % b, ha="center",fontsize= 11)
plt.xlim(0.4,1.2)
plt.ylim(0,1)
plt.show()