# sqlite
WITH RANKS_TABLE AS
(SELECT event_type, value, time, RANK () OVER (PARTITION BY event_type ORDER BY time DESC) as RANKS
FROM events)


SELECT event_type, LAGS-value AS value
FROM (SELECT event_type, value, time, RANKS, LAG (value) OVER (PARTITION BY event_type ORDER BY time DESC) as LAGS
      FROM RANKS_TABLE)
      
WHERE LAGS IS NOT NULL AND RANKS = 2
ORDER BY event_type
