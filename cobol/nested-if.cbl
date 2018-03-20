       IDENTIFICATION DIVISION.
       AUTHOR. edo9k.
       PROGRAM-ID. Nested-If. 

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A PIC 99.
       01 B PIC 99.
       01 RESULT PIC 9999.
       01 FORMATTED PIC Z(9).

       PROCEDURE DIVISION.
       
       DISPLAY "ENTER THE FIRST VALUE: ".
       ACCEPT A.
       DISPLAY "YOU ENTERED ", A " AS A VALUE.".
       DISPLAY "PLEASE ENTER THE SECOND VALUE: ".
       ACCEPT B.
       DISPLAY "YOU ENTERED ", B " AS A SECOND VALUE.".

       COMPUTE RESULT = A + B.
       IF (A < 10) AND (B > 10) THEN
          IF RESULT > 50 THEN
              DISPLAY "RESULT IS BIGGER THAN 50."
          ELSE 
              MOVE RESULT TO FORMATTED
              DISPLAY FORMATTED
          END-IF
       ELSE DISPLAY "WHATEVER."
       END-IF

       STOP RUN.


       

