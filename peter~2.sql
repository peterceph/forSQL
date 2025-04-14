
-------------------------------LOOP----------------------------------------------


-- IF THEN ELSIF LOOP    
      
      
           DECLARE
           STID NUMBER ;
           NAME VARCHAR2(50) := 'JOHN DOE';
           MARKS NUMBER;
           GRADE VARCHAR2(10);
           
           MINMARKS NUMBER := 0;
           MAXMARKS NUMBER := 100;
           LWBOUND NUMBER := 90;
           UPBOUND1 NUMBER := 89;
           LWBOUND1 NUMBER := 80;
           UPBOUND2 NUMBER := 79;
           LWBOUND2 NUMBER := 70;
           UPBOUND3 NUMBER := 69;
           LWBOUND3 NUMBER := 60;
           
           INVALID EXCEPTION;
           
BEGIN           
           
           STID := &STID;
           NAME := '&NAME';
           MARKS := &MARKS;

        
           
           IF MARKS < MINMARKS OR MARKS > MAXMARKS THEN
                RAISE INVALID;
           ELSIF MARKS BETWEEN LWBOUND AND MAXMARKS THEN 
                GRADE := 'A+';
           ELSIF MARKS BETWEEN LWBOUND1 AND UPBOUND1 THEN 
                GRADE := 'A';
           ELSIF MARKS BETWEEN LWBOUND2 AND UPBOUND2 THEN 
                 GRADE  := 'B'; 
           ELSIF MARKS BETWEEN LWBOUND3 AND UPBOUND3 THEN 
                GRADE := 'C';
           ELSE 
                GRADE := 'FAIL';
           END IF;
           
           INSERT INTO STUDENT_MARKS(STID, NAME, MARKS, GRADE)
           VALUES(STID, NAME, MARKS, GRADE);
           
           COMMIT;
           
           DBMS_OUTPUT.PUT_LINE('STID: '|| STID);
           DBMS_OUTPUT.PUT_LINE('NAME: '|| NAME);
           DBMS_OUTPUT.PUT_LINE('MAKRS: '|| MARKS);
           DBMS_OUTPUT.PUT_LINE('GRADE: '|| GRADE);
           
 EXCEPTION 
           WHEN VALUE_ERROR THEN
           DBMS_OUTPUT.PUT_LINE('NOT A VALID NUMBER');
           WHEN INVALID THEN
           DBMS_OUTPUT.PUT_LINE('ENTER A VALID MARK');
           
END;
/



--Loop------------------------------------------------------------------------------

SELECT * FROM STUDENT_MARKS



DECLARE 
NUM1 NUMBER;
NUM2 NUMBER;
SQR NUMBER;

BEGIN

    NUM1 := '&LOWERNUMBER';
    NUM2 := '&HIGHERNUMBER';
    
     
       WHILE NUM1 < NUM2 LOOP
        IF MOD(NUM1, 2) = 0 THEN
            SQR := NUM1 * NUM1;
            DBMS_OUTPUT.PUT_LINE('SQUARE OF  '|| NUM1 ||' IS '||SQR);
        END IF;
      NUM1 := NUM1 + 1;
    END LOOP;
    
   EXCEPTION
     WHEN VALUE_ERROR THEN
         DBMS_OUTPUT.PUT_LINE ('INPUT MUST BE A NUMBER');
END;
/


   -- FOR LOOP-------------------------------------------------------------------------

DECLARE 
NUM1 NUMBER;
NUM2 NUMBER;
SQR NUMBER;

BEGIN

    NUM1 := '&LOWERNUMBER';
    NUM2 := '&HIGHERNUMBER';
    
     
FOR N IN NUM1..NUM2 LOOP
        IF MOD(N, 2) = 0 THEN
            SQR := N * N;
            DBMS_OUTPUT.PUT_LINE('SQUARE OF  '|| N ||' IS '||SQR);
        END IF;
    END LOOP;
    
   EXCEPTION
     WHEN VALUE_ERROR THEN
         DBMS_OUTPUT.PUT_LINE ('INPUT MUST BE A NUMBER');
END;
/


----WHILE LOOP------------------------------------------------------------------

---WHILE LOOP

DECLARE 
NUM1 NUMBER;
NUM2 NUMBER;
SQR NUMBER;

BEGIN

    NUM1 := '&LOWERNUMBER';
    NUM2 := '&HIGHERNUMBER';
    
     
       WHILE NUM1 < NUM2 LOOP
        IF MOD(NUM1, 2) = 0 THEN
            SQR := NUM1 * NUM1;
            DBMS_OUTPUT.PUT_LINE('SQUARE OF  '|| NUM1 ||' IS '||SQR);
        END IF;
      NUM1 := NUM1 + 1;
    END LOOP;
    
   EXCEPTION
   WHEN VALUE_ERROR THEN
   DBMS_OUTPUT.PUT_LINE ('INPUT MUST BE A NUMBER');
END;
/


-----CASE-----------------------------------------------------------------------------

DECLARE 

DAYNUM NUMBER(1);
ERR EXCEPTION;

 BEGIN
 
 DAYNUM := '&DAYNUM';
 
-- IF DAYNUM < 1 OR DAYNUM > 7 THEN
-- RAISE ERR;
-- END IF;
 CASE DAYNUM
 WHEN 1 THEN
    DBMS_OUTPUT.PUT_LINE('IT IS SUNDAY: WEEKLY OFF');
 WHEN 2 THEN   
    DBMS_OUTPUT.PUT_LINE('IT IS MONDAY:  FULL DAY');
 WHEN 3 THEN
    DBMS_OUTPUT.PUT_LINE('IT IS TUESDAY: FULL DAY');
 WHEN 4 THEN
    DBMS_OUTPUT.PUT_LINE('IT IS WEDNESDAY: FULL DAY');
 WHEN 5 THEN
    DBMS_OUTPUT.PUT_LINE('IT IS THURSDAY: FULL DAY');
 WHEN 6 THEN
    DBMS_OUTPUT.PUT_LINE('IT IS FRIDAY: FULL DAY');
 WHEN 7 THEN
    DBMS_OUTPUT.PUT_LINE('IT IS SATURDAY: WEEKLY OFF');
  ELSE
     RAISE ERR;

 END CASE;
 
 EXCEPTION
 WHEN ERR THEN
     DBMS_OUTPUT.PUT_LINE('NUMERIC WEEK DAY 1 TO 7 ONLY ACCEPTED');
 WHEN VALUE_ERROR THEN
     DBMS_OUTPUT.PUT_LINE('INVALID INPUT, OUT OF RANGE');
 END;
 /


   





 