--separation of "double" data
WITH T AS (
    SELECT           '1000 1100' AS code_operation, '841000 841100'  AS id_client FROM dual
    UNION ALL SELECT '2000'                       , '6700 8967 5500' FROM dual
),
search_reg (rn, cnt, part_act, part_code, code_operation, id_client) AS (
    SELECT TO_CHAR(ROWNUM) rn, 1 cnt, '' part_act, '' part_code, code_operation, id_client
    FROM T
    UNION ALL
    SELECT rn, cnt + 1, regexp_substr(code_operation,'\w+',1,cnt), regexp_substr(id_client,'\w+',1,cnt), code_operation, id_client
    FROM search_reg
    WHERE regexp_instr(code_operation,'\w+',1,cnt) <> 0 OR regexp_instr(id_client,'\w+',1,cnt) <> 0),
fin AS (
    SELECT rn, cnt, part_act, part_code, code_operation, id_client
    FROM search_reg
    ORDER BY rn, cnt) 
SELECT (CASE WHEN part_act IS NULL AND part_code IS NULL THEN rn
        ELSE ' ' END) AS rn, cnt - 1 AS cnt, nvl((CASE WHEN part_act IS NULL AND part_code IS NULL THEN code_operation
                                                          ELSE part_act END),' ') AS code_operation,
        nvl((CASE WHEN part_act IS NULL AND part_code IS NULL THEN id_client
             ELSE part_code END),' ') AS id_client
FROM fin;
MODEL:
WITH T AS (
    SELECT           '1000 1100' AS code_operation, '841000 841100'  AS id_client FROM dual
    UNION ALL SELECT '2000'                       , '6700 8967 5500' FROM dual
)
SELECT 
    CASE WHEN cnt = 0 THEN rn || ' '
        ELSE ' ' END RN,
    cnt,
    nvl(cur_code, ' ') AS code_operation,
    NVL(clid, ' ') AS ID_CLIENT
FROM(
SELECT 
    *
FROM 
    (
        SELECT 
            ROWNUM rn, 
            T.*
        FROM T
    )
MODEL 
    DIMENSION BY (rn, 0 AS cnt, code_operation, id_client)
    MEASURES(code_operation AS cur_code, id_client AS clid, 0 AS cur_row)
    RULES UPSERT ALL ITERATE (1000) 
    (      
        cur_code[ANY, iteration_number + 1, ANY, ANY] = regexp_substr(cur_code[cv(), 0, cv(), cv()], '\d+', 1, iteration_number + 1),
        clid[ANY, iteration_number + 1, ANY, ANY] = regexp_substr(clid[cv(), 0, cv(), cv()], '\d+', 1, iteration_number + 1)
    )
ORDER BY rn, cnt)
WHERE cur_code IS NOT NULL OR clid IS NOT NULL OR CNT = 0;