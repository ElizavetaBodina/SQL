--� ����������� �� ����������� ����� ������� ���������� ���������: ���, ��� ���, ��� ����.
DEFINE zdate = TO_DATE('30.09.-0001', 'DD.MM.SYYYY')
SELECT &zdate "�������� ����", SYSDATE "������� ����",

CASE
WHEN &zdate >= '01.01.0001' THEN
    CASE
        WHEN TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) = 0 THEN ''
        WHEN MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 10) = 1  AND MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 100) <> 11 THEN TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) || ' ��� '
        WHEN MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 10) BETWEEN 2 AND 4  AND MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 100) NOT IN (12, 13, 14) THEN  TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) || ' ���� '
        ELSE TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) || ' ��� '
    END
ELSE 
    CASE
        WHEN TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) = 0 THEN ''
        WHEN MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 10) = 1  AND MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 100) <> 11 THEN TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) - 1 || ' ��� '
        WHEN MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 10) BETWEEN 2 AND 4  AND MOD(TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)), 100) NOT IN (12, 13, 14) THEN  TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) - 1 || ' ���� '
        ELSE TRUNC(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)/12)) - 1 || ' ��� ' 
        END
END
||
CASE
    WHEN TRUNC(MOD(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)),12)) = 0 THEN ''   
    ELSE TRUNC(MOD(ABS(MONTHS_BETWEEN(&zdate, SYSDATE)),12)) || ' ��� '
END
||
CASE
WHEN &zdate <= SYSDATE THEN
    CASE
        WHEN TO_CHAR(&zdate, 'DD') < TO_CHAR(SYSDATE, 'DD') THEN   TO_CHAR(SYSDATE, 'DD') - TO_CHAR(&zdate, 'DD') || ' �� '
        WHEN TO_CHAR(&zdate, 'DD') = TO_CHAR(SYSDATE, 'DD') THEN ''
        ELSE ADD_MONTHS(TO_DATE(TO_CHAR(SYSDATE,'DD.') || TO_CHAR(&zdate,'MM.SYYYY'),'DD.MM.SYYYY'), 1) - &zdate || ' �� '
    END
ELSE 
    CASE
        WHEN TO_CHAR(&zdate, 'DD') > TO_CHAR(SYSDATE, 'DD') THEN   TO_CHAR(&zdate, 'DD') - TO_CHAR(SYSDATE, 'DD') || ' �� '
        ELSE ROUND(ADD_MONTHS(TO_DATE(TO_CHAR(&zdate,'DD.') || TO_CHAR(SYSDATE,'MM.SYYYY'),'DD.MM.SYYYY'), 1) - SYSDATE) || ' �� '
    END
END "��������� ��������"
FROM DUAL;