#include <stdio.h>
#define N 5
void selectionSort(double *Arr, int n);
void swapValues(double *a, double *b);
void insertionsort(double *Arr, int n);
void bubblesort(double a[], int n);
void bubblesortl(double a[], int n);
void main()
{
	double Arr[N] = {3.0, 1.0, 6.5, 2.0, 0.2};
	int i = 0;
	for(i; i < N; i++)
	{
		printf("%.2lf ", Arr[i]);
	}
	printf("\n");
	//selectionSort(Arr, N);
	//insertionsort(Arr,N);
	bubblesortl(Arr, N);
	for(i = 0; i < N; i++)
	{
		printf("%.2lf ", Arr[i]);
	}
	printf("\n");
}
void insertionsort(double *Arr, int n)
{
	int i = 1, j;
	for(i;i<n;i++)
	{
		for(j=i-1;j>=0;j--)
		{
			if(Arr[j]<Arr[j+1]) break;
			swapValues(&Arr[j],&Arr[j+1]);
		}
	}
}
void bubblesort(double a[], int n)
{
	int i, j;
	for(i=n-1; i>0; i--)
		for(j=0; j<i; j++)
			if(a[j]>a[j+1]) 
				swapValues(&a[j], &a[j+1]);
}
void bubblesortl(double a[], int n)
{
	int i, j, last;
	for(i=n-1; i>0; i=last)
		for(j=0; j<i; j++)
			if(a[j]>a[j+1]) 
			{
				swapValues(&a[j], &a[j+1]);
				last = j;
			}
}
void selectionSort(double *Arr, int n)
{
	int i = 0, j, min_index;
	for(i; i < n - 1; i++)
	{
		min_index = i;
		for(j = i + 1; j < n; j++)
		{
			if(Arr[j] < Arr[min_index])
			{
				min_index = j;
			}
		}
		swapValues(&Arr[i], &Arr[min_index]);
	}
}
void swapValues(double *a, double *b)
{
	double temp;
	temp = *a;
	*a = *b;
	*b = temp;
}
