--the sum of digits in an arbitrary character string until the result is less than 10
WITH TMP AS (
  SELECT STR
  FROM (SELECT 't29h8n3m7l88g799999999999927' AS STR FROM dual)),
SUM_NUM (STR, SUM) AS (
  SELECT  STR, STR
  FROM TMP
  UNION ALL
  SELECT  STR,
      TO_CHAR(
          1 * REGEXP_COUNT(SUM, '1')
        + 2 * REGEXP_COUNT(SUM, '2')
        + 3 * REGEXP_COUNT(SUM, '3')
        + 4 * REGEXP_COUNT(SUM, '4')
        + 5 * REGEXP_COUNT(SUM, '5')
        + 6 * REGEXP_COUNT(SUM, '6')
        + 7 * REGEXP_COUNT(SUM, '7')
        + 8 * REGEXP_COUNT(SUM, '8')
        + 9 * REGEXP_COUNT(SUM, '9')
      )
  FROM SUM_NUM
  WHERE LENGTH(SUM) > 1
)
SELECT NVL(STR, ' ') AS "Исходная строка", NVL(TO_NUMBER(SUM), 0) AS "Результат"
FROM SUM_NUM
WHERE LENGTH(SUM) = 1;



