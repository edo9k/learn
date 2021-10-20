program datetime
implicit none

  character(8) :: dateinfo ! ccyymmdd
  character(4) :: year, month*2, day*2

  character(10) :: timeinfo ! hhmmss.sss
  character(2)  :: hour, minute, second*6

  call date_and_time(dateinfo, timeinfo)

  ! breaking dateinfo in year, month and day
  ! format is the usual, year/month/day -> yymmdd
  ! except for cc, that stands for century

  year  = dateinfo(1:4)
  month = dateinfo(5:8)
  day   = dateinfo(7:8)

  print *, "date string: ", dateinfo
  print *, "year: ", year
  print *, "month: ", month
  print *, "day: ", day

  ! breaking timeinfo in hour, minute and second
  ! the last sss stands for miliseconds

  hour    = timeinfo(1:2)
  minute  = timeinfo(3:4)
  second  = timeinfo(5:10)

  print *, "time string: ", timeinfo
  print *, "hour: ", hour
  print *, "minute: ", minute
  print *, "second: ", second

end program datetime

