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
	float downspeed = 0;
	float gravity = 0.000979;
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
		if(glfwGetKey(window, GLFW_KEY_SPACE) && this.isGrounded == true){
			for(int o = 0; o < 200; o++){
			posY += 0.001;
			}
		}
		if(glfwGetKey(window, GLFW_KEY_S)){
			if(this.isGrounded() == false){
				posY -= actualSpeed;
			}
		}
		if(glfwGetKey(window, GLFW_KEY_A)){
			posX -= actualSpeed;
		}
		if(glfwGetKey(window, GLFW_KEY_D)){
			posX += actualSpeed;
		}
		if(this.isGrounded() == false){
		downspeed += gravity;
		posY -= downspeed;
		}else{downspeed = 0;}
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
	public void renderGround(){
		glMatrixMode(GL_PROJECTION);
		glLoadIdentity();
		glOrtho(-ratio, ratio, -1.0f, 1.0f, 1.0f, -1.0f);
		glMatrixMode(GL_MODELVIEW);
		glLoadIdentity();

		glTranslatef(-1.35f, -1.0f, -1.0f);

		glBegin(GL_QUADS);
		glColor3f(0.0f, 1.0f, 1.0f);
		glVertex2f(0f, 0f);
		glVertex2f(2.7f, 0f);
		glVertex2f(2.7f, 0.55f);
		glVertex2f(0f, 0.55f);
		glEnd();
	}

	public bool isGrounded(){
		if(posY > -0.4){
			return false;
		}else{
			return true;
		}
	}
}