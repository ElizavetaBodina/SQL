--department report
SELECT 
 CASE WHEN E.EMPLOYEE_ID IS NULL 
 THEN ' ' ELSE TO_CHAR(R.rownumber) END AS "����� �/�", -- the serial number of the employee
 
 CASE WHEN E.EMPLOYEE_ID IS NULL AND D.DEPARTMENT_NAME IS NOT NULL
 THEN '���-�� ����������� � ������' -- counting the number of employees in the department
 WHEN E.EMPLOYEE_ID IS NULL AND D.DEPARTMENT_NAME IS NULL
 THEN '����� ���-�� ����������� � �������' -- total number of employees
 ELSE TO_CHAR(D.DEPARTMENT_ID) END AS "������������� ������",
 
 NVL(D.DEPARTMENT_NAME, ' ') AS "�������� ������", 

 CASE WHEN E.EMPLOYEE_ID IS NULL
 THEN TO_CHAR(COUNT(E.EMPLOYEE_ID))
 ELSE E.FIRST_NAME || ' ' || E.LAST_NAME END AS "���������"
 
 FROM EMPLOYEES E JOIN DEPARTMENTS D ON(D.DEPARTMENT_ID = E.DEPARTMENT_ID) JOIN ( SELECT EMPLOYEE_ID,  ROWNUM AS rownumber FROM (
 SELECT EMPLOYEE_ID FROM EMPLOYEES JOIN DEPARTMENTS USING (DEPARTMENT_ID)  ORDER BY DEPARTMENT_NAME, FIRST_NAME, LAST_NAME)) R ON (E.EMPLOYEE_ID = R.EMPLOYEE_ID)
 
 GROUP BY ROLLUP((D.DEPARTMENT_NAME, D.DEPARTMENT_ID),(E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, R.rownumber))
 ORDER BY D.DEPARTMENT_NAME, E.FIRST_NAME, E.LAST_NAME;

