# BE_PRO
This is related to BE Project

The objective is to create a shared object library file (or .so) and implementing java file to execute the required functions
from library file.

> It can be done by using Java Native Interface (JNI).
To know more about it go to http://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html#fn:1 or 
http://www.yolinux.com/TUTORIALS/LibraryArchives-StaticAndDynamic.html or 
http://web.archive.org/web/20120419230023/http://java.sun.com/docs/books/jni/html/start.html

# Steps to run the file :
> For compiling java file:
```
$ javac IPStructure.java
```
```
$ javah -jni IPStructure
```

> For compiling C file
```
$ gcc -fPIC -o libip.so -shared -I /usr/lib/jvm/java-7-openjdk-amd64/include 
-I /usr/lib/jvm/java-7-openjdk-amd64/include/linux/ IPStructure.c
```
It creates a shared object library "libip.so"

>
```
$ export LD_LIBRARY_PATH = (current-directory):$LD_LIBRARY_PATH
```
>
```
$ java IPStructure
```
