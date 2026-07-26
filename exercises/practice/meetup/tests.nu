use meetup.nu
use std/assert

# when teenth Monday is the 13th, the first day of the teenth week
assert equal (meetup 2013 5 teenth Monday) "2013-05-13"
# when teenth Monday is the 19th, the last day of the teenth week
assert equal (meetup 2013 8 teenth Monday) "2013-08-19"
# when teenth Monday is some day in the middle of the teenth week
assert equal (meetup 2013 9 teenth Monday) "2013-09-16"
# when teenth Tuesday is the 19th, the last day of the teenth week
assert equal (meetup 2013 3 teenth Tuesday) "2013-03-19"
# when teenth Tuesday is some day in the middle of the teenth week
assert equal (meetup 2013 4 teenth Tuesday) "2013-04-16"
# when teenth Tuesday is the 13th, the first day of the teenth week
assert equal (meetup 2013 8 teenth Tuesday) "2013-08-13"
# when teenth Wednesday is some day in the middle of the teenth week
assert equal (meetup 2013 1 teenth Wednesday) "2013-01-16"
# when teenth Wednesday is the 13th, the first day of the teenth week
assert equal (meetup 2013 2 teenth Wednesday) "2013-02-13"
# when teenth Wednesday is the 19th, the last day of the teenth week
assert equal (meetup 2013 6 teenth Wednesday) "2013-06-19"
# when teenth Thursday is some day in the middle of the teenth week
assert equal (meetup 2013 5 teenth Thursday) "2013-05-16"
# when teenth Thursday is the 13th, the first day of the teenth week
assert equal (meetup 2013 6 teenth Thursday) "2013-06-13"
# when teenth Thursday is the 19th, the last day of the teenth week
assert equal (meetup 2013 9 teenth Thursday) "2013-09-19"
# when teenth Friday is the 19th, the last day of the teenth week
assert equal (meetup 2013 4 teenth Friday) "2013-04-19"
# when teenth Friday is some day in the middle of the teenth week
assert equal (meetup 2013 8 teenth Friday) "2013-08-16"
# when teenth Friday is the 13th, the first day of the teenth week
assert equal (meetup 2013 9 teenth Friday) "2013-09-13"
# when teenth Saturday is some day in the middle of the teenth week
assert equal (meetup 2013 2 teenth Saturday) "2013-02-16"
# when teenth Saturday is the 13th, the first day of the teenth week
assert equal (meetup 2013 4 teenth Saturday) "2013-04-13"
# when teenth Saturday is the 19th, the last day of the teenth week
assert equal (meetup 2013 10 teenth Saturday) "2013-10-19"
# when teenth Sunday is the 19th, the last day of the teenth week
assert equal (meetup 2013 5 teenth Sunday) "2013-05-19"
# when teenth Sunday is some day in the middle of the teenth week
assert equal (meetup 2013 6 teenth Sunday) "2013-06-16"
# when teenth Sunday is the 13th, the first day of the teenth week
assert equal (meetup 2013 10 teenth Sunday) "2013-10-13"
# when first Monday is some day in the middle of the first week
assert equal (meetup 2013 3 first Monday) "2013-03-04"
# when first Monday is the 1st, the first day of the first week
assert equal (meetup 2013 4 first Monday) "2013-04-01"
# when first Tuesday is the 7th, the last day of the first week
assert equal (meetup 2013 5 first Tuesday) "2013-05-07"
# when first Tuesday is some day in the middle of the first week
assert equal (meetup 2013 6 first Tuesday) "2013-06-04"
# when first Wednesday is some day in the middle of the first week
assert equal (meetup 2013 7 first Wednesday) "2013-07-03"
# when first Wednesday is the 7th, the last day of the first week
assert equal (meetup 2013 8 first Wednesday) "2013-08-07"
# when first Thursday is some day in the middle of the first week
assert equal (meetup 2013 9 first Thursday) "2013-09-05"
# when first Thursday is another day in the middle of the first week
assert equal (meetup 2013 10 first Thursday) "2013-10-03"
# when first Friday is the 1st, the first day of the first week
assert equal (meetup 2013 11 first Friday) "2013-11-01"
# when first Friday is some day in the middle of the first week
assert equal (meetup 2013 12 first Friday) "2013-12-06"
# when first Saturday is some day in the middle of the first week
assert equal (meetup 2013 1 first Saturday) "2013-01-05"
# when first Saturday is another day in the middle of the first week
assert equal (meetup 2013 2 first Saturday) "2013-02-02"
# when first Sunday is some day in the middle of the first week
assert equal (meetup 2013 3 first Sunday) "2013-03-03"
# when first Sunday is the 7th, the last day of the first week
assert equal (meetup 2013 4 first Sunday) "2013-04-07"
# when second Monday is some day in the middle of the second week
assert equal (meetup 2013 3 second Monday) "2013-03-11"
# when second Monday is the 8th, the first day of the second week
assert equal (meetup 2013 4 second Monday) "2013-04-08"
# when second Tuesday is the 14th, the last day of the second week
assert equal (meetup 2013 5 second Tuesday) "2013-05-14"
# when second Tuesday is some day in the middle of the second week
assert equal (meetup 2013 6 second Tuesday) "2013-06-11"
# when second Wednesday is some day in the middle of the second week
assert equal (meetup 2013 7 second Wednesday) "2013-07-10"
# when second Wednesday is the 14th, the last day of the second week
assert equal (meetup 2013 8 second Wednesday) "2013-08-14"
# when second Thursday is some day in the middle of the second week
assert equal (meetup 2013 9 second Thursday) "2013-09-12"
# when second Thursday is another day in the middle of the second week
assert equal (meetup 2013 10 second Thursday) "2013-10-10"
# when second Friday is the 8th, the first day of the second week
assert equal (meetup 2013 11 second Friday) "2013-11-08"
# when second Friday is some day in the middle of the second week
assert equal (meetup 2013 12 second Friday) "2013-12-13"
# when second Saturday is some day in the middle of the second week
assert equal (meetup 2013 1 second Saturday) "2013-01-12"
# when second Saturday is another day in the middle of the second week
assert equal (meetup 2013 2 second Saturday) "2013-02-09"
# when second Sunday is some day in the middle of the second week
assert equal (meetup 2013 3 second Sunday) "2013-03-10"
# when second Sunday is the 14th, the last day of the second week
assert equal (meetup 2013 4 second Sunday) "2013-04-14"
# when third Monday is some day in the middle of the third week
assert equal (meetup 2013 3 third Monday) "2013-03-18"
# when third Monday is the 15th, the first day of the third week
assert equal (meetup 2013 4 third Monday) "2013-04-15"
# when third Tuesday is the 21st, the last day of the third week
assert equal (meetup 2013 5 third Tuesday) "2013-05-21"
# when third Tuesday is some day in the middle of the third week
assert equal (meetup 2013 6 third Tuesday) "2013-06-18"
# when third Wednesday is some day in the middle of the third week
assert equal (meetup 2013 7 third Wednesday) "2013-07-17"
# when third Wednesday is the 21st, the last day of the third week
assert equal (meetup 2013 8 third Wednesday) "2013-08-21"
# when third Thursday is some day in the middle of the third week
assert equal (meetup 2013 9 third Thursday) "2013-09-19"
# when third Thursday is another day in the middle of the third week
assert equal (meetup 2013 10 third Thursday) "2013-10-17"
# when third Friday is the 15th, the first day of the third week
assert equal (meetup 2013 11 third Friday) "2013-11-15"
# when third Friday is some day in the middle of the third week
assert equal (meetup 2013 12 third Friday) "2013-12-20"
# when third Saturday is some day in the middle of the third week
assert equal (meetup 2013 1 third Saturday) "2013-01-19"
# when third Saturday is another day in the middle of the third week
assert equal (meetup 2013 2 third Saturday) "2013-02-16"
# when third Sunday is some day in the middle of the third week
assert equal (meetup 2013 3 third Sunday) "2013-03-17"
# when third Sunday is the 21st, the last day of the third week
assert equal (meetup 2013 4 third Sunday) "2013-04-21"
# when fourth Monday is some day in the middle of the fourth week
assert equal (meetup 2013 3 fourth Monday) "2013-03-25"
# when fourth Monday is the 22nd, the first day of the fourth week
assert equal (meetup 2013 4 fourth Monday) "2013-04-22"
# when fourth Tuesday is the 28th, the last day of the fourth week
assert equal (meetup 2013 5 fourth Tuesday) "2013-05-28"
# when fourth Tuesday is some day in the middle of the fourth week
assert equal (meetup 2013 6 fourth Tuesday) "2013-06-25"
# when fourth Wednesday is some day in the middle of the fourth week
assert equal (meetup 2013 7 fourth Wednesday) "2013-07-24"
# when fourth Wednesday is the 28th, the last day of the fourth week
assert equal (meetup 2013 8 fourth Wednesday) "2013-08-28"
# when fourth Thursday is some day in the middle of the fourth week
assert equal (meetup 2013 9 fourth Thursday) "2013-09-26"
# when fourth Thursday is another day in the middle of the fourth week
assert equal (meetup 2013 10 fourth Thursday) "2013-10-24"
# when fourth Friday is the 22nd, the first day of the fourth week
assert equal (meetup 2013 11 fourth Friday) "2013-11-22"
# when fourth Friday is some day in the middle of the fourth week
assert equal (meetup 2013 12 fourth Friday) "2013-12-27"
# when fourth Saturday is some day in the middle of the fourth week
assert equal (meetup 2013 1 fourth Saturday) "2013-01-26"
# when fourth Saturday is another day in the middle of the fourth week
assert equal (meetup 2013 2 fourth Saturday) "2013-02-23"
# when fourth Sunday is some day in the middle of the fourth week
assert equal (meetup 2013 3 fourth Sunday) "2013-03-24"
# when fourth Sunday is the 28th, the last day of the fourth week
assert equal (meetup 2013 4 fourth Sunday) "2013-04-28"
# last Monday in a month with four Mondays
assert equal (meetup 2013 3 last Monday) "2013-03-25"
# last Monday in a month with five Mondays
assert equal (meetup 2013 4 last Monday) "2013-04-29"
# last Tuesday in a month with four Tuesdays
assert equal (meetup 2013 5 last Tuesday) "2013-05-28"
# last Tuesday in another month with four Tuesdays
assert equal (meetup 2013 6 last Tuesday) "2013-06-25"
# last Wednesday in a month with five Wednesdays
assert equal (meetup 2013 7 last Wednesday) "2013-07-31"
# last Wednesday in a month with four Wednesdays
assert equal (meetup 2013 8 last Wednesday) "2013-08-28"
# last Thursday in a month with four Thursdays
assert equal (meetup 2013 9 last Thursday) "2013-09-26"
# last Thursday in a month with five Thursdays
assert equal (meetup 2013 10 last Thursday) "2013-10-31"
# last Friday in a month with five Fridays
assert equal (meetup 2013 11 last Friday) "2013-11-29"
# last Friday in a month with four Fridays
assert equal (meetup 2013 12 last Friday) "2013-12-27"
# last Saturday in a month with four Saturdays
assert equal (meetup 2013 1 last Saturday) "2013-01-26"
# last Saturday in another month with four Saturdays
assert equal (meetup 2013 2 last Saturday) "2013-02-23"
# last Sunday in a month with five Sundays
assert equal (meetup 2013 3 last Sunday) "2013-03-31"
# last Sunday in a month with four Sundays
assert equal (meetup 2013 4 last Sunday) "2013-04-28"
# when last Wednesday in February in a leap year is the 29th
assert equal (meetup 2012 2 last Wednesday) "2012-02-29"
# last Wednesday in December that is also the last day of the year
assert equal (meetup 2014 12 last Wednesday) "2014-12-31"
# when last Sunday in February in a non-leap year is not the 29th
assert equal (meetup 2015 2 last Sunday) "2015-02-22"
# when first Friday is the 7th, the last day of the first week
assert equal (meetup 2012 12 first Friday) "2012-12-07"
