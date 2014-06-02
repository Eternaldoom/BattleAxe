module battleaxe.Box;

import std.stdio;
import core.stdc.stdlib;
import derelict.glfw3.glfw3;
import derelict.opengl3.gl3;
import derelict.opengl3.gl;
import main;

char[6] yellow = "yellow";
char[4] blue = "blue";
char[4] cyan = "cyan";
char[6] purple = "purple";
char[3] red = "red";
char[3] sky = "sky";
char[5] green = "green";

class Box{
	
	public float xPos, yPos, width, height, ratio;
	char[] color;

	this(float xPos, float yPos, float width, float height, float ratio, char[] color){
		this.xPos = xPos;
		this.yPos = yPos;
		this.width = width;
		this.height = height;
		this.color = color;
		this.ratio = ratio;
	}

public void addBox(){
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glMatrixMode(GL_MODELVIEW);
	
	glLoadIdentity();
	glTranslatef(xPos+masterX, yPos+masterY, yPos+masterY);

	glBegin(GL_QUADS);

	if(color == "red"){ glColor3f(1.0f, 0.0f, 1.0f);}
	else if(color == "green"){ glColor3f(0.0f, 1.0f, 0.0f);}
	else if(color == "blue"){ glColor3f(0.0f, 0.0f, 1.0f);}
	else if(color == "cyan"){ glColor3f(0.0f, 1.0f, 1.0f);}
	else if(color == "purple"){ glColor3f(1.0f, 0.0f, 1.0f);}
	else if(color == "sky"){ glColor3f(0.0f, 0.5f, 1.0f);}
	else if(color == "yellow"){ glColor3f(1.0f, 1.0f, 0.0f);}else{}

	glVertex2f(0f, 0f);
	glVertex2f(width, 0f);
	glVertex2f(width, height);
	glVertex2f(0f, height);
	glEnd();
}

public void addStaticBox(){
		glMatrixMode(GL_PROJECTION);
		glLoadIdentity();
		glMatrixMode(GL_MODELVIEW);

		glLoadIdentity();
		glTranslatef(xPos, yPos, yPos);
		
		glBegin(GL_QUADS);
		
		if(color == "red"){ glColor3f(1.0f, 0.0f, 1.0f);}
		else if(color == "green"){ glColor3f(0.0f, 1.0f, 0.0f);}
		else if(color == "blue"){ glColor3f(0.0f, 0.0f, 1.0f);}
		else if(color == "cyan"){ glColor3f(0.0f, 1.0f, 1.0f);}
		else if(color == "purple"){ glColor3f(1.0f, 0.0f, 1.0f);}
		else if(color == "sky"){ glColor3f(0.0f, 0.5f, 1.0f);}
		else if(color == "yellow"){ glColor3f(1.0f, 1.0f, 0.0f);}else{}
		
		glVertex2f(0f, 0f);
		glVertex2f(width, 0f);
		glVertex2f(width, height);
		glVertex2f(0f, height);
		glEnd();
	}
}