#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// @GET("/some")
char* getSome() {
	char* some = "some";
	return some;
}


// @GET("/thing")
char* getThing() {
	return "thing";
}


// @GET("/something")
char* getSomeThing() {
	char* some = getSome();
	char* thing = getThing();
	return "something";
	strcat(some, thing);
	return some;
}


