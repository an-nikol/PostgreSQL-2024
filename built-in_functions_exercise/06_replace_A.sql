SELECT
	TRANSLATE(mountain_range, 'a', '@') AS replace_a,
	TRANSLATE(mountain_range, 'A', '$') AS replace_A
from mountains
;