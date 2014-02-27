#include <stdio.h>
#include "MyroC.h"


const int pitchC4 = 262;
const int pitchCs4 = 277;
const int pitchD4 = 294;
const int pitchDs4 = 311;
const int pitchE4 = 330;
const int pitchF4 = 349;
const int pitchFs4 = 370;
const int pitchG4 = 392;
const int pitchGs4 = 415;
const int pitchA4  = 440;
const int pitchBf4 = 466;
const int pitchAs4 = 466; 
const int pitchB4  = 494;
const int pitchC5  = 523;
const int pitchDf5 = 554;
const int pitchCs5 = 554; 
const int pitchD5  = 587;
const int pitchEf5 = 622;
const int pitchDs5 = 622;
const int pitchE5  = 659;
const int pitchF5  = 698;
const int pitchGf5 = 740;
const int pitchFs5 = 740; 
const int pitchG5  = 783;
const int pitchAf5 = 830;
const int pitchGs5 = 830;
const int pitchA5  = 880;
const int pitchBf5 = 932;
const int pitchAs5 = 932;
const int pitchB5  = 988;
const int pitchC6 = 1046;
const int pitchCs6 = 1109;
const int pitchD6 = 1175;
const int pitchDs6 = 1244;
const int pitchE6 = 1318;
const int pitchF6 = 1397;
const int pitchFs6 = 1480;
const int pitchG6 = 1568;
const int pitchGs6 = 1661;
const int pitchA6 = 1760;
const int pitchAs6 = 1865;
const int pitchB6 = 1975;
const int pitchC7 = 2093;
const int pitchCs7 = 2217;
const int pitchD7 = 2349;
const int pitchDs7 = 2489;
const int pitchE7 = 2637;
const int pitchF7 = 2794;
const int pitchB7 = 3951;

int main ()
{
  rConnect ("/dev/rfcomm0");

  //First four measures

  rBeep (0.5, pitchC6);
  rBeep (0.5, pitchG6);
  rBeep (0.5, pitchB6);
  rBeep (0.5, pitchFs6);

  rBeep (0.5, pitchC6);
  rBeep (0.5, pitchG6);
  rBeep (0.5, pitchB6);
  rBeep (0.5, pitchFs6);

  rBeep (0.5, pitchC6);
  rBeep (0.5, pitchG6);
  rBeep (0.5, pitchB6);
  rBeep (0.5, pitchFs6);

  rBeep (0.5, pitchC6);
  rBeep (0.5, pitchG6);
  rBeep (0.5, pitchB6);
  rBeep (0.5, pitchFs6);

  //start of lower

  rBeep2 (0.5, pitchC6, pitchG5);
  rBeep (0.5, pitchG6);
  rBeep2 (0.5, pitchB6, pitchG5);
  rBeep (0.5, pitchFs6);

  rBeep2 (0.5, pitchC6, pitchE5);
  rBeep (0.5, pitchG6);
  rBeep2 (0.5, pitchB6, pitchE5);
  rBeep (0.5, pitchFs6); 

  rBeep2 (0.5, pitchC6, pitchG5);
  rBeep2 (0.5, pitchG6, pitchF5);
  rBeep2 (0.5, pitchB6, pitchE5);
  rBeep2 (0.5, pitchFs6, pitchB5);

  rBeep2 (0.5, pitchC6, pitchC5);
  rBeep (0.5, pitchG6);
  rBeep2 (0.5, pitchB6, pitchC5);
  rBeep (0.5, pitchFs6);

  //number 2

  rBeep2 (0.5, pitchC6, pitchG5);
  rBeep (0.5, pitchG6);
  rBeep2 (0.5, pitchB6, pitchG5);
  rBeep (0.5, pitchFs6);

  rBeep2 (0.5, pitchC6, pitchE5);
  rBeep (0.5, pitchG6);
  rBeep2 (0.5, pitchB6, pitchE5);
  rBeep (0.5, pitchFs6);

 rBeep2 (0.5, pitchC6, pitchG5);
  rBeep2 (0.5, pitchG6, pitchF5);
  rBeep2 (0.5, pitchB6, pitchE5);
  rBeep2 (0.5, pitchFs6, pitchB5);

  rBeep2 (0.5, pitchC6, pitchC6);
  rBeep (0.5, pitchG6);
  rBeep2 (0.5, pitchB6, pitchC6);
  rBeep (0.5, pitchFs6);


  rDisconnect ();

  return 0;
}
