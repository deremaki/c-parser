#include <stdio.h>
#include<string.h>
typedef struct  
{
	int hours;
	int minutes;
	int seconds;
} TIME;
void comparetime(TIME *td, TIME t1, TIME t2);
void main()
{
	TIME t1, t2, td;
	printf("Enter the time t1\n");
	scanf("%d %d %d", &t1.hours, &t1.minutes, &t1.seconds);
	printf("Enter the time t2\n");
	scanf("%d %d %d", &t2.hours, &t2.minutes, &t2.seconds);
	comparetime(&td,t1,t2);
	printf("%d \t %d \t %d \n", td.hours, td.minutes, td.seconds);
}
void comparetime(TIME *td, TIME t1, TIME t2)
{
	td->hours = t1.hours - t2.hours;
	td->minutes = t1.minutes - t2.minutes;
	td->seconds = t1.seconds - t2.seconds;
}
