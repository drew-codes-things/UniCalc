       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATOR.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ARG-COUNT          PIC 9(2).
       01 ARG-INDEX          PIC 9(2).
       01 A-STR              PIC X(20).
       01 OP-STR             PIC X(20).
       01 B-STR              PIC X(20).
       01 A-NUM              PIC S9(10)V9(5).
       01 B-NUM              PIC S9(10)V9(5).
       01 RESULT-NUM         PIC S9(10)V9(5).
       01 RESULT-DISPLAY     PIC -(10)9.9(5).
       01 RESULT-INT-DISPLAY PIC -(10)9.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           ACCEPT ARG-COUNT FROM ARGUMENT-NUMBER.
           IF ARG-COUNT NOT = 3
               DISPLAY "Error: expected 3 arguments <a> <op> <b>"
               MOVE 1 TO RETURN-CODE
               STOP RUN
           END-IF.

           MOVE 1 TO ARG-INDEX.
           DISPLAY ARG-INDEX UPON ARGUMENT-NUMBER.
           ACCEPT A-STR FROM ARGUMENT-VALUE.

           MOVE 2 TO ARG-INDEX.
           DISPLAY ARG-INDEX UPON ARGUMENT-NUMBER.
           ACCEPT OP-STR FROM ARGUMENT-VALUE.

           MOVE 3 TO ARG-INDEX.
           DISPLAY ARG-INDEX UPON ARGUMENT-NUMBER.
           ACCEPT B-STR FROM ARGUMENT-VALUE.

           MOVE FUNCTION NUMVAL(A-STR) TO A-NUM.
           MOVE FUNCTION NUMVAL(B-STR) TO B-NUM.

           EVALUATE OP-STR
               WHEN "+"
                   COMPUTE RESULT-NUM = A-NUM + B-NUM
               WHEN "-"
                   COMPUTE RESULT-NUM = A-NUM - B-NUM
               WHEN "*"
                   COMPUTE RESULT-NUM = A-NUM * B-NUM
               WHEN "/"
                   IF B-NUM = 0
                       DISPLAY "Error: division by zero"
                       MOVE 1 TO RETURN-CODE
                       STOP RUN
                   END-IF
                   COMPUTE RESULT-NUM = A-NUM / B-NUM
               WHEN OTHER
                   DISPLAY "Error: unknown operator"
                   MOVE 1 TO RETURN-CODE
                   STOP RUN
           END-EVALUATE.

           IF RESULT-NUM = FUNCTION INTEGER(RESULT-NUM)
               MOVE RESULT-NUM TO RESULT-INT-DISPLAY
               DISPLAY FUNCTION TRIM(RESULT-INT-DISPLAY)
           ELSE
               MOVE RESULT-NUM TO RESULT-DISPLAY
               DISPLAY FUNCTION TRIM(RESULT-DISPLAY)
           END-IF.

           STOP RUN.
