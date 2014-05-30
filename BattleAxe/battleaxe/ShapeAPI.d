﻿module battleaxe.ShapeAPI;

import std.stdio;
import core.stdc.stdlib;
import derelict.glfw3.glfw3;
import derelict.opengl3.gl3;
import derelict.opengl3.gl;

char[6] yellow = "yellow";
char[4] blue = "blue";
char[4] cyan = "cyan";
char[6] purple = "purple";
char[3] red = "red";
char[5] green = "green";


public void addBox(float xPos, float yPos, float width, float height, char[] color, float ratio){
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(-ratio, ratio, -1.0f, 1.0f, 1.0f, -1.0f);
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();

	glTranslatef(xPos, yPos, yPos);

	glBegin(GL_QUADS);

	if(color == "red"){ glColor3f(1.0f, 0.0f, 1.0f);}
	else if(color == "green"){ glColor3f(0.0f, 1.0f, 0.0f);}
	else if(color == "blue"){ glColor3f(0.0f, 0.0f, 1.0f);}
	else if(color == "cyan"){ glColor3f(0.0f, 1.0f, 1.0f);}
	else if(color == "purple"){ glColor3f(1.0f, 0.0f, 1.0f);}
	else if(color == "yellow"){ glColor3f(1.0f, 1.0f, 0.0f);}else{}

	glVertex2f(0f, 0f);
	glVertex2f(width, 0f);
	glVertex2f(width, height);
	glVertex2f(0f, height);
	glEnd();
}