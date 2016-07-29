#include <jni.h>
#include <stdio.h>

struct IPv4{
	int version;
    int length;
//	int ihl;
//	char id;
//	char flags;
//	char offset;
	int ttl;
	int protocol;
	int checksum;
	char src_ip[10];
	char dest_ip[10];
} ip4={4,20,5,16,50,"1.1.1.1","2.2.2.2"};

struct IPv6{
	char Source_Address[50];
	char Destination_Address[50];
	int version;
	int packet_priority;
	int flow_label;
} ip6={"fe80::9ead:97ff:fe49:eee3","fe80::9ead:97ff:fe49:2132",6,2,0};

JNIEXPORT void JNICALL Java_IPStructure_print(JNIEnv *env, jobject obj,jint version)
{
	if(version==4)
	{
	printf("\nIP Version %d: ",ip4.version);
	printf("\nIP Length %d: ",ip4.length);
	printf("\nTTL %d: ",ip4.ttl);
	printf("\nProtocol %d:",ip4.protocol);
	printf("\nChecksum %d:",ip4.checksum);
	printf("\nSource IP %s:",ip4.src_ip);
	printf("\nDestination IP %s:",ip4.dest_ip);
	}
	else
	{
	printf("\nIP Version %d: ",ip6.version);
	printf("\nSource IP Address %s: ",ip6.Source_Address);
	printf("\nDestination IP Address %s: ",ip6.Destination_Address);
	printf("\nPacket priority %d:",ip6.packet_priority);
	printf("\nFlow label %d:",ip6.flow_label);
	}
    return;
}

JNIEXPORT int JNICALL Java_IPStructure_read(JNIEnv *env, jobject obj)
{
	int ch;
		printf("\nMENU\n");
		printf("1) IPv4 Structure \n2) IPv6 Structure\n");
		printf("Enter your choice\n");
		scanf("%d",&ch);
		return ch;
}
