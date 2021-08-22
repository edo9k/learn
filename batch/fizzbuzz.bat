@echo off

set /A MAX=100
set /A i=1

goto :loop

:increment
  set /A i+=1
  if %i% GTR %MAX% goto :end
  goto :loop

:fizzbuzz
  echo FizzBuzz
  goto :increment

:buzz
  echo Buzz
  goto :increment

:fizz
  echo Fizz
  goto :increment

:number
  echo %i%
  goto :increment

:loop

  set /A remainder=i%%15
  if %remainder% EQU 0 goto :fizzbuzz

  set /A remainder=i%%5
  if %remainder% EQU 0 goto :buzz

  set /A remainder=i%%3
  if %remainder% EQU 0 goto :fizz

  goto :number

:end
