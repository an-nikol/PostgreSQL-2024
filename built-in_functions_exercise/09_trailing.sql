SELECT 
	continent_name,
	TRIM(TRAILING ' ' FROM continent_name) 
from continents
;