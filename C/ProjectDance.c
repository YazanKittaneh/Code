// Yazan Kittaneh
// Joey Saenz
// William Royle

/*
Pre-conditions:
    none
Post-conditions:
    Each dance will be picked randomly by the main function. 
*/


#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "MyroC.h"

/* compile program with gcc -lMyroC -o dance ProjectDance.c */



/*
Pre-conditions:
    The scribbler car is connected
Post-conditions:
    The scribbler turns left at speed 1, for 3 seconds then right at speed 1 for 3 seconds
*/
void twirl()           /* Dance #1, robot twirls in a circle*/
{
  rTurnLeft(1,3);
  rTurnRight(1,3);
}

/*
Pre-conditions:
    The scribbler car is connected
    movementList is an array
    Length is an integer
Post-conditions:
    randomDance calls rForward and rTurnLeft length times, each time calling the sequential integer in the movementList array. 
*/

void randomDance(int movementList[],int length)  /* Dance #2, robot moves forward then left at a power of 6, but for a random
   length of time (in main function) */
{
  int count;
  for (count=0;count<length;count++)
    {
      rForward(6 ,movementList[count]);
      rTurnLeft(6 ,movementList[count]);
    }
}

/*
Pre-conditions:
    The scribbler cart is connected
Post-conditions:
    detectSurroundingsDance() returns an integer 
    Turns left before checking for obstacles
    If theres an obstacle, make a low beep and terminate dance
    If there isnt' an obstacle, make high beep, increment counter, and loop. 
*/

int detectSurroundingsDance()  /* Dance #3,  robot moves forward 10 times, or until it sees an obstacle.  Each time the robot moves forward, it beeps, and if there is an obstacle, the robot 
will turn left. */
{
  int obstacle=0;
  int count=0;
  while (obstacle==0&& count<10)
    {
      rTurnLeft(.5,1);
      obstacle=rGetIRTxt("right");
      if (obstacle)
        {
          rBeep(.5,2000);
        }
      else
        {
          rBeep(.5,500);
        }
      count++;
    }
  return obstacle;
}

/*
Pre-conditions:
    The scribbler cart is connected
    Obstacle is an integer
Post-conditions:
    If theres an obstical, beep four times
    Otherwise, move forward and right four times
*/

void valueDance(int obstacle) /* Dance #4, robot beeps four times if there is an obstacle in front. Otherwise, the robot will move forward and right in the shape of a box, or until it finds  an obstacle. */
{
  if(obstacle==1)
    {
      int count;
      for(count=0; count<=2; count++)
        {
          rBeep(.25, 700);
          rBeep(.35, 400);
        }
    }
  else
    {
      int count;
      for(count=0; count<4; count++)
        {
          rForward(10, 1);
          rTurnRight(10, 1);
        }
    }
  return;
}
        
/*
Pre-conditions:
    The scribbler cart is connected
    Obstacle is an integer
Post-conditions:
    Car will move forward until there is an obstacle infront of it, in which  it will terminate the dance.
*/

void forwardDance (int *obstacle)  /* Dance #5, if there is an obstacle in front of the robot, it will beep. Otherwise, the robot will continue moving forward until it encounters an
obstacle, in which case the dance will end. Function uses pass-by-reference parameter in *obstacle */
{
  int count=0;
  int barrier=0;
  while(barrier==0 && count<10)
    {
      if (rGetIRTxt("left")==1 || rGetIRTxt("right") ==1 )
        {
          barrier=1;
          *obstacle=1; 
          rBeep(.5,2000);
        } 
      else
        {
          *obstacle=0;
        } 
      rForward(10, .5);
      count++;
    }
}


/*
Pre-conditions:
    The scribbler cart is connected
Post-conditions:
    Randomly choose a dance to do, then once the dance is terminated, it will randomly choose another one. 
*/

int main () /* Random Dance function */
{  
  int count;
  int movementList[5];

  rConnect("/dev/rfcomm0");

  rSetForwardnessTxt ("scribbler-forward"); /* sets forwardness of robot */

  int obstacle=0;

  while (1)
    {
      int random=rand() % 5 + 1;   /* calls random number between 0 and 5 */
      printf("Dance=%d\n",random); /* prints dance that robot performs */
      switch(random)
        {
        case 1:                    /* calls twirl function */
          twirl();
          break;
        case 2:                    /* calls randomDance function */
          for(count=0;count<5;count++)
            {
              movementList[count]=rand() % 5; /*random length-array generator*/
            }
          randomDance(movementList,5);  /* movmentList passed through array*/
          break; 
        case 3:                   /* calls detectSurroundingsDance function */
          obstacle=detectSurroundingsDance();
          break;
        case 4:                   /* calls valueDance function */
          valueDance(obstacle);
          break;
        case 5:                   /*calls forwardDance function */
          forwardDance(&obstacle); /* function uses pass-by-value parameter */
          break;
        default:
          break;
        }
    }
  rDisconnect();
  return 0;
}
