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

int main ()
{
  rConnect ("/dev/rfcomm0");

  
  rBeep (0.125, pitchE4);
  rBeep (0.125, pitchFs4);

  rBeep (0.25, pitchG4);
  rBeep (0.5, pitchFs4);
  rBeep (0.125, pitchFs4);
  rBeep (0.125, pitchG4);

  rBeep (0.25, pitchA4);
  rBeep (0.5, pitchG4);
  rBeep (0.125, pitchG4);
  rBeep (0.125, pitchA4);

  rBeep (0.25, pitchB4);
  rBeep (0.75, pitchAs4);

  rBeep (1.125, pitchB4);



  rBeep (0.125, pitchE4);
  rBeep (0.125, pitchFs4);

  rBeep (0.25, pitchG4);
  rBeep (0.5, pitchFs4);
  rBeep (0.125, pitchFs4);
  rBeep (0.125, pitchG4);

  rBeep (0.25, pitchA4);
  rBeep (0.5, pitchG4);
  rBeep (0.125, pitchG4);
  rBeep (0.125, pitchA4);

  rBeep (0.25, pitchB4);
  rBeep (0.5, pitchA4);
  rBeep (0.25, pitchG4);

  rBeep (1.125, pitchE4);
  rBeep (0.625, 0);

  rBeep (0.0625, pitchB5); //B
  rBeep (0.0625, pitchE6); //E
  rBeep (0.0625, pitchD6); //D
  rBeep (0.0625, pitchB5);

  rBeep (0.25, pitchD6); //D
  rBeep2 (0.125, pitchCs6, pitchE5); //C#, E
  rBeep (0.375, pitchE5);
  rBeep (0.0625, pitchFs6); //F#
  rBeep (0.0625, pitchE6); //E
  rBeep (0.0625, pitchE6); //E
  rBeep (0.0625, pitchE6); //E

  rBeep (0.0625, pitchG6); //G
  rBeep (0.0625, pitchFs6); //F#
  rBeep (0.0625, pitchFs6);
  rBeep (0.0625, pitchFs6);
  rBeep (0.0625, pitchB5); //B
  rBeep (0.0625, pitchAs5); //A#
  rBeep (0.0625, pitchAs5); 
  rBeep (0.0625, pitchAs5); 
  rBeep (0.0625, pitchCs6); //C#
  rBeep (0.0625, pitchB5); //B
  rBeep (0.0625, pitchB5); 
  rBeep (0.0625, pitchB5); 
  rBeep (0.0625, pitchFs5); //F#
  rBeep (0.0625, pitchE5); //E
  rBeep (0.0625, pitchE5); 
  rBeep (0.0625, pitchE5); 

  rBeep (0.0625, pitchG5); //G
  rBeep (0.0625, pitchFs5); //F#
  rBeep (0.0625, pitchE5); //E
  rBeep (0.0625, pitchD5); //D
  rBeep (0.0625, pitchCs5); //C#
  rBeep (0.0625, pitchD5); //D
  rBeep (0.0625, pitchCs5); //C#
  rBeep (0.0625, pitchB4); //B
  rBeep (0.0625, pitchAs4); //A#

  rBeep2 (0.0625, pitchAs4, pitchFs5); //A#, F#
  rBeep (0.0625, pitchGs5); //G#
  rBeep (0.0625, pitchAs5); //A#
  rBeep (0.125, pitchB5); //B
  rBeep (0.125, pitchCs6); //C#

  rBeep2 (0.25, pitchD6, pitchGs5); //D, G#
  rBeep2 (0.125, pitchCs6, pitchAs5); //C#, A#
  rBeep (0.375, pitchE4); //E
  rBeep2 (0.0625, pitchE4, pitchB5); //E, B
  rBeep (0.0625, pitchE6); //E
  rBeep (0.0625, pitchD6); //D
  rBeep (0.0625, pitchB5); //B

  rBeep2 (0.25, pitchD6, pitchGs5); //D, G#
  rBeep2 (0.125, pitchCs6, pitchAs5); //C#, A#
  rBeep (0.375, 0);
  rBeep (0.0625, pitchFs5);
  rBeep (0.0625, pitchE5);
  rBeep2 (0.0625, pitchE5, pitchG4);
  rBeep2 (0.0625, pitchE5, pitchG4);



  rBeep (0.0625, pitchG6);
  rBeep (0.0625, pitchFs6);
  rBeep2 (0.0625, pitchFs6, pitchFs5);
  rBeep2 (0.0625, pitchFs6, pitchFs5);
  rBeep (0.0625, pitchB6);
  rBeep (0.0625, pitchD6);
  rBeep2 (0.0625, pitchD6, pitchE5);
  rBeep2 (0.0625, pitchD6, pitchE5);
  rBeep (0.0625, pitchD6);
  rBeep (0.0625, pitchCs6);
  rBeep2 (0.0625, pitchCs6, pitchE5);
  rBeep2 (0.0625, pitchCs6, pitchE5);
  rBeep (0.0625, pitchA6);
  rBeep (0.0625, pitchC6);
  rBeep2 (0.0625, pitchC6, pitchD5);
  rBeep2 (0.0625, pitchC6, pitchD5);

  rBeep (0.0625, pitchC6);
  rBeep (0.0625, pitchB5);
  rBeep2 (0.0625, pitchB5, pitchD5);
  rBeep2 (0.0625, pitchB5, pitchD5);
  rBeep (0.0625, pitchG6);
  rBeep (0.0625, pitchFs6);
  rBeep2 (0.0625, pitchE6, pitchG5);
  rBeep2 (0.0625, pitchD6, pitchG5);
  rBeep2 (0.0625, pitchCs6, pitchG5);
  rBeep2 (0.0625, pitchB5, pitchG5);
  rBeep (0.0625, pitchA5);
  rBeep (0.0625, pitchG5);
  rBeep (0.0625, pitchE6);
  rBeep (0.0625, pitchD6);
  rBeep2 (0.0625, pitchCs6, pitchE5);
  rBeep2 (0.0625, pitchB5, pitchE5);

  rBeep2 (0.0625, pitchA5, pitchE5);
  rBeep2 (0.0625, pitchG5, pitchE5);
  rBeep (0.0625, pitchFs5);
  rBeep (0.0625, pitchE5);
  rBeep (0.0625, pitchE6);
  rBeep (0.0625, pitchD6);
  rBeep2 (0.0625, pitchCs6, pitchG4);
  rBeep2 (0.0625, pitchB5, pitchG4);
  rBeep2 (0.0625, pitchA5, pitchG4);
  rBeep2 (0.0625, pitchG5, pitchG4);
  rBeep2 (0.0625, pitchFs5, pitchE4);
  rBeep2 (0.0625, pitchE5, pitchE4);
  rBeep2 (0.0625, pitchE5, pitchE4);
  rBeep2 (0.0625, pitchD5, pitchE4);
  rBeep2 (0.0625, pitchCs5, pitchG4);
  rBeep2 (0.0625, pitchB4, pitchG4);

  rBeep2 (0.0625, pitchA4, pitchE4);
  rBeep2 (0.0625, pitchG4, pitchE4);
  rBeep2 (0.0625, pitchFs4, pitchB4);
  rBeep2 (0.0625, pitchE4, pitchB4);
  rBeep2 (0.0625, pitchD4, pitchE4);
  rBeep2 (0.0625, pitchCs4, pitchE4);
  rBeep2 (0.0625, pitchE4, pitchE4);
  rBeep2 (0.0625, pitchD4, pitchE4);
  rBeep2 (0.0625, pitchCs4, pitchE4);
  rBeep2 (0.0625, pitchD4, pitchE4);
  rBeep (0.0625, pitchCs4);
  rBeep (0.0625, pitchB4);
  rBeep (0.0625, pitchB4);
  rBeep (0.0625, pitchB4);
  rBeep (0.0625, pitchB4);
  rBeep (0.0625, pitchB4);

  rBeep (0.0625, pitchB4);
  rBeep (0.0625, pitchB4);
  rBeep (0.0625, pitchB4);
  rBeep (0.0625, pitchB4);
  rBeep2 (0.0625, pitchB4, pitchB5);
  rBeep2 (0.0625, pitchB4, pitchB5);
  rBeep2 (0.0625, pitchB4, pitchCs6);
  rBeep2 (0.0625, pitchB4, pitchCs6);

  rBeep2 (0.0625, pitchB4, pitchD6);
  rBeep2 (0.0625, pitchB4, pitchD6);
  rBeep2 (0.0625, pitchB4, pitchD6);
  rBeep2 (0.0625, pitchB4, pitchD6);
  rBeep2 (0.0625, pitchB4, pitchCs6);
  rBeep2 (0.0625, pitchAs4, pitchCs6);
  rBeep (0.0625, pitchB4);
  rBeep (0.0625, pitchCs5);
  rBeep (0.0625, pitchE5);
  rBeep (0.0625, pitchD5);
  rBeep (0.0625, pitchCs5);
  rBeep (0.0625, pitchB4);
  rBeep2 (0.0625, pitchB4, pitchB5);
  rBeep2 (0.0625, pitchB4, pitchE6);
  rBeep2 (0.0625, pitchB4, pitchD6);
  rBeep2 (0.0625, pitchB4, pitchB5);

  rBeep2 (0.0625, pitchB4, pitchD6);
  rBeep2 (0.0625, pitchB4, pitchD6);
  rBeep2 (0.0625, pitchB4, pitchD6);
  rBeep2 (0.0625, pitchB4, pitchD6);
  rBeep2 (0.0625, pitchB4, pitchG6);
  rBeep2 (0.0625, pitchAs4, pitchG6);
  rBeep (0.0625, pitchB4);
  rBeep (0.0625, pitchCs5);
  rBeep (0.0625, pitchE5);
  rBeep (0.0625, pitchD5);
  rBeep (0.0625, pitchCs5);
  rBeep (0.0625, pitchB4);
  rBeep2 (0.0625, pitchD6, pitchD5);
  rBeep2 (0.0625, pitchD6, pitchD5);
  rBeep2 (0.0625, pitchE6, pitchD5);
  rBeep2 (0.0625, pitchE6, pitchD5);

  rBeep2 (0.0625, pitchF6, pitchD5);
  rBeep2 (0.0625, pitchF6, pitchD5);
  rBeep2 (0.0625, pitchF6, pitchD5);
  rBeep2 (0.0625, pitchF6, pitchD5);
  rBeep2 (0.0625, pitchE6, pitchD5);
  rBeep2 (0.0625, pitchE6, pitchCs5);
  rBeep (0.0625, pitchD5);
  rBeep (0.0625, pitchE5);
  rBeep (0.0625, pitchG5);
  rBeep (0.0625, pitchF5);
  rBeep (0.0625, pitchE5);
  rBeep (0.0625, pitchD5);
  rBeep2 (0.0625, pitchD5, pitchD6);
  rBeep2 (0.0625, pitchD5, pitchG6);
  rBeep2 (0.0625, pitchD5, pitchF6);
  rBeep2 (0.0625, pitchD5, pitchD6);

  rBeep2 (0.0625, pitchF6, pitchD5);
  rBeep2 (0.0625, pitchF6, pitchD5);
  rBeep2 (0.0625, pitchF6, pitchD5);
  rBeep2 (0.0625, pitchF6, pitchD5);
  rBeep2 (0.0625, pitchE6, pitchD5);
  rBeep2 (0.0625, pitchE6, pitchCs5);
  rBeep (0.0625, pitchD5);
  rBeep (0.0625, pitchE5);
  rBeep (0.0625, pitchG5);
  rBeep (0.0625, pitchF5);
  rBeep (0.0625, pitchE5);
  rBeep (0.0625, pitchD5);
  rBeep2 (0.0625, pitchF5, pitchAs5);
  rBeep2 (0.0625, pitchF5, pitchAs5);
  rBeep2 (0.0625, pitchF5, pitchA5);
  rBeep2 (0.0625, pitchF5, pitchA5);

rBeep2 (0.0625, pitchF5, pitchGs6);
  rBeep2 (0.0625, pitchF5, pitchGs6);
  rBeep2 (0.0625, pitchF5, pitchG6);
  rBeep2 (0.0625, pitchF5, pitchG6);
rBeep2 (0.0625, pitchF5, pitchF6);
  rBeep2 (0.0625, pitchF5, pitchAs6);
  rBeep2 (0.0625, pitchF5, pitchGs6);
  rBeep2 (0.0625, pitchF5, pitchF6);
rBeep2 (0.0625, pitchF5, pitchGs6);
  rBeep2 (0.0625, pitchF5, pitchGs6);
  rBeep2 (0.0625, pitchF5, pitchG6);
  rBeep2 (0.0625, pitchF5, pitchG6);
rBeep2 (0.0625, pitchGs5, pitchGs6);
  rBeep2 (0.0625, pitchGs5, pitchGs6);
  rBeep2 (0.0625, pitchGs5, pitchAs6);
  rBeep2 (0.0625, pitchGs5, pitchAs6);

  rBeep2 (0.0625, pitchGs5, pitchB6);
  rBeep2 (0.0625, pitchGs5, pitchB6);
  rBeep2 (0.0625, pitchGs5, pitchAs6);
  rBeep2 (0.0625, pitchGs5, pitchAs6);
  rBeep2 (0.0625, pitchGs5, pitchGs6);
  rBeep2 (0.0625, pitchGs5, pitchCs7);
  rBeep2 (0.0625, pitchGs5, pitchB6);
  rBeep2 (0.0625, pitchGs5, pitchGs6);
  rBeep2 (0.0625, pitchGs5, pitchB6);
  rBeep2 (0.0625, pitchGs5, pitchB6);
  rBeep2 (0.0625, pitchGs5, pitchAs6);
  rBeep2 (0.0625, pitchGs5, pitchAs6);
  rBeep2 (0.0625, pitchB5, pitchB6);
  rBeep2 (0.0625, pitchB5, pitchB6);
  rBeep2 (0.0625, pitchB5, pitchCs7);
  rBeep2 (0.0625, pitchB5, pitchCs7);

  //to second section on page 4

rBeep2 (0.0625, pitchD6, pitchFs5);
  rBeep2 (0.0625, pitchCs6, pitchFs5);
  rBeep (0.0625, pitchD6);
  rBeep (0.0625, pitchCs6);
rBeep2 (0.0625, pitchE6, pitchFs5);
  rBeep2 (0.0625, pitchD6, pitchFs5);
  rBeep (0.0625, pitchE6);
  rBeep (0.0625, pitchD6);
rBeep2 (0.0625, pitchFs6, pitchD5);
  rBeep2 (0.0625, pitchE6, pitchD5);
  rBeep (0.0625, pitchFs6);
  rBeep (0.0625, pitchE6);
rBeep2 (0.0625, pitchG6, pitchD6);
  rBeep2 (0.0625, pitchFs6, pitchD6);
  rBeep (0.0625, pitchG6);
  rBeep (0.0625, pitchFs6);

rBeep2 (0.0625, pitchB6, pitchD6);
  rBeep2 (0.0625, pitchAs6, pitchD6);
  rBeep2 (0.0625, pitchCs7, pitchFs6);
  rBeep2 (0.0625, pitchB6, pitchFs6);
rBeep2 (0.0625, pitchD7, pitchB6);
  rBeep2 (0.0625, pitchCs7, pitchB6);
  rBeep2 (0.0625, pitchE7, pitchD7);
  rBeep2 (0.0625, pitchD7, pitchD7);
rBeep2 (1, pitchF7, pitchD7);

rBeep2 (0.0625, pitchF7, pitchD7);
  rBeep2 (0.0625, pitchE7, pitchCs7);
  rBeep2 (0.0625, pitchD7, pitchB6);
  rBeep2 (0.0625, pitchCs7, pitchA6);
rBeep2 (0.0625, pitchB6, pitchG6);
  rBeep2 (0.0625, pitchA6, pitchFs6);
  rBeep2 (0.0625, pitchG6, pitchE6);
  rBeep2 (0.0625, pitchFs6, pitchD6);
rBeep2 (1, pitchCs6, pitchE6);




rBeep2 (0.0625, pitchCs6, pitchE6);
  rBeep2 (0.0625, pitchCs6, pitchE6);
  rBeep2 (0.0625, pitchB5, pitchD6);
  rBeep2 (0.0625, pitchAs5, pitchCs6);
rBeep2 (0.0625, pitchG5, pitchB5);
  rBeep2 (0.0625, pitchFs5, pitchAs5);
  rBeep2 (0.0625, pitchE5, pitchG5);
  rBeep2 (0.0625, pitchD5, pitchFs5);
rBeep2 (1, pitchCs5, pitchE5);


/*
rBeep2 (0.0625, pitchE5, pitchCs5);
  rBeep2 (0.0625, pitchE5, pitchCs5);
  rBeep2 (0.0625, pitchD5, pitchB4);
  rBeep2 (0.0625, pitchCs5, pitchA4);
rBeep2 (0.0625, pitchB4, pitchG4);
  rBeep2 (0.0625, pitchA4, pitchFs4);
  rBeep2 (0.0625, pitchG4, pitchE4);
  rBeep2 (0.0625, pitchFs4, pitchD4);
rBeep2 (1, pitchB4, pitchDs5);

*/

rBeep2 (0.0625, pitchE5, pitchCs5);
  rBeep2 (0.0625, pitchE5, pitchCs5);
  rBeep2 (0.0625, pitchD5, pitchB4);
  rBeep2 (0.0625, pitchCs5, pitchA4);
rBeep2 (0.0625, pitchB4, pitchG4);
  rBeep2 (0.0625, pitchA4, pitchFs4);
  rBeep2 (0.0625, pitchG4, pitchE4);
  rBeep2 (0.0625, pitchFs4, pitchD4);
rBeep2 (2, pitchB4, pitchFs5);

/*


rBeep2 (0.0625, pitchE5, pitchCs5);
  rBeep2 (0.0625, pitchE5, pitchCs5);
  rBeep2 (0.0625, pitchD5, pitchB4);
  rBeep2 (0.0625, pitchCs5, pitchA4);
rBeep2 (0.0625, pitchB4, pitchG4);
  rBeep2 (0.0625, pitchA4, pitchFs4);
  rBeep2 (0.0625, pitchG4, pitchE4);
  rBeep2 (0.0625, pitchFs4, pitchD4);
rBeep2 (2, pitchB4, pitchGs5);

*/

  rDisconnect ();

  return 0;
}
