//#include "plasma.h"
//#include "no_os.c"

#define GPIO0_OUT 0x20000030
#define GPIO0_CLEAR 0x20000040
//#define GPIOA_IN 0x20000050

//int putchar(int value);
//int puts(const char *string);
//void Led(int value);

//#define GPIO0_CLEAR 255
//#define GPIO0_OUT 255

int main()
{
 
 int value = 128 ;
 int i,j,k;
 //int gpio_value;
 int dice_value = 0;
 
 puts("Test Led");
 
 for (i=0; i<300 ;i++)
 {
	//gpio_value = MemoryRead(GPIOA_IN);
	//while (gpio_value & (1 << 10) != 0)
		
	while ((InputName() & (1 << 10)) == 0);
	//while ((InputName() && (1 << 10)) == 0);
		
	do
	 {
		Led(value);
		value = value >> 1;
		for(j=0 ;j<2500000 ;j++)
		{
		};
	 }while(value != 1);
	 
	 do
	 {
		Led(value);
		value = value << 1;
		for(k=0 ;k<2500000 ;k++)
		{
		};
	 }while(value != 256);

    
	while(1)
	{
		Led(InputName());
	}
	
 }
 puts("Test Led");
 return 0;
}

