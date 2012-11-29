USE [Larco]
GO
/****** Object:  StoredProcedure [dbo].[crosstab_Original]    Script Date: 10/18/2012 13:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER      PROCEDURE [dbo].[crosstab_Original] 
@select varchar(8000),
@sumfunc varchar(100), 
@pivot varchar(100), 
@table varchar(100), 
@where varchar(100)
AS

DECLARE @sql varchar(8000), @delim varchar(1)
SET NOCOUNT ON
SET ANSI_WARNINGS OFF

if exists (select * from tempdb..sysobjects where id = object_id(N'tempdb..##pivot'))
drop table ##pivot

EXEC ('SELECT ' + @pivot + ' AS pivot INTO ##pivot FROM ' + @table + ' WHERE 1=2')
EXEC ('INSERT INTO ##pivot SELECT DISTINCT ' + @pivot + ' FROM ' + @table + ' WHERE ' 
+ @pivot + ' Is Not Null' + @where)
print ('INSERT INTO ##pivot SELECT DISTINCT ' + @pivot + ' FROM ' + @table + ' WHERE ' 
+ @pivot + ' Is Not Null' + @where)
SELECT @sql='',  @sumfunc=stuff(@sumfunc, len(@sumfunc), 1, ' END)' )

SELECT @delim=CASE Sign( CharIndex('char', data_type)+CharIndex('date', data_type) ) 
WHEN 0 THEN '' ELSE '''' END 
FROM tempdb.information_schema.columns 
WHERE table_name='##pivot' AND column_name='pivot'

SELECT @sql=@sql + '''' + convert(varchar(100), pivot) + ''' = CASE WHEN ' + 
stuff(@sumfunc,charindex( '(', @sumfunc )+1, 0, ' CASE ' + @pivot + ' WHEN ' 
+ @delim + convert(varchar(100), pivot) + @delim + ' THEN ' ) + ' IS NULL THEN 0 ELSE ' +
stuff(@sumfunc,charindex( '(', @sumfunc )+1, 0, ' CASE ' + @pivot + ' WHEN ' 
+ @delim + convert(varchar(100), pivot) + @delim + ' THEN ' ) + ' END , ' FROM ##pivot

DROP TABLE ##pivot

SELECT @sql=left(@sql, len(@sql)-1)
SELECT @select=stuff(@select, charindex(' FROM ', @select)+1, 0, ', ' + @sql + ' ')
print (@select)
EXEC (@select)
SET ANSI_WARNINGS ON











