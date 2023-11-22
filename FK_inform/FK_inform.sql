--Information on foreign keys
SELECT U1.CONSTRAINT_NAME FK_NAME, U1.TABLE_NAME FK_TABLE, U2.COLUMN_NAME FK_COL, U3.TABLE_NAME PK_TABLE, U3.COLUMN_NAME PK_COL

FROM USER_CONSTRAINTS U1 JOIN USER_CONS_COLUMNS U2 ON(U1.CONSTRAINT_NAME = U2.CONSTRAINT_NAME) JOIN USER_CONS_COLUMNS U3 ON(U1.R_CONSTRAINT_NAME = U3.CONSTRAINT_NAME)

WHERE U1.CONSTRAINT_TYPE = 'R'

ORDER BY FK_TABLE, FK_NAME, FK_COL;
