-- information about CHECK constrations of scheme
WITH CHECK_CONS AS
(SELECT DISTINCT TABLE_NAME, CONSTRAINT_NAME, COLUMN_NAME, SEARCH_CONDITION_VC,
ROW_NUMBER() OVER (PARTITION BY TABLE_NAME, CONSTRAINT_NAME ORDER BY COLUMN_NAME) AS RN
FROM USER_CONS_COLUMNS NATURAL JOIN USER_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'C'
AND REGEXP_SUBSTR(SEARCH_CONDITION_VC, '.*IS NOT NULL') IS NULL),
RANK_TABLE AS
(SELECT DISTINCT  TABLE_NAME  "�������� �������", CONSTRAINT_NAME AS "��� �����������",
 LTRIM(SYS_CONNECT_BY_PATH(COLUMN_NAME, ', '), ', ') AS "�������, �������� � ����������",
SEARCH_CONDITION_VC AS "����������� CHECK",
ROW_NUMBER() OVER (PARTITION BY TABLE_NAME ORDER BY CONSTRAINT_NAME) AS R
FROM CHECK_CONS
WHERE CONNECT_BY_ISLEAF = 1
START WITH RN = 1
CONNECT BY PRIOR RN + 1 = RN AND PRIOR CONSTRAINT_NAME = CONSTRAINT_NAME AND PRIOR TABLE_NAME = TABLE_NAME)

SELECT CASE WHEN R = 1 THEN "�������� �������" ELSE ' ' END "�������� �������", "��� �����������", "�������, �������� � ����������", "����������� CHECK"
FROM RANK_TABLE;