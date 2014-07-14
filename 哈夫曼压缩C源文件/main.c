/*
 * File: main.c
 * Purpose: testing File Compression
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "compress.h"
int DO_STATUS;
char InFile[1024]; //The file to compress.
char CompressedFile[1024]; //Compressed data of the file.
char OutFile[1024]; //The decompressed file of the data.
const char *compfile = ".wbys";
int extract_name(char *rsc, char *dst);

int main(int n, char **argv)
{
    char Filename[256];

    //1. compress file
    DO_STATUS = atoi(argv[1]);
    if(DO_STATUS)
    {
        //1.1. handle file path
        strcpy(InFile, argv[2]);
        printf("InFile is %s \n", InFile);
        strcpy(CompressedFile, argv[3]);
        printf("CompressedFIle is %s \n", CompressedFile);
        extract_name(argv[2], Filename);
        strcat(CompressedFile, "\\");
        strcat(CompressedFile, Filename);
        strcat(CompressedFile, compfile);
        //1.2. compress
        FCS *fcs1;
        fcs1 = fcs_new();
        fcs_compress(fcs1, InFile, CompressedFile);
        fcs_free(fcs1);
    }
    //2. decompress file
    if(!DO_STATUS)
    {
        //
        strcpy(CompressedFile, argv[2]);
        strcpy(OutFile, argv[3]);
        extract_name(argv[2], Filename);
        Filename[strlen(Filename) - 5] = '\0';
        strcat(OutFile, "\\");
        strcat(OutFile, Filename);
        printf("%s\n", OutFile);
        printf("%s\n", CompressedFile);
        //
        FCS *fcs2;
        fcs2 = fcs_new();
        fcs_decompress(fcs2, CompressedFile, OutFile);
        fcs_free(fcs2);
    }
    system("pause");
    return 0;
}

int extract_name(char *rsc, char *dst)
// rsc: 绝对路径 dst: 最后一级目录或者文件
{
    char *spilt = "\\";
    char *dst2, *dst1;

    if (!rsc)
        return 0;
    else
    {
        dst2 = strtok(rsc, spilt);
        dst1 = dst2;
        while ((dst1 = strtok(NULL, spilt)))
            dst2 = dst1;
        strcpy(dst, dst2);

        return 1;
    }
}
