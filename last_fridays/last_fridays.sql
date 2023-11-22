--dates of the last Fridays of the four leap years closest to the specified date
DEFINE STR = TO_DATE('23.11.2023', 'DD.MM.SYYYY');
SELECT CASE 
WHEN TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) < -44  THEN
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(-44), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(-40), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(-36), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(-32), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') 
WHEN MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 100) = 0  AND  MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 400)<> 0 THEN
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + 4), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 4), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + 8), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 8), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY')
WHEN TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) >= 9996  THEN
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) -4 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 8 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 16 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') 
WHEN TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) BETWEEN 9993 AND 9995  THEN
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 4 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 8 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') 
WHEN TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) BETWEEN -43 AND -41  THEN
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + 4 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + 8 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') 
WHEN MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4) = 0  AND  TO_NUMBER(TO_CHAR(&STR, 'MM')) > 6  THEN
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY'))), ' DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + 4), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 4), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + 8), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') 
WHEN MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4) = 0  AND  TO_NUMBER(TO_CHAR(&STR, 'MM')) <= 6 THEN
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY'))), ' DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + 4), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 4), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 8), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') 
ELSE TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) - 4 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY'))  - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + 4 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY') ||', '||
TO_CHAR(NEXT_DAY(TO_DATE('24.12.'||TO_CHAR(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')) + 8 - MOD(TO_NUMBER(TO_CHAR(&STR, 'SYYYY')), 4)), 'DD.MM.SYYYY'), '�������'), 'DD-Mon-SYYYY')  END AS DATES
FROM DUAL;


