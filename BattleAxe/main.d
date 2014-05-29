module main;

import std.stdio;
import core.stdc.stdlib;
import derelict.glfw3.glfw3;
import derelict.opengl3.gl3;
import derelict.opengl3.gl;
import battleaxe.Player;

pragma(lib, "DerelictUtil");
pragma(lib, "DerelictGl3");
pragma(lib, "DerelictGLFW3");

int main(){
	
	DerelictGLFW3.load();
	DerelictGL3.load();
	glfwInit();
	
	auto window = glfwCreateWindow(640, 480, "Hello, World", null, null);
	int width;
	int height;
	glfwGetFramebufferSize(window, &width, &height);
	float posX = (-width/1000) - 0.2;
	float posY = (height/500) - 0.2;
	float ratio = width / cast(float)height;

	glfwMakeContextCurrent(window);

	DerelictGL.unload();
	DerelictGLFW3.unload();
	
	DerelictGLFW3.load();
	DerelictGL.load();

	auto player = new Player(window, width, height, posX, posY, ratio);
	while(!glfwWindowShouldClose(window)){
		glfwGetFramebufferSize(window, &width, &height);
		glViewport(0, 0, width, height);
		glClear(GL_COLOR_BUFFER_BIT);
		player.handleMovement();
		player.renderPlayer();
		player.renderGround1();
		player.renderGround2();

		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	return EXIT_SUCCESS;
}