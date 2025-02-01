# C Backend Framework
Create GET endpoints in C with @GET("/endpoint") annotation. Backend code is generated that will call the correspondent function.

Example of specification.c file:

```c
/*
specification.c
*/

// @GET("/hello")
char* hello(/* params unsupported*/) {
    return "Hello World!\n";
}
```

The specificiation file is prepended to the final `backend.c`. This means include directives and global variables can work.

Running the backend:
```bash
$ build_backend.sh example_specification.c
$ ./backend 8080

# elsewhere:
$ curl localhost:8080/hello
Hello World!
```


