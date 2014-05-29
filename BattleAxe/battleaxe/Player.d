module battleaxe.Player;

import std.stdio;
import core.stdc.stdlib;
import Headers.Horde3D;
import Headers.Horde3DUtils;
import derelict.glfw3.glfw3;
import derelict.opengl3.gl3;
import derelict.opengl3.gl;

class Player
{
	GLFWwindow *window;
	int width, height;
	float posX, posY, ratio, actualSpeed;
	float speed = 66f;
	this(GLFWwindow *window, int width, int height, float posX, float posY, float ratio)
	{
		this.window = window;
		this.width = width;
		this.height = height;
		this.posX = posX;
		this.posY = posY;
		this.ratio = ratio;

		this.actualSpeed = 1/speed;
	}

	public void handleMovement(){
		if(glfwGetKey(window, GLFW_KEY_W)){
			posY += actualSpeed;
		}
		if(glfwGetKey(window, GLFW_KEY_S)){
			posY -= actualSpeed;
		}
		if(glfwGetKey(window, GLFW_KEY_A)){
			posX -= actualSpeed;
		}
		if(glfwGetKey(window, GLFW_KEY_D)){
			posX += actualSpeed;
		}
	}

	public void renderPlayer(){

		glMatrixMode(GL_PROJECTION);
		glLoadIdentity();
		glOrtho(-ratio, ratio, -1.0f, 1.0f, 1.0f, -1.0f);
		glMatrixMode(GL_MODELVIEW);
		glLoadIdentity();
		//glRotatef(cast(float)glfwGetTime() * 50.0f, 0.0f, 0.0f, 1.0f);
		
		glTranslatef(posX, posY, posY);
		
		glBegin(GL_QUADS);
		glColor3f(1.0f, 0.0f, 0.0f);
		glVertex2f(0f, 0f);
		glColor3f(0.0f, 1.0f, 0.0f);
		glVertex2f(0.1f, 0f);
		glColor3f(0.0f, 0.0f, 1.0f);
		glVertex2f(0.1f, 0.2f);
		glColor3f(1.0f, 0.0f, 1.0f);
		glVertex2f(0f, 0.2f);
		glEnd();
	}
}