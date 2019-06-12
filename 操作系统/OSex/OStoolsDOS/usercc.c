#include "sys_call.h"
#include "sync.h"

char *msg1 = "error in fork!";
char *msg2 = "bankbalance = ";
char *msg3 = "totalsave = ";
char *msg4 = "totaldraw = ";
char string[6];
void ntos(int a){
	int x = 0;
	string[0] = '0';
	int temp;
	while(a != 0){
		temp = a % 10;
		string[x] = temp + '0';
		a = a /10;
		x ++;
	}
	for(int i = x - 1; i >= 0; i --){
		printc(string[i]);
	}
	printc('\n');
	printc('\r');
}

void sleep(int i){
	int x1 = i * 1000;
	int x2 = i * 1000;
	while(x1 != 0){
		x1 --;
		while(x2 != 0){
			x2 --;
		}
		x2 = i * 1000;
	}
}

int bankbalance = 10000;/*银行帐户余额1000元*/
int totalsave = 0, totaldraw = 0;
int temp1 = 100;
int temp2 = 50;

int main() {
   	int pid, sem_id;
   	
    sem_id = SemGet(1);
   	pid = fork();
   	if(pid == -1){
   		printf(msg1);
   		exit();
   	}
   	if(pid == 1){
   		
        
        while(temp1 > 0){
        	temp1 --;
            p(sem_id, pid);
            //sleep(5);
            bankbalance += 10; 
            totalsave += 10;
            printf(msg2);
            ntos(bankbalance);
            printf(msg3);
            ntos(totalsave);
            //sleep(5);
            v(sem_id);
        }
        SemFree(sem_id);
        exit();
	} 
	else{
		
        while(temp2 > 0){
        	temp2 --;
            p(sem_id, pid);
            //sleep(5);
            bankbalance -= 20; 
            totaldraw += 20;
            printf(msg2);
            ntos(bankbalance);
            printf(msg4);
            ntos(totaldraw);
            //sleep(5);
            v(sem_id);
        }
   		exit();
	}
}