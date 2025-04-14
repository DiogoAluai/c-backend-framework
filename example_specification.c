#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// @GET("/hello")
char* hello() {
    return "Hello World!\n";
}


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


// @GET("/redirection")
char* classic_redirection() {
    // Starting string with HTTP fully delegates HTTP mechanics to this callback
    return "HTTP/1.1 302 Found\r\nLocation: https://example.com\r\nContent-Length: 0\r\n";
}


// @GET("/queryString")
char* queryString(char* query_string) {
    // Function argument must be exactly 'char* query_string'
    // query_string will then be populated with whatever comes after '?'
    // Example http://localhost:8080/queryParams?asd=dsa&dsa=asd -> 'asd=dsa&dsa=asd
    return query_string;
}
