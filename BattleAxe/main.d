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

public Box background, box1, box2;

public float masterX = 0;
public float masterY = 0;

int main(){
	
	DerelictGLFW3.load();
	DerelictGL3.load();
	glfwInit();
	
	auto window = glfwCreateWindow(640, 480, "BattleAxe", null, null);
	int width, height;
	float playerX = 0f;
	float playerY = 0.5f;
	float ratio = width / cast(float)height;

	glfwMakeContextCurrent(window);

	DerelictGL.unload();
	DerelictGLFW3.unload();
	
	DerelictGLFW3.load();
	DerelictGL.load();

	auto player = new Player(window, 0.1, 0.2, playerX, playerY, ratio);

	background = new Box(-1f, -1f, 2f, 2f, ratio, sky);

	box1 = new Box(0.5f, -1f, 2f, 0.55f, ratio, cyan);
	
	box2 = new Box(-0.5f, -0.45f, 1f, 0.55f, ratio, yellow);

	while(!glfwWindowShouldClose(window)){
		glfwGetFramebufferSize(window, &width, &height);
		glViewport(0, 0, width, height);
		glClear(GL_COLOR_BUFFER_BIT);

		background.addStaticBox();

		player.renderPlayer();
		player.handleControls();
		player.handleGravity();

		box1.addBox();
		box2.addBox();

		//player.handleDeath();

		if(player.health < 1){
			player.setDead();
		}else{
			player.respawn();
		}


		glfwSwapBuffers(window);
		glfwPollEvents();
	}

	return EXIT_SUCCESS;
}