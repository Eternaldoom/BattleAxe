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
	float width, height;
	float posX, posY, actualSpeed;
	float speed = 66f;
	float downspeed = 0;
	float gravity = 0.000979;
	this(GLFWwindow *window, float width, float height, float posX, float posY)
	{
		this.window = window;
		this.width = width;
		this.height = height;
		this.posX = posX;
		this.posY = posY;
		this.actualSpeed = 1/speed;
	}

	public void handleControls(){
		if(glfwGetKey(window, GLFW_KEY_SPACE) && (this.isGrounded(box1) == true || this.isGrounded(box2) == true)){
			for(int o = 0; o < 200; o++){
			posY += 0.001;
			}
		}
		if(glfwGetKey(window, GLFW_KEY_A) || glfwGetKey(window, GLFW_KEY_LEFT)){
			if(this.isCollidingWithLeftWall(box1) == false && this.isCollidingWithLeftWall(box2) == false){
			posX -= actualSpeed;
			screenX += 10;
			}
		}
		if(glfwGetKey(window, GLFW_KEY_D) || glfwGetKey(window, GLFW_KEY_RIGHT)){
			if(this.isCollidingWithRightWall(box1) == false && this.isCollidingWithRightWall(box2) == false){
			posX += actualSpeed;
			screenX -= 10;
			}
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
		glMatrixMode(GL_MODELVIEW);
		glLoadIdentity();

		glTranslatef(posX, posY, posY);

		glBegin(GL_QUADS);
		glColor3f(1.0f, 0.0f, 0.0f);
		glVertex2f(0f, 0f);
		glColor3f(0.0f, 1.0f, 0.0f);
		glVertex2f(width, 0f);
		glColor3f(0.0f, 0.0f, 1.0f);
		glVertex2f(width, height);
		glColor3f(1.0f, 0.0f, 1.0f);
		glVertex2f(0f, height);
		glEnd();
	}
	public bool isGrounded(Box ground){
		if((posY > ground.yPos + ground.height || posY < ground.yPos) || (posX + 0.1 < ground.xPos || posX > ground.xPos + ground.width)){
			return false;
		}else{return true;}
	}
	public bool isCollidingWithLeftWall(Box wall){
		if(posX < wall.xPos+wall.width && posX > wall.xPos && posY < wall.yPos + wall.height - 0.025f && posY > wall.yPos - 0.025){
			return true;
		}else{
			return false;
		}
	}
	public bool isCollidingWithRightWall(Box wall){
		if(posX + 0.1 > wall.xPos && posX < wall.xPos + wall.width - 0.1 && posY < wall.yPos + wall.height - 0.025f && posY > wall.yPos - 0.025){
			return true;
		}else{
			return false;
		}
	}
}