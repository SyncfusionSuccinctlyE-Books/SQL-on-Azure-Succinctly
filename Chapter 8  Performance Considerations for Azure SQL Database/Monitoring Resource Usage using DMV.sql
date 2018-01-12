SELECT * 
FROM sys.resource_stats 
WHERE database_name = 'myazuresqldb' AND 
      start_time > DATEADD(day, -7, GETDATE())
ORDER BY start_time DESC;

SELECT 
    avg(avg_cpu_percent) AS 'Average CPU Utilization In Percent',
    max(avg_cpu_percent) AS 'Maximum CPU Utilization In Percent',
    avg(avg_physical_data_read_percent) AS 'Average Physical Data Read Utilization In Percent',
    max(avg_physical_data_read_percent) AS 'Maximum Physical Data Read Utilization In Percent',
    avg(avg_log_write_percent) AS 'Average Log Write Utilization In Percent',
    max(avg_log_write_percent) AS 'Maximum Log Write Utilization In Percent',
    avg(active_session_count) AS 'Average # of Sessions',
    max(active_session_count) AS 'Maximum # of Sessions',
    avg(active_worker_count) AS 'Average # of Workers',
    max(active_worker_count) AS 'Maximum # of Workers'
FROM sys.resource_stats 
WHERE database_name = 'myazuresqldb' AND start_time > DATEADD(day, -7, GETDATE());
