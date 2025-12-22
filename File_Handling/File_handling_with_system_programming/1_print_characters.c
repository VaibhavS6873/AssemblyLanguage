#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>

#define BUFFER_SIZE 1024
int main()
{
	int bytes_read;
	char buffer[BUFFER_SIZE];
	char error[] = "\nCant Open File\n";
	int fd = open("print_characters.txt",O_RDONLY);
	
	if(fd == -1)
	{
		write(STDOUT_FILENO,error,sizeof(error));
		return -1;
	}
	
	while(1)
	{
		bytes_read = read(fd, buffer, BUFFER_SIZE);
		if(bytes_read == 0)
			break;
		else
		{
			write(STDOUT_FILENO, buffer, bytes_read);
		}
	}
	
	close(fd);	
	return 0;
}
