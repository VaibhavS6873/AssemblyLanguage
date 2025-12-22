#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>

#define BUFFER_SIZE 1024
int main()
{
	char err[] = "\nCant Open Source File\n";
	char succ[] = "\nCopied Successfully\n";
	int bytes_read;
	char buffer[BUFFER_SIZE];	
	int fd1 = open("file_copy_source.txt",O_RDONLY);
	if(fd1 == -1)
	{
		write(STDOUT_FILENO, err, sizeof(err));
		return -1;
	}
	
	int fd2 = open("file_copy_destination.txt",O_WRONLY|O_CREAT|O_TRUNC);
	if(fd2 == -1)
	{
		write(STDOUT_FILENO, err, sizeof(err));
		close(fd1);
		return -1;
	}
	
	while(1)
	{
		bytes_read = read(fd1,buffer,BUFFER_SIZE);
		
		if(bytes_read == 0)
			break;
		write(fd2, buffer, bytes_read);
	}
	
	close(fd1);
	close(fd2);
	
	write(STDOUT_FILENO, succ, sizeof(succ));
	return 0;
}
