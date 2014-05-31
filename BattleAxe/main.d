module main;

import std.stdio;
import core.stdc.stdlib;
import derelict.glfw3.glfw3;
import derelict.opengl3.gl3;
import derelict.opengl3.gl;
import battleaxe.Player;
import battleaxe.Box;

pragma(lib, "DerelictUtil");
pragma(lib, "DerelictGl3");
pragma(lib, "DerelictGLFW3");

Box box1, box2;

int main(){
	
	DerelictGLFW3.load();
	DerelictGL3.load();
	glfwInit();
	
	auto window = glfwCreateWindow(640, 480, "BattleAxe", null, null);
	int width;
	int height;
	glfwGetFramebufferSize(window, &width, &height);
	float posX = -1.2f;
	float posY = 0.5f;
	float ratio = width / cast(float)height;

	glfwMakeContextCurrent(window);

	DerelictGL.unload();
	DerelictGLFW3.unload();
	
	DerelictGLFW3.load();
	DerelictGL.load();

	auto player = new Player(window, width, height, posX, posY, ratio);

	box1 = new Box(-1.35f, -1.0f, 2.7f, 0.55f, cyan);
	
	box2 = new Box(-1.35f, -0.45f, 1.3f, 0.55f, yellow);

	while(!glfwWindowShouldClose(window)){
		glfwGetFramebufferSize(window, &width, &height);
		glViewport(0, 0, width, height);
		glClear(GL_COLOR_BUFFER_BIT);
		player.renderPlayer();
		player.handleControls();
		player.handleGravity();

		box1.addBox();
		box2.addBox();

		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	return EXIT_SUCCESS;
}