<?php

interface Logger {
  public function log(string $msg);
}

class Application {
  private $logger;

  public function getLogger(): Logger {
    return $this->logger;
  }

  public function setLogger(Logger $logger) {
    $this->logger = $logger;
  }
}

$app = new Application;
$app->setLogger(new class implements Logger {
  public function log(string $msg) {
    print($msg);
  }
});


echo "you can define anonymous classes using `new class ...`\n";
echo "sort of the OO sister to anonymous functions.\n";
echo "javascript has this too, with different syntax.\n\n";

$app->getLogger()->log("Printing from anonymous class.\n\n");

