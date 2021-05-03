#define WAITING 9000000000


int main()
{
	int i, e1=0, e2=0, e3=0, e4=0;

	while(1)
	{
		SEG7(e4, e3, e2, e1);
		
		for(i = 0; i < WAITING ; i++); //wait statement
		
		e4 = e3;
		e3 = e2;
		e2 = e1;
		e1++;
		
		if(e1 > 15) e1 = 0;
		
	}
	return 0;
}

/*

int main()
{
	int e1=0, e2=0, e3=0, e4=0;
	puts("Test Seg\n");
	while(1)
	{
		SEG7(e4, e3, e2, e1);
		
		for(int i = 0; i < 7500000 ; i++);//timers
		
		e4 = e3;
		e3 = e2;
		e2 = e1;
		e1++;
		
		if(e1 > 15) e1 = 0;
		
	}
	return 0;
}
*/