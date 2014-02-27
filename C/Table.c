#include <stdio.h>
    /*****************************************************************
     * Yazan Kittaneh                                                *
     * Box:  3832                                                    *
     * Supplemental Problem 2 for CSC 161                            *
     * Assignment for Wednesday, February 19                         *
     *****************************************************************/

    /* ***************************************************************
     * Academic honesty certification:                               *
     *   Written/online sources used:                                *
     *     [include textbook(s),                                     *
     *       CSC 161 labs or readings;                               *
     *       complete citations for Web or other written sources]    *
     *     [write "none" if no sources used]                         *
     *   Help obtained                                               *
     *     [indicate names of instructor, class mentors              *
     *      or evening lab tutors, consulted                         *
     *      according to class policy]                               *
     *     [write "none" if none of these sources used]              *
     *   My signature below confirms that the above list of sources  *
     *   is complete AND that I have not talked to anyone else       *
     *   [e.g., CSC 161 students] about the solution to this problem *
     *                                                               *
     *   Signature:   Yazan Kittaneh                                 *
     *****************************************************************/



double compute_mph(int min_time, int sec_time)   //Computing Miles per Hour
{
  /*
Pre-conditions:
min_time and sec_time are integers

Post-conditions:
compute_mph returns a double
compute_mph calculates the miles per hour using min_time and sec_time.
  */

  double min_to_sec = (min_time * 60);
  double total_sec = (min_to_sec + sec_time);
  return (.25)/(total_sec/3600);
}

double compute_kph(int min_time, int sec_time)  //Computing Kilometers per Hour
{
  /*
Pre-conditions:
min_time and sec_time are integers
compute_mph outputs an integer 

Post-conditions:
compute_kph returns a double
  */

  return (compute_mph(min_time, sec_time) * 1.60344);   //uses compute_mph

}



int main ()
{

  /*
Pre-conditions:
i and j are integers
compute_mph and compute_kph outout doubles

Post-conditions:
Main prints out a table

  */

  int i;
  int j;

  printf("\t \t \t \t Minutes\n");                           //Headings
  printf("Seconds\t 3\t \t 4\t \t 5\t \t 6\t \t 7\n");      //

  for(i = 0; i <= 60; i++)    //Telling it to loop 60 times
    {
      printf("%-7d ",i);      //Each time printing the second first
      for(j = 3; j <= 7; j++)    //In each second, loop 4 times
        {
          double an = compute_mph (j , i);   //calculating mph and kph
          double an2 = compute_kph(j, i);    //and printing them off in
          printf("%.1f/%.1f \t", an, an2);   //the loop
        }
      printf("\n");
    }
      

  /* used http://en.kioskea.net/faq/7392-multiplication-table-as-c-table as
     a reference to know how to format a table in c */

  return 0;
}


