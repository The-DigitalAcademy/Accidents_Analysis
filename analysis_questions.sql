-- who would be interested in this data?
-- - department of transport and traffic
-- they would uyse this to identify hotspot sreas for accidents

-- Law enforecement
-- -this would help for resource allocation, road repairs/ managements

-- 1. which areas have the highest accidents and which conditions contribute to this?
SELECT 
    p.postcode AS area,
    COUNT(a.accident_id) AS total_accidents,
    lc.light_conditions AS common_light_conditions,
    wc.weather_conditions AS common_weather_conditions,
    rsc.road_surface_conditions AS common_road_surface_conditions,
    scs.special_conditions_at_site AS common_special_conditions,
    ch.carriageway_hazards AS common_carriageway_hazards
FROM accidents a
JOIN postcode p ON a.postcode_id = p.postcode_id
JOIN light_conditions lc ON a.light_conditions_id = lc.light_conditions_id
JOIN weather_conditions wc ON a.weather_conditions_id = wc.weather_conditions_id
JOIN road_surface_conditions rsc ON a.road_surface_conditions_id = rsc.road_surface_conditions_id
JOIN special_conditions_at_site scs ON a.special_conditions_at_site_id = scs.special_conditions_at_site_id
JOIN carriageway_hazards ch ON a.carriageway_hazards_id = ch.carriageway_hazards_id
GROUP BY p.postcode, lc.light_conditions, wc.weather_conditions, 
         rsc.road_surface_conditions, scs.special_conditions_at_site, ch.carriageway_hazards
ORDER BY total_accidents DESC
LIMIT 10;

-- 2. investigate accident peak hours
-- 2.1 what time of day do the accident happen?
SELECT 
    EXTRACT(HOUR FROM a.time) AS accident_hour,
    COUNT(a.accident_id) AS total_accidents
FROM accidents a
GROUP BY accident_hour
ORDER BY total_accidents DESC;

-- 2.2 which day of the week is it?
SELECT 
    TO_CHAR(a.date, 'Day') AS accident_day,
    COUNT(a.accident_id) AS total_accidents
FROM accidents a
GROUP BY accident_day
ORDER BY total_accidents DESC;

-- 2.3 what dates are common?
SELECT 
    a.date AS accident_date,
    COUNT(a.accident_id) AS total_accidents
FROM accidents a
GROUP BY accident_date
ORDER BY total_accidents DESC
LIMIT 10;

