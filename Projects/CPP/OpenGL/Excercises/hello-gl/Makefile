GL_INCLUDE = /usr/include/GL
GL_LIB = /usr/lib

hello-gl: hello-gl.o util.o
	gcc -o hello-gl $^ -L$(GL_LIB) -lGL -lglut -lGLEW -lm

#hello-gl-dummy: hello-gl-dummy.o
#	gcc -o hello-gl-dummy $^ -L$(GL_LIB) -lGL -lglut -lGLEW -lm

.c.o:
	gcc -c -o $@ $< -I$(GL_INCLUDE)

clean:
	rm -f hello-gl hello-gl-dummy hello-gl.o util.o hello-gl-dummy.o


