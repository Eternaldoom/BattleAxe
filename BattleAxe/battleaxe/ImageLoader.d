module battleaxe.ImageLoader;

import std.stdio;
import derelict.sdl2.image;
import derelict.sdl2.sdl;
import derelict.opengl3.gl3;
import derelict.opengl3.gl;
import std.string;

GLuint loadTexture(const char *filename, int *textw, int *texth){
	SDL_Surface *surface;
	GLuint textureid;
	int mode;

	surface = IMG_Load("stonetexture.png");

	if(surface == null){
		writeln("Could not load image file");
	}

	if (surface.format.BytesPerPixel == 3) { // RGB 24bit
		
		mode = GL_RGB;
		
	} else if (surface.format.BytesPerPixel == 4) { // RGBA 32bit
		
		mode = GL_RGBA;

	} else {
		
		SDL_FreeSurface(surface);
		return 0;
		
	}

	*textw = surface.w;
	*texth = surface.h;

	glGenTextures(1, &textureid);
	glBindTexture(GL_TEXTURE_2D, textureid);
	glTexImage2D(GL_TEXTURE_2D, 0, mode, surface.w, surface.h, 0, mode, GL_UNSIGNED_BYTE, surface.pixels);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	SDL_FreeSurface(surface);

	return textureid;
}