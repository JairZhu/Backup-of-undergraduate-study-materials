//lfsr.cpp
//Update: 2001.10.1
#include "lfsr.h"

unsigned long lfsr(unsigned long ShiftRegister, 
				   unsigned long n)
{
	unsigned long temp;
	_asm
	{
			MOV EAX,ShiftRegister
			MOV ECX,n
			SHL ECX,5
			XOR EDX,EDX
	Again:	MOV EBX,EDX
			BT EAX,31
			ADC EBX,EDX
			BT EAX,6
			ADC EBX,EDX
			BT EAX,4
			ADC EBX,EDX
			BT EAX,2
			ADC EBX,EDX
			BT EAX,1
			ADC EBX,EAX
			INC EBX
			SHR EBX,1
			RCR EAX,1
			LOOP Again
			MOV temp,EAX
	}
	return temp;
}