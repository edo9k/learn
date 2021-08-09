          IDENTIFICATION DIVISION.
          PROGRAM-ID. user-input.
          AUTHOR. edo9k.
          
          DATA DIVISION.
          WORKING-STORAGE SECTION.
          01 USERNAME.
          02 NAME PIC X(10).

          PROCEDURE DIVISION.

          DISPLAY "WHAT IS YOUR NAME?".
          ACCEPT USERNAME.
          DISPLAY "IT IS NICE TO MEET YOU" SPACE NAME.
          STOP RUN.
