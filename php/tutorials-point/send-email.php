<?php

$to = "sendmailtest@guerillamail.com";
$subject = "Is this being sent?";

$message = "<h1>Hi!</h1> <h2>sent from a PHP file</h2>";

$header = "From:php7@mycomputer.com \r\n" 
          . "MIME-Version: 1.0\r\n"
          . "Content-type: text/html\r\n";


$return_value = mail ($to, $subject, $message, $header);

if ($return_value) {
  echo "The message was sent, apparently.\n";
} else {
  echo "Mail returned an error";
}

