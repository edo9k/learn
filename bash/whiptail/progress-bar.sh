
{ 

  for (( i = 0 ; i < 100 ; i+=1 ))
  do
    sleep 0.1
    echo $i
  done
  sleep 5   # sleep a bit more
  echo 100  # before completing the gauge

} | whiptail --gauge "Wait while we do nothing..." 6 50 0 

