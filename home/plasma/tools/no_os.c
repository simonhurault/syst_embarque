#include "plasma.h"

#define MemoryRead(A) (*(volatile unsigned int*)(A))
#define MemoryWrite(A,V) *(volatile unsigned int*)(A)=(V)

int putchar(int value)
{
   while((MemoryRead(IRQ_STATUS) & IRQ_UART_WRITE_AVAILABLE) == 0)
      ;
   MemoryWrite(UART_WRITE, value);
   return 0;
}

int puts(const char *string)
{
   while(*string)
   {
      if(*string == '\n')
         putchar('\r');
      putchar(*string++);
   }
   return 0;
}

void Led(int value)
{
	MemoryWrite(GPIO0_CLEAR, (~value) & 0xffff); //clear
	MemoryWrite(GPIO0_OUT, value); //Change LEDs
}

int InputName(void)
{
	return MemoryRead(GPIOA_IN);
}

void print_hex(unsigned long num)
{
   long i;
   unsigned long j;
   for(i = 28; i >= 0; i -= 4) 
   {
      j = (num >> i) & 0xf;
      if(j < 10) 
         putchar('0' + j);
      else 
         putchar('a' - 10 + j);
   }
}

void OS_InterruptServiceRoutine(unsigned int status)
{
   (void)status;
   putchar('I');
}

int kbhit(void)
{
   return MemoryRead(IRQ_STATUS) & IRQ_UART_READ_AVAILABLE;
}

int getch(void)
{
   while(!kbhit()) ;
   return MemoryRead(UART_READ);
}


void SEG7(char E4, char E3, char E2, char E1) {
	//ALIGNEMENT DES PARAMETRES PAR DECALAGE A GAUCHE DE X BITS
	int tmp=E4<<16 | E3<<20 | E2<<24 | E1<<28 ;
	MemoryWrite(GPIO0_CLEAR, (~tmp) & 0xffff0000); //clear
	MemoryWrite(GPIO0_OUT, tmp); //set
} 

void SEG7_1(char E4, char E3, char E2, char E1) {
	//ALIGNEMENT DES PARAMETRES PAR DECALAGE A GAUCHE DE X BITS
	int tmp=E4<<0 | E3<<4 | E2<<8 | E1<<12 ;
	MemoryWrite(GPIO1_CLEAR, (~tmp) & 0xffff); //clear
	MemoryWrite(GPIO1_OUT, tmp); //set
} 
