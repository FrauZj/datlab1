-- 1.Взяти усі станції на лінії
SELECT s.station_name, s.position_on_line
FROM stations s
JOIN `lines` l ON s.line_id = l.line_id
WHERE l.line_name = 'Холодногірсько-Заводська'
ORDER BY s.position_on_line;


-- 2. Взяти усі трансфери
SELECT s1.station_name AS from_station, l1.line_name AS from_line,
       s2.station_name AS to_station, l2.line_name AS to_line
FROM connections c
JOIN stations s1 ON c.station_from = s1.station_id
JOIN `lines` l1 ON c.line_from = l1.line_id
JOIN stations s2 ON c.station_to = s2.station_id
JOIN `lines` l2 ON c.line_to = l2.line_id
WHERE c.connection_type = 'transfer';

