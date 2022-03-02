<?php

  class Magic {

    public function getMethod() {
      return __METHOD__;
    }

    public function getClass() {
      return __CLASS__;
    }

  }

  function returnOwnName () {
    return __FUNCTION__;
  }

  echo "__LINE__ prints the current statement line.\n";
  echo "This text is printed on line". __LINE__ . "\n";
  echo "--\n";
  
  echo "__FILE__ prints the file.\n";
  echo "This comes from file: ". __FILE__ . "\n";
  echo "--\n";

  echo "__FUNCTION__ gets the current function name.\n";
  echo "the function called is named: ". returnOwnName() . "\n";
  echo "--\n";

  $magic = new Magic;

  echo "example object from Magic class: \n";
  var_dump($magic);

  echo "__CLASS__ gets the class name\n";
  echo "the test class is called: \n"; 
  var_dump( $magic->getClass() );
  echo "--\n";

  echo "__METHOD__ gets the method name \n";
  var_dump( $magic->getMethod() );
  echo "--\n";

