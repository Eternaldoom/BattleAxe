module battleaxe.Player;

import std.stdio;
import core.stdc.stdlib;
import derelict.glfw3.glfw3;
import derelict.opengl3.gl3;
import derelict.opengl3.gl;
import battleaxe.Box;
import main;

class Player
{
	GLFWwindow *window;
	int width, height;
	float posX, posY, actualSpeed, ratio;
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
		this.actualSpeed = 1/speed;
		this.ratio = ratio;
	}

	public void handleControls(){
		if(glfwGetKey(window, GLFW_KEY_SPACE) && (this.isGrounded(box1) == true || this.isGrounded(box2) == true)){
			for(int o = 0; o < 200; o++){
			posY += 0.001;
			}
		}
		if(glfwGetKey(window, GLFW_KEY_A) || glfwGetKey(window, GLFW_KEY_LEFT)){
			if(this.isCollidingWithLeftWall == false){
			posX -= actualSpeed;
			}
		}
		if(glfwGetKey(window, GLFW_KEY_D) || glfwGetKey(window, GLFW_KEY_RIGHT)){
			posX += actualSpeed;
		}
	}
	public void handleGravity(){
		if(this.isGrounded(box1) == false && this.isGrounded(box2) == false){
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

	public bool isGrounded(Box ground){
		if((posY > ground.yPos + ground.height) && (posX > ground.xPos || posX < ground.xPos + ground.width)){
			return false;
		}else{return true;}
	}
	public bool isCollidingWithLeftWall(){
		if(posX < -0.05 && posY < 0.08){
			return true;
		}else{
			return false;
		}
	}
}