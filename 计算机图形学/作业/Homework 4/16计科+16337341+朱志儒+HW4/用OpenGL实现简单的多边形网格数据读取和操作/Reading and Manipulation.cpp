#include <OpenMesh\Core\IO\MeshIO.hh>
#include <OpenMesh\Core\Mesh\TriMesh_ArrayKernelT.hh>
#include <iostream>
#include <GL\glut.h>
#include <string>
using namespace std;

typedef OpenMesh::TriMesh_ArrayKernelT<> Mesh;

int mouse_state = 0;
GLfloat ox = 0;
GLfloat oy = 0;
float xr = 0;
float yr = 0;
float ty = 0;
float scale = 1;

Mesh mesh;
const string file1 = "cow.obj";
const string file2 = "cactus.ply";
const string file3 = "Armadillo.off";
int current_file = 1;

GLuint show_face_list, show_wire_list;
int show_state = 1;
bool show_face = true;
bool show_wire = true;
bool show_flat_lines = false;

void initial_GL() {
	glClearColor(0, 0, 0, 0);
	glClearDepth(2);
	glShadeModel(GL_SMOOTH);
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);
	show_face_list = glGenLists(1);
	show_wire_list = glGenLists(1);
	int tmp = mesh.n_edges();

	glNewList(show_wire_list, GL_COMPILE);
	glDisable(GL_LIGHTING);
	glLineWidth(1);
	glColor3f(0.5, 0.5, 0.5f);
	glBegin(GL_LINES);
	for (Mesh::HalfedgeIter it = mesh.halfedges_begin(); it != mesh.halfedges_end(); ++it) {
		glVertex3fv(mesh.point(mesh.from_vertex_handle(*it)).data());
		glVertex3fv(mesh.point(mesh.to_vertex_handle(*it)).data());
	}
	glEnd();
	glEnable(GL_LIGHTING);
	glEndList();

	glNewList(show_face_list, GL_COMPILE);
	for (Mesh::FaceIter it = mesh.faces_begin(); it != mesh.faces_end(); ++it) {
		glBegin(GL_TRIANGLES);
		for (Mesh::FaceVertexIter fvit = mesh.fv_iter(*it); fvit.is_valid(); ++fvit) {
			glNormal3fv(mesh.normal(*fvit).data());
			glVertex3fv(mesh.point(*fvit).data());
		}
		glEnd();
	}
	glEndList();
}

void read_file(string file) {
	mesh.request_vertex_normals();
	OpenMesh::IO::Options options;
	if (OpenMesh::IO::read_mesh(mesh, file, options)) {
		cout << "读取文件：" << file << endl << endl;
	}
	if (!options.check(OpenMesh::IO::Options::VertexNormal)) {
		mesh.request_face_normals();
		mesh.update_normals();
		mesh.release_face_normals();
	}
}

void reshape(GLint w, GLint h) {
	glViewport(0, 0, GLsizei(w), GLsizei(h));
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	if (w > h)
		glOrtho(-GLdouble(w) / h, GLdouble(w) / h, -1, 1, -100, 100);
	else
		glOrtho(-1, 1, -GLdouble(h) / w, GLdouble(h) / w, -100, 100);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}

void display() {
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();
	glRotatef(xr, 1, 0, 0);
	glRotatef(yr, 0, 1, 0);
	glTranslatef(0, 0, ty);
	glScalef(scale, scale, scale);
	if (show_face)
		glCallList(show_face_list);
	if (show_flat_lines) {
		glCallList(show_face_list);
		glCallList(show_wire_list);
	}
	if (show_wire)
		glCallList(show_wire_list);
	glutSwapBuffers();
}

void special(int key, int x, int y) {
	if (key == GLUT_KEY_F1) {
		read_file(file1);
		scale = 1;
		current_file = 1;
		initial_GL();
	}
	if (key == GLUT_KEY_F2) {
		read_file(file2);
		scale = 1.2;
		current_file = 2;
		initial_GL();
	}
	if (key == GLUT_KEY_F3) {
		read_file(file3);
		scale = 0.01;
		current_file = 3;
		initial_GL();
	}
	if (key == GLUT_KEY_F4) {
		if (show_face) {
			show_face = false;
			show_wire = true;
			cout << "切换显示模式为：WireFrame" << endl;
		}
		else if (show_wire) {
			show_wire = false;
			show_flat_lines = true;
			cout << "切换显示模式为：Flatlines" << endl;
		}
		else if (show_flat_lines) {
			show_flat_lines = false;
			show_face = true;
			cout << "切换显示模式为：Flat" << endl;
		}
	}
	if (key == GLUT_KEY_UP)
		ty += 0.01;
	if (key == GLUT_KEY_DOWN)
		ty -= 0.01;
	glutPostRedisplay();
}

void mouse_move(int x, int y) {
	if (mouse_state) {
		yr += x - ox;
		glutPostRedisplay();
		ox = x;
		xr += y - oy;
		glutPostRedisplay();
		oy = y;
	}
}

void mouse(int button, int state, int x, int y) {
	if (button == GLUT_LEFT_BUTTON && state == GLUT_DOWN) {
		mouse_state = 1;
		ox = x;
		oy = y;
	}
	if (button == GLUT_LEFT_BUTTON && state == GLUT_UP)
		mouse_state = 0;
	if (state == GLUT_UP && button == 3) {
		if (current_file == 3)
			scale -= 0.002;
		else
			scale -= 0.1;
	}
	if (state == GLUT_UP && button == 4) {
		if (current_file == 3)
			scale += 0.002;
		else
			scale += 0.1;
	}
	glutPostRedisplay();
}

int main(int argc, char **argv) {
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);
	glutInitWindowPosition(100, 100);
	glutInitWindowSize(800, 500);
	glutCreateWindow("Reading and Manipulation");
	read_file(file1);
	initial_GL();
	glutMouseFunc(mouse);
	glutMotionFunc(mouse_move);
	glutSpecialFunc(&special);
	glutReshapeFunc(&reshape);
	glutDisplayFunc(&display);
	glutMainLoop();
	return 0;
}