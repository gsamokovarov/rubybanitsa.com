Time::DATE_FORMATS[:weekday] = '%A'
Time::DATE_FORMATS[:ordinal_day] = -> time { time.day.ordinalize }
Time::DATE_FORMATS[:month_name] = '%B'
Time::DATE_FORMATS[:time_only] = '%H:%M'
