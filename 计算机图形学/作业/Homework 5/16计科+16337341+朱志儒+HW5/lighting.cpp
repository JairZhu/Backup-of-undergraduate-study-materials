#include <GL\glut.h>
using namespace std;

void initial() {
	GLfloat lightmodelambient[] = { 0.2, 0.2, 0.2, 1.0 };
	GLfloat position[] = { 1, 1, 1, 0 };
	GLfloat specular[] = { 1, 1, 1, 1 };
	GLfloat shininess[] = { 50 };
	GLfloat light[] = { 1, 1, 1, 1 };
	glClearColor(0, 0, 0, 0);
	glShadeModel(GL_SMOOTH);
	glMaterialfv(GL_FRONT, GL_SHININESS, shininess);
	glMaterialfv(GL_FRONT, GL_SPECULAR, specular);
	glLightfv(GL_LIGHT0, GL_SPECULAR, light);
	glLightfv(GL_LIGHT0, GL_POSITION, position);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, light);
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT, lightmodelambient);
	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);
	glEnable(GL_DEPTH_TEST);
}

void display() {
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glutSolidTeapot(0.5);
	glFlush();
}

void reshape(int width, int height) {
	glViewport(0, 0, width, height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	if (width > height)
		glOrtho(-1.5*(GLfloat)width / (GLfloat)height, 1.5*(GLfloat)width / (GLfloat)height, -1.5, 1.5, -10.0, 10.0);
	else 
		glOrtho(-1.5, 1.5, -1.5*(GLfloat)height / (GLfloat)width, 1.5*(GLfloat)height / (GLfloat)width, -10.0, 10.0);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}

int main(int argc, char ** argv) {
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(800, 800);
	glutInitWindowPosition(200, 200);
	glutCreateWindow("Teapot");
	initial();
	glutDisplayFunc(display);
	glutReshapeFunc(reshape);
	glutMainLoop();
	return 0;
}