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
	float width, height, posX, posY, actualSpeed, ratio;
	float speed = 66f;
	float downspeed = 0;
	float gravity = 0.000979;
	public bool isDead = false;
	int health = 100;
	this(GLFWwindow *window, float width, float height, float posX, float posY, float ratio)
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
			if(this.isCollidingWithLeftWall(box1) == false && this.isCollidingWithLeftWall(box2) == false){
				if(posX < -0.35){
					masterX += actualSpeed;
				}else{
					posX -= actualSpeed;
			}
		}
		}
		if(glfwGetKey(window, GLFW_KEY_D) || glfwGetKey(window, GLFW_KEY_RIGHT)){
			if(this.isCollidingWithRightWall(box1) == false && this.isCollidingWithRightWall(box2) == false){
				if(posX+0.1 > 0.35){
					masterX -= actualSpeed;
					}else{
						posX += actualSpeed;
				}
			}
		}
		}

	public void handleGravity(){
		if(this.isGrounded(box1) == false && this.isGrounded(box2) == false){
			downspeed += gravity;

			if(posY < -0.5){
				masterY += downspeed;
				health -= 1;
			}else{
				posY -= downspeed;
			}
		}else{
			downspeed = 0;
		}
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
		if((posY > ground.yPos + ground.height || posY < ground.yPos) || (posX + 0.1 < ground.xPos+masterX|| posX > ground.xPos+ground.width+masterX)){
			return false;
		}else{return true;}
	}
	public bool isCollidingWithLeftWall(Box wall){
		if(posX < wall.xPos+wall.width+masterX && posX > wall.xPos+masterX && posY < wall.yPos + wall.height - 0.025f && posY > wall.yPos - 0.025){
			return true;
		}else{
			return false;
		}
	}
	public bool isCollidingWithRightWall(Box wall){
		if(posX + 0.1 > wall.xPos+masterX && posX < wall.xPos+wall.width-0.1+masterX && posY < wall.yPos + wall.height - 0.025f && posY > wall.yPos - 0.025){
			return true;
		}else{
			return false;
		}
	}

	public void setDead(){
		isDead = true;
	}

	public void respawn(){
		isDead = false;
	}

	public void handleDeath(){
	if(isDead == true){
			glBegin(GL_QUADS);
			glEnable(GL_BLEND);
			glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
			glColor3i(0, 0, 0);
			glVertex2i(-1, -1);
			glVertex2i(-1, 2);
			glVertex2i(2, 2);
			glVertex2i(2, -1);
		}
	}
}