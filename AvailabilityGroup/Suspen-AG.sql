use master
DECLARE @DB as varchar(MAX)
DECLARE @sDate as varchar(50)
DECLARE @SRelease as varchar(50)
DECLARE @query as varchar(MAX)
DECLARE @query2 as varchar(MAX)
DECLARE FilestreamDB CURSor FOR
             select name as instance from sys.databases where replica_id is not null order by 1
OPEN FilestreamDB
FETCH NEXT FROM FilestreamDB INTO @DB
WHILE @@FETCH_STATUS = 0
BEGIN
              SET @query = 'ALTER DATABASE ['+@DB+'] SET HADR SUSPEND'
                       exec (@query)      
       FETCH NEXT FROM FilestreamDB INTO @DB
END
CLOSE FilestreamDB

DEALLOCATE FilestreamDB