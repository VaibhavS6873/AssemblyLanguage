#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<fcntl.h>

int main()
{
	char err[] = "\nCant Open Source File\n";
	char ent[] = "\nEnter strings:\n";
	char szText[1024];
	int bytes_read;
	
	int fd1 = open("keyboard_to_file.txt",O_WRONLY|O_CREAT|O_TRUNC);
	
	if(-1 == fd1)
	{
		write(STDOUT_FILENO, err, sizeof(err));
		return -1;
	}
	
	 write(STDOUT_FILENO, ent, sizeof(ent));
	 while((bytes_read = read(STDIN_FILENO, szText, sizeof(szText))) > 0)
    {
        // Stop on empty line
        if(bytes_read == 1 && szText[0] == '\n')
            break;
            
        if(write(fd1, szText, bytes_read) != bytes_read)
            break;  // write error
    }
    
    close(fd1);
	return 0;
}
