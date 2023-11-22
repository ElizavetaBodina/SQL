-- calendar for a given month of a given year
WITH TEMP AS
(SELECT TO_DATE('02.-0084','MM.SYYYY')F_DATE FROM DUAL),
DD_LIST AS
(SELECT F_DATE, CASE WHEN (TO_CHAR(F_DATE, 'SYYYY') < -45 AND TO_CHAR(F_DATE, 'MM') = 02) OR TO_CHAR(F_DATE, 'SYYYY') = 9999   THEN
TO_CHAR(LAST_DAY(F_DATE) - 1,'DD') 
WHEN TO_CHAR(F_DATE, 'SYYYY') = -4712 THEN
TO_CHAR(LAST_DAY(F_DATE) - 1,'DD')
ELSE TO_CHAR(LAST_DAY(F_DATE),'DD') END L FROM TEMP)

SELECT CASE WHEN TO_CHAR(F_DATE, 'SYYYY') > 0 THEN
  (TO_CHAR(S,'fmDD'))
  || ' '
  || TO_CHAR(S,'fmMONTH','NLS_DATE_LANGUAGE=AMERICAN')
  || ' '
  || TO_CHAR(S,'SYYYY')
  || ' '
  || TO_CHAR(S,'fmday','NLS_DATE_LANGUAGE=AMERICAN') 
  ELSE
 (TO_CHAR(S,'fmDD'))
  || ' '
  || TO_CHAR(S,'fmMONTH','NLS_DATE_LANGUAGE=AMERICAN')
  || ' '
  || TO_CHAR(S,'SYYYY')
  || ' '
  || TO_CHAR(S - 5,'fmday','NLS_DATE_LANGUAGE=AMERICAN') 
  END "���������"
FROM
  (SELECT F_DATE, TRUNC(F_DATE,'MONTH')+ LEVEL - 1 S
  FROM DD_LIST
    START WITH LEVEL = 0
CONNECT BY LEVEL <= L);
