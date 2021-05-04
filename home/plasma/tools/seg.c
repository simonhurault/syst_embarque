#define WAITING 4500000


int main()
{
	char seg_value;
	int i;
	puts("Segment");
	seg_value = 0;
	while(1)
	{
		SEG7(seg_value, seg_value, seg_value, seg_value);
		
				
		for(i = 0; i < WAITING ; i++); //wait statement

		seg_value++;
		
		if(seg_value > 15) seg_value = 0;
		
	}
	return 0;
}
