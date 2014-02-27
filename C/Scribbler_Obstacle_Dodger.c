// Yazan Kittaneh               
// Charlie Gao


// We tested the program by compiling it and testing the Scribbler 2 Robot
// wtihin an enclosed area, observing if the robot hit any walls. We gave
// the Scribbler instructions to beep once for every turn, giving us a longer
// beep for the turn resulting from two of the same tuns, and beeping twice
// when it would dance. With audible alerts, we could monitor and count each 
// action and see if it matched our expectations. We complied with no errors, 
// and we observed the robot react to every obstical and avoid it, leading us
// to believe that our result meets all specifications of the project. 

#include "MyroC.h"
#include <stdio.h>
#include <string.h>
#include "eSpeakPackage.h"

int main()
{

  eSpeakConnect ();
  rConnect ("/dev/rfcomm0");
  eSpeakSetGender ("male");

 
  int rightTurnCounter;             
  int leftTurnCounter;                
  int actionCounter;                
  int danceCounter;
  int danceLeftTurnCounter;
  int danceRightTurnCounter;
  int obstacleLeft;
  int obstacleRight;


  rightTurnCounter = 0;
  leftTurnCounter = 0;
  actionCounter = 0;

  
  while(1)       ////Continuous loop
    {
      if(rightTurnCounter == 2 || leftTurnCounter == 2)   ////checking for turns
        {
          rBeep(0.5,2000);
          eSpeakTalk ("Turn right");  
          rTurnRight(10,2);
          rightTurnCounter = 0;
          leftTurnCounter = 0;
        }

      obstacleLeft = rGetObstacleTxt("left");      ///obsticals to the left
      obstacleRight = rGetObstacleTxt("right");    ///obsticals to the right
      if(obstacleLeft)
        {
          eSpeakTalk ("Turn right");
          rTurnRight(10,1);
          rightTurnCounter++;
          leftTurnCounter = 0;
        }
      else if(obstacleRight)
        {
          eSpeakTalk ("Turn left");
          rTurnLeft(10,1);
          leftTurnCounter++;
          rightTurnCounter = 0;
        }
      else
        {
          eSpeakTalk ("Go forward");
          rForward(10,1);
        } 
      
      actionCounter++;
     
      if(actionCounter >= 10)   
        {
          eSpeakTalk ("Dance");     ////Dance
          for (danceCounter = 0; danceCounter <= 3; danceCounter++)
            {

              rBeep (1, 1500);
              rBeep (1, 1500);


              for (danceLeftTurnCounter = 0; danceLeftTurnCounter < 1; danceLeftTurnCounter++)
                {
                  rTurnLeft (30, 3);
                }
              for (danceRightTurnCounter = 0; danceRightTurnCounter < 1; danceRightTurnCounter++)
                {
                  rTurnRight (30, 3);
                }
            }
          actionCounter = 0;
        }
    }

  eSpeakdisconnect ();
  rDisconnect();
  return 0;
}
