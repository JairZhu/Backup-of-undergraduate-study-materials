#include <gl\freeglut.h>

int Revolution = 0, Rotation = 0;

void Display_planet() {
	glClear(GL_COLOR_BUFFER_BIT);
	glColor3f(1.0, 1.0, 1.0);
	glPushMatrix();
	glutWireSphere(1.5f, 30.0f, 20.0f);
	glRotatef(Revolution, 0.0f, 1.0f, 0.0f);
	glTranslatef(2.0f, 0.0f, 0.0f);
	glRotatef(Rotation, 0.0f, 1.0f, 0.0f);
	glutWireSphere(0.3f, 16.0f, 10.0f);
	glPopMatrix();
	glutSwapBuffers();
	glFlush();
}

void Reshape(int width, int height) {
	glViewport(0, 0, width, height);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluPerspective(60.0f, width / height, 1.0f, 20.0f);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	gluLookAt(0.0, 0.0, 5.0,
		0.0, 0.0, 0.0,
		0.0, 1.0, 0.0);
}

void Keyboard(unsigned char key, int x, int y) {
	if (key == 'd') {
		Rotation = (Rotation + 10) % 360;
		glutPostRedisplay();
	}
	else if (key == 'D') {
		Rotation = (Rotation - 10) % 360;
		glutPostRedisplay();
	}
	else if (key == 'y') {
		Revolution = (Revolution + 5) % 360;
		glutPostRedisplay();
	}
	else if (key == 'Y') {
		Revolution = (Revolution - 5) % 360;
		glutPostRedisplay();
	}
}

int main(int argc, char * argv[]) {
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
	glutInitWindowSize(700, 700);
	glutInitWindowPosition(100, 100);
	glutCreateWindow("Homework 3");
	glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
	glShadeModel(GL_FLAT);
	glutDisplayFunc(Display_planet);
	glutReshapeFunc(Reshape);
	glutKeyboardFunc(Keyboard);
	glutMainLoop();
	return 0;
}