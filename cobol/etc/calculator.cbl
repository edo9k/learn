       
       IDENTIFICATION DIVISION.
       PROGRAM-ID. JUST-COBOL.
     
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 INPUTS PIC A(14).
       01 A PIC 9(7).
       01 OP PIC A(2).
       01 B PIC 9(15).
       01 RESULT PIC 9(8).
     
       PROCEDURE DIVISION.

                DISPLAY "Input: "
                ACCEPT INPUTS.
     
           	UNSTRING INPUTS DELIMITED BY SPACE
             		INTO A, OP, B           	
                END-UNSTRING.
     
           	IF OP = "+" THEN 
                        ADD A TO B GIVING RESULT.
     
                IF OP = "-" THEN 
                        SUBTRACT A FROM B GIVING RESULT.
     
                IF OP = "*" THEN 
                        MULTIPLY A BY B GIVING RESULT.
     
                IF OP = "/" THEN 
                        DIVIDE A BY B GIVING RESULT.
     
       		DISPLAY RESULT.
     
           	STOP RUN.
     
