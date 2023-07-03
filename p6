%{ 
#include<stdio.h> 
int line=0; 
%} 
chr[ a-zA-Z]*[0-9]* 
chr1[ a-zA-z]*[0-9]*[\n]?
%%
"/*" {chr1}* "*/" {line++; fprintf(yyout, " ");} 
"//" {chr}* {line++; fprintf(yyout, " ");} 
%% 
main(int argc,char *argv[ ]) 
{ 
yyin=fopen(argv[1],"r"); 
if(yyin==NULL) 
{ 
printf("Unable to open input file %s",argv[1]); 
return 0; 
}
yyout=fopen(argv[2],"w"); 
if(yyout==NULL) 
{ 
printf("Unable to create output file %s\n",argv[2]); 
return 0; 
}
yylex( ); 
printf("\nThe number of comment lines are %d\n",line); 
} 
int yywrap( ) 
{ 
return 1; 
}
