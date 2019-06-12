////////////////////////////////////////////////////////////////////
// 
// FileName : Complex.cpp
// Creator  : 09388282wangda
// Date     : 2010.04.09
// Comment  : the implements for class Complex
//
////////////////////////////////////////////////////////////////////
#include "main.h"

double tempReal,tempImaginary;
Complex::Complex(){
	realPart = 1;
	imaginaryPart = 1;
}

void Complex::setData(){
	double tempReal,tempImaginary;
	cout << "若跳过输入则实部与虚部默均认为1\n";
	cout << "请分别输入实部与虚部，用空格空开: ";
	cin >> tempReal >> tempImaginary;
	realPart = tempReal;
	imaginaryPart = tempImaginary;
	cout << endl;
}

void Complex::printData(){
	cout << "( " << realPart << " , " << imaginaryPart << " )";
}

double Complex::getImaginary(){
	return imaginaryPart;
}

double Complex::getReal(){
	return realPart;
}

void Complex::setReal(double temp){
	realPart = temp;
}

void Complex::setImaginary(double temp){
	imaginaryPart = temp;
}

void Complex::Addition(Complex y){
	extern double tempReal,tempImaginary;
	tempReal = realPart + y.getReal();
	tempImaginary = imaginaryPart + y.getImaginary();
	
}

void Complex::Subtraction(Complex y){
	extern double tempReal,tempImaginary;
	tempReal = realPart - y.getReal();
	tempImaginary = imaginaryPart - y.getImaginary();
}

void Complex::Multiplication(Complex y){
	extern double tempReal,tempImaginary;
	tempReal = realPart*(y.getReal()) - imaginaryPart*(y.getImaginary());
	tempImaginary = imaginaryPart*(y.getReal()) + realPart*(y.getImaginary());
}
