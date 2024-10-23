-- batch only query
DECLARE @TableVar TABLE (ID INT, Name VARCHAR(50));
INSERT INTO @TableVar VALUES (1, 'TableVar');
SELECT * FROM @TableVar;

-- if we select here, it won't work
SELECT * FROM @TableVar;

-- create local and global temp tables, insert data into them
CREATE TABLE #LocalTempTable (ID INT, Name VARCHAR(50));
CREATE TABLE ##GlobalTempTable (ID INT, Name VARCHAR(50));
INSERT INTO #LocalTempTable VALUES (1, 'LocalTempTable');
INSERT INTO ##GlobalTempTable VALUES (1, 'GlobalTempTable');
SELECT * FROM #LocalTempTable;
SELECT * FROM ##GlobalTempTable;

-- we can still select here
SELECT * FROM #LocalTempTable;
SELECT * FROM ##GlobalTempTable;

-- check existence of temp tables in tempdb
SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%#%';



-- now move to session 2

-- check existence again - both are still here
SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%#%';

-- try accessing data - we only have global one declared
SELECT * FROM #LocalTempTable;
SELECT * FROM ##GlobalTempTable;

-- we can create another table in second session with same name, they will both work
CREATE TABLE #LocalTempTable (ID INT, Name VARCHAR(50));
INSERT INTO #LocalTempTable VALUES (1, 'LocalTempTable2');
SELECT * FROM #LocalTempTable;

-- if we check now, there will be two local temp tables - each for one session
SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%#%';