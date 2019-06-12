#ifndef _PCB_
#define _PCB_

#define MAX_PCB_NUMBER 8

extern void print();
extern void stackCopy();
extern void PCB_Restore();

typedef enum PCB_STATUS{PCB_NEW, PCB_READY, PCB_EXIT, PCB_RUNNING, PCB_BLOCKED} PCB_STATUS;

typedef struct Register{
	int ss;
	int gs;
	int fs;
	int es;
	int ds;
	int di;
	int si;
	int sp;
	int bp;
	int bx;
	int dx;
	int cx;
	int ax;
	int ip;
	int cs;
	int flags;
} Register;

typedef struct PCB{
	Register regs;
	PCB_STATUS status;
	int ID;
	int FID;
} PCB;

PCB PCB_LIST[MAX_PCB_NUMBER];

PCB *current_process_PCB_ptr, *t_PCB, *sub_PCB;

int first_time;
int kernal_mode = 1;
int process_number = 1;
int current_seg = 0x2000;
int current_process_number = 0;

int sub_ss, f_ss, stack_size;

PCB *get_current_process_PCB() {
	return &PCB_LIST[current_process_number];
}

void save_PCB(int ax, int bx, int cx, int dx, int sp, int bp, int si, int di, int ds, int es, int fs, int gs, int ss, int ip, int cs, int flags) {
	current_process_PCB_ptr = get_current_process_PCB();
	
	current_process_PCB_ptr->regs.ss = ss;
	current_process_PCB_ptr->regs.gs = gs;
	current_process_PCB_ptr->regs.fs = fs;
	current_process_PCB_ptr->regs.es = es;
	current_process_PCB_ptr->regs.ds = ds;
	current_process_PCB_ptr->regs.di = di;
	current_process_PCB_ptr->regs.si = si;
	current_process_PCB_ptr->regs.sp = sp;
	current_process_PCB_ptr->regs.bp = bp;
	current_process_PCB_ptr->regs.bx = bx;
	current_process_PCB_ptr->regs.dx = dx;
	current_process_PCB_ptr->regs.cx = cx;
	current_process_PCB_ptr->regs.ax = ax;
	current_process_PCB_ptr->regs.ip = ip;
	current_process_PCB_ptr->regs.cs = cs;
	current_process_PCB_ptr->regs.flags = flags;
}

void schedule() {
	int i, flag = 1;
	if (current_process_PCB_ptr->status == PCB_RUNNING)
		current_process_PCB_ptr->status = PCB_READY;
	for (i = 1; i < process_number; ++i) {
		if (PCB_LIST[i].status != PCB_BLOCKED && PCB_LIST[i].status != PCB_EXIT) {
			flag = 0;
			break;
		} 
	}
	if (flag) {
		current_process_number = 0;
		current_process_PCB_ptr = get_current_process_PCB();
		current_process_PCB_ptr->status = PCB_RUNNING;
		kernal_mode = 1;
		return;
	}
	do {
		current_process_number++;
		if (current_process_number >= process_number)
			current_process_number = 1;
	} while (PCB_LIST[current_process_number].status == PCB_BLOCKED || PCB_LIST[current_process_number].status == PCB_EXIT);
	current_process_PCB_ptr = get_current_process_PCB();
	if (current_process_PCB_ptr->status == PCB_NEW)
		first_time = 1;
	current_process_PCB_ptr->status = PCB_RUNNING;
	return;
}

void PCB_initial(PCB *ptr, int process_ID, int seg) {
	ptr->ID = process_ID;
	ptr->FID = 0;
	ptr->status = PCB_NEW;
	ptr->regs.gs = 0x0B800;
	ptr->regs.es = seg;
	ptr->regs.ds = seg;
	ptr->regs.fs = seg;
	ptr->regs.ss = seg;
	ptr->regs.cs = seg;
	ptr->regs.di = 0;
	ptr->regs.si = 0;
	ptr->regs.bp = 0;
	ptr->regs.sp = 0x0100 - 4;
	ptr->regs.bx = 0;
	ptr->regs.ax = 0;
	ptr->regs.cx = 0;
	ptr->regs.dx = 0;
	ptr->regs.ip = 0x0100;
	ptr->regs.flags = 512;
}

void create_new_PCB() {
	if (process_number > MAX_PCB_NUMBER) return;
	PCB_initial(&PCB_LIST[process_number], process_number, current_seg);
	process_number++;
	current_seg += 0x1000;
}

int do_fork() {
	int sub_ID;
	print("kernal: forking\r\n");
	sub_ID = createSubPCB();
	if (sub_ID == -1) {
		current_process_PCB_ptr->regs.ax = -1;
		return -1;
	}
	sub_PCB = &PCB_LIST[sub_ID];
	current_process_PCB_ptr->regs.ax = sub_ID;
	sub_ss = sub_PCB->regs.ss;
	f_ss = current_process_PCB_ptr->regs.ss;
	stack_size = 0x100;
	stackCopy();
	PCB_Restore();
}

int createSubPCB() {
	if (process_number > MAX_PCB_NUMBER) return -1;
	t_PCB = &PCB_LIST[process_number];
	t_PCB->ID = process_number;
	t_PCB->status = PCB_READY;
	t_PCB->FID = current_process_number;
	t_PCB->regs.gs = 0xb800;
	t_PCB->regs.es = current_process_PCB_ptr->regs.es;
	t_PCB->regs.ds = current_process_PCB_ptr->regs.ds;
	t_PCB->regs.fs = current_process_PCB_ptr->regs.fs;
	t_PCB->regs.ss = current_seg;
	t_PCB->regs.di = current_process_PCB_ptr->regs.di;
	t_PCB->regs.si = current_process_PCB_ptr->regs.si;
	t_PCB->regs.bp = current_process_PCB_ptr->regs.bp;
	t_PCB->regs.sp = current_process_PCB_ptr->regs.sp;
	t_PCB->regs.ax = 0;
	t_PCB->regs.bx = current_process_PCB_ptr->regs.bx;
	t_PCB->regs.cx = current_process_PCB_ptr->regs.cx;
	t_PCB->regs.dx = current_process_PCB_ptr->regs.dx;
	t_PCB->regs.ip = current_process_PCB_ptr->regs.ip;
	t_PCB->regs.cs = current_process_PCB_ptr->regs.cs;
	t_PCB->regs.flags = current_process_PCB_ptr->regs.flags;
	process_number++;
	current_seg += 0x1000;
	print("kernal: sub process created!\r\n");
	return process_number - 1;
}

void do_wait() {
	print("kernal: waiting...\r\n");
	blocked();
}

void blocked() {
	current_process_PCB_ptr->status = PCB_BLOCKED;
	schedule();
	PCB_Restore();
}

void do_exit(int ss) {
	print("kernal: exiting\r\n");
	PCB_LIST[current_process_number].status = PCB_EXIT;
	PCB_LIST[current_process_PCB_ptr->FID].status = PCB_READY;
	PCB_LIST[current_process_PCB_ptr->FID].regs.ax = ss;
	current_seg -= 0x1000;
	process_number--;
	wakeup();
}

void wakeup() {
	if (process_number == 1) 
		kernal_mode = 1;
	schedule();
	PCB_Restore();
}

void initial_PCB_settings() {
	process_number = 1;
	current_process_number = 0;
	current_seg = 0x2000;
}

#endif