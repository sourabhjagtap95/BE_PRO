# BE_PRO
This is related to BE Project

The objective is to create a shared object library file (or .so) and implementing java file to execute the required functions
from library file.

> It can be done by using Java Native Interface (JNI).
To know more about it go to http://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html#fn:1 or 
http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html

# Steps to run the file :
> For compiling java file:
```
$ javac Example.java
```
```
$ javah -jni Example
```

> For compiling C file
```
$ gcc -fPIC -o libhello.so -shared -I /usr/lib/jvm/java-7-openjdk-amd64/include 
-I /usr/lib/jvm/java-7-openjdk-amd64/include/linux/ header1.c
```
It creates a shared object library "libhello.so"

>
```
$ export LD_LIBRARY_PATH = (current-directory):$LD_LIBRARY_PATH
```
>
```
$ java Example
```
