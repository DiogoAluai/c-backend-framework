# C Backend Framework
Create GET endpoints in C with @GET("/endpoint") annotation. Backend code is generated that will call the correspondent function.

Example of specification.c file:

```c
/*
specification.c
*/

// @GET("/hello")
char* hello() {
    return "Hello World!\n";
}

// @GET("/redirection")
char* classic_redirection() {
    // Starting string with 'HTTP' fully delegates HTTP mechanics to this callback
    return "HTTP/1.1 302 Found\r\nLocation: https://example.com\r\nContent-Length: 0\r\n";
}

// @GET("/queryString")
char* queryString(char* query_string) {
    // Function argument must be exactly 'char* query_string'
    // query_string will then be populated with whatever comes after '?'
    // Example http://localhost:8080/queryParams?asd=dsa&dsa=asd -> 'asd=dsa&dsa=asd
    return query_string;
}
```

The specificiation file is prepended to the final `backend.c`. This means include directives and global variables can work.

Running the backend:
```bash
$ ./install.sh
$ generate-backend example_specification.c
$ ./backend 8080

# elsewhere:
$ curl localhost:8080/hello
Hello World!
```


