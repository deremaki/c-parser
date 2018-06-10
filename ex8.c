// Task 2
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



////Task 5
//#include <stdio.h>
//#include<string.h>
////struct Rational 
////{
////	int numerator;
////	int denominator;
////};
////typedef struct Rational RATIONAL;
//
//typedef struct  
//{
//	char name[30];
//	int age;
//	int semester;
//} Student;
//
//void setStudent(char *name, int age, int semester, Student *person);
//void printStudent(Student person);
//int compareStudents(Student s1, Student s2);
//void main()
//{
//	int i =0;
//	Student s1[3] = {{"Tomasz Fejcak", 20 ,8}, {"Filip Cel" , 19 , 1 }, {"Partycja Haraburda", 21, 5}}; 
//	setStudent("Filip Cel", 19, 1, &s1[0]);
//
//	for(i;i<3;i++)
//	{
//	printStudent(s1[i]);
//	}
//	printf("%d",compareStudents(s1[0],s1[2]));
//
//}
//
//int compareStudents(Student s1, Student s2)
//{
////int arethesame = 1;
//// arethesame = strcmp(s1.name,s2.name);
//// if(s1.age !=s2.age) arethesame = 0;
//// else if (s1.semester != s2.semester) arethesame = 0;
//// return arethesame;
//
// return ( !strcmp(s1.name,s2.name) && (s1.age == s2.age) && (s1.semester == s2.semester));
//
//
//}
//
//
//void setStudent(char *name, int age, int semester, Student *person)
//{
//	strcpy(person->name,name);
//	person->age = age;
//	person->semester=semester;
//}
//
//void printStudent(Student person)
//{
//	printf(" %s \t %d \t %d \n", person.name, person.age, person.semester);
//}


////Task 1 other version
//#include <stdio.h>
//
////struct Rational 
////{
////	int numerator;
////	int denominator;
////};
////typedef struct Rational RATIONAL;
//
//typedef struct  
//{
//	int numerator;
//	int denominator;
//} RATIONAL;
//
//
//void setValues(int numerator, int denominator, RATIONAL *rational);
//void printRatio(RATIONAL rational);
//
//
//
//
//void main()
//{
//	RATIONAL rational;
//	setValues(1, 2, &rational);
//
//	printRatio(rational);
//
//}
//
//void setValues(int numerator, int denominator, RATIONAL *rational)
//{
//	rational->numerator = numerator;
//	rational->denominator = denominator;
//}
//void printRatio(RATIONAL rational)
//{
//	printf("%d / %d\n", rational.numerator, rational.denominator);
//}





//Task 1
//#include <stdio.h>
//
//struct Rational 
//{
//	int numerator;
//	int denominator;
//};
//
//struct Rational setValues(int numerator, int denominator);
//void printRatio(struct Rational rational);
//
//
////typedef struct Rational RATIONAL;
//
//void main()
//{
//	struct Rational rational = setValues(1, 2);
//
//	printRatio(rational);
//
//}
//
//struct Rational setValues(int numerator, int denominator)
//{
//	struct Rational tempRational;
//	tempRational.numerator = numerator;
//	tempRational.denominator = denominator;
//
//	return tempRational;
//}
//void printRatio(struct Rational rational)
//{
//	printf("%d / %d\n", rational.numerator, rational.denominator);
//}