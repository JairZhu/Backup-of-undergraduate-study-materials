#include <math.h>
#include <GL\glut.h>
#include <GL\GL.h>
#include <vector>
using namespace std;

vector<pair<GLfloat, GLfloat>> points;

void drawLine() {
	glColor3f(1.0f, 1.0f, 1.0f);
	glPointSize(1.0);
	for (int i = 0; i <= 2; i++) {
		glBegin(GL_LINES);
		glVertex2f(points[i].first, points[i].second);
		glVertex2f(points[i + 1].first, points[i + 1].second);
		glEnd();
	}
}

void drawCurve() {
	glColor3f(0, 1.0f, 0);
	glPointSize(1.0);
	for (GLfloat t = 0; t <= 1.0; t += 0.001) {
		GLfloat x = points[0].first*pow(1.0f - t, 3) + 3 * points[1].first*t*pow(1.0f - t, 2) + 3 * points[2].first*t*t*(1.0f - t) + points[3].first*pow(t, 3);
		GLfloat y = points[0].second*pow(1.0f - t, 3) + 3 * points[1].second*t*pow(1.0f - t, 2) + 3 * points[2].second*t*t*(1.0f - t) + points[3].second*pow(t, 3);
		glBegin(GL_POINTS);
		glVertex2f(x, y);
		glEnd();
	}
}

void Init() {
	glClearColor(0, 0, 0, 0);
	glColor3f(0, 1.0f, 0);
	glPointSize(5.0);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	gluOrtho2D(0.0, 500, 0.0, 500);
}

void Display() {
	glClear(GL_COLOR_BUFFER_BIT);
	if (points.size() < 4) {
		for (int i = 0; i < points.size(); ++i) {
			glBegin(GL_POINTS);
			glVertex2i(points[i].first, points[i].second);
			glEnd();
		}
	}
	if (points.size() == 4) {
		drawLine();
		drawCurve();
	}
	glFlush();
}

void Mouse(int button, int state, int x, int y) {
	if (state == GLUT_DOWN) {
		if (points.size() < 4) {
			points.push_back(make_pair(GLfloat(x), GLfloat(500 - y)));
		}
		else if (points.size() == 4) {
			while (!points.empty()) {
				points.pop_back();
			}
			points.push_back(make_pair(GLfloat(x), GLfloat(500 - y)));
		}
	}
}

int main(int argc, char ** argv) {
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_RGB);
	glutInitWindowPosition(0, 0);
	glutInitWindowSize(500, 500);
	glutCreateWindow("Bezier Curve");

	Init();
	glutDisplayFunc(Display);
	glutMouseFunc(Mouse);
	glutMainLoop();
	return 0;
}