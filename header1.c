#include <jni.h>
#include <stdio.h>
#include "Example.h"
 

JNIEXPORT void JNICALL Java_Example_print(JNIEnv *env, jobject obj)
{
	printf("\nMENU\n");
	printf("1) Addition\n2) Subtraction\n3) Division\n4) Multiplication\n");
    printf("Enter Your choice\t ");
    return;
}
JNIEXPORT int JNICALL Java_Example_read(JNIEnv *env, jobject obj)
{
	int ch;
	scanf("%d",&ch);
	return ch;
}
JNIEXPORT int JNICALL Java_Example_addition(JNIEnv *env, jobject obj,jint a,jint b)
{
	return (a+b);
}
JNIEXPORT int JNICALL Java_Example_subtraction(JNIEnv *env, jobject obj,jint a,jint b)
{
	return (a-b);
}
JNIEXPORT float JNICALL Java_Example_division(JNIEnv *env, jobject obj,jint a,jint b)
{
	return ((float)a/(float)b);
}
JNIEXPORT int JNICALL Java_Example_multiplication(JNIEnv *env, jobject obj,jint a,jint b)
{
	return (a*b);
}
