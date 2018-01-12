SELECT
       DB_NAME()                       AS DatabaseName, 
       OBJECT_NAME(i.OBJECT_ID)        AS TableName , 
       i.name                          AS IndexName,
       s.user_updates                  AS IndexUserUpdates
     
   FROM sys.indexes i  
   LEFT JOIN sys.dm_db_index_usage_stats s 
       ON s.OBJECT_ID = i.OBJECT_ID 
       AND i.index_id = s.index_id 
       AND s.database_id = DB_ID()
   WHERE OBJECTPROPERTY(i.OBJECT_ID, 'IsIndexable') = 1 
   -- index_usage_stats has no reference to this index (not being used)
   AND s.index_id IS NULL 
   -- index is being updated, but not used by seeks/scans/lookups
   OR (
           s.user_updates > 0 
           AND s.user_seeks = 0 
           AND s.user_scans = 0 
           AND s.user_lookups = 0
       )
   ORDER BY OBJECT_NAME(i.OBJECT_ID) ASC   
