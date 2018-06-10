#include <stdio.h>
#include <stdlib.h>

typedef struct List_element
{
	int data;
	struct List_element *next;
}List_elem;

List_elem *head = NULL;

List_elem* create_elem(int data)
{
	List_elem* new_elem;
	new_elem = (List_elem*)malloc(sizeof(List_elem));
	new_elem->data = data;
	new_elem->next = NULL;
	return new_elem;
}

void insert_begin(List_elem* a)
{
	if(head == NULL) head = a;
	else 
	{
		a->next = head;
		head = a;
	}
}

void insert_end(List_elem* a)
{
	List_elem* tmp = head;
	if(head == NULL) head = a;
	else
	{
		while(tmp->next != NULL)
		{
			tmp = tmp->next;
		}
		tmp->next = a;
	}
}

void print_list()
{
	List_elem* tmp = head;
	while(tmp != NULL)
	{
		printf("%d ", tmp->data);
		tmp = tmp->next;
	}
	printf("\n");
}

void destroy_elem(List_elem* a)
{
	if(a != NULL) free(a);
}

void armageddon()
{
	List_elem* tmp = head, *tmp2;
	while(tmp->next != NULL)
	{
		tmp2 = tmp;
		tmp = tmp->next;
		free(tmp2);
	}
}

//int main()
//{
//	insert_begin(create_elem(1));
//	insert_begin(create_elem(2));
//	insert_end(create_elem(3));
//	print_list();
//	armageddon();
//	return 0;
//}