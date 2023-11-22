--В зависимости от конкретного числа вывести подходящее окончание: лет, или год, или года.
DEFINE zdate = TO_DATE('30.09.-0001', 'DD.MM.SYYYY')
SELECT &zdate "Заданная Дата", SYSDATE "Текущая Дата",

CASE
WHEN &zdate >= '01.01.0001' THEN
    CASE
        WHEN TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) = 0 THEN ''
        WHEN MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 10) = 1  AND MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 100) <> 11 THEN TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) || ' Год '
        WHEN MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 10) BETWEEN 2 AND 4  AND MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 100) NOT IN (12, 13, 14) THEN  TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) || ' Года '
        ELSE TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) || ' Лет '
    END
ELSE 
    CASE
        WHEN TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) = 0 THEN ''
        WHEN MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 10) = 1  AND MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 100) <> 11 THEN TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) - 1 || ' Год '
        WHEN MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 10) BETWEEN 2 AND 4  AND MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 100) NOT IN (12, 13, 14) THEN  TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) - 1 || ' Года '
        ELSE TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) - 1 || ' Лет ' 
        END
END
||
CASE
    WHEN TRUNC(MOD(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)),12)) = 0 THEN ''   
    ELSE TRUNC(MOD(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)),12)) || ' Мес '
END
||
CASE
WHEN &zdate <= SYSDATE THEN
    CASE
        WHEN TO_CHAR(&zdate, 'DD') < TO_CHAR(SYSDATE, 'DD') THEN   TO_CHAR(SYSDATE, 'DD') - TO_CHAR(&zdate, 'DD') || ' Дн '
        WHEN TO_CHAR(&zdate, 'DD') = TO_CHAR(SYSDATE, 'DD') THEN ''
        ELSE ADD_MONTHS(TO_DATE(TO_CHAR(SYSDATE,'DD.') || TO_CHAR(&zdate,'MM.SYYYY'),'DD.MM.SYYYY'), 1) - &zdate || ' Дн '
    END
ELSE 
    CASE
        WHEN TO_CHAR(&zdate, 'DD') > TO_CHAR(SYSDATE, 'DD') THEN   TO_CHAR(&zdate, 'DD') - TO_CHAR(SYSDATE, 'DD') || ' Дн '
        ELSE ROUND(ADD_MONTHS(TO_DATE(TO_CHAR(&zdate,'DD.') || TO_CHAR(SYSDATE,'MM.SYYYY'),'DD.MM.SYYYY'), 1) - SYSDATE) || ' Дн '
    END
END "Временной интервал"
FROM DUAL;