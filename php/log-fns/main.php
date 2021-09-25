<?php

/* ----- mock functions and classes ----- */

class Auth {
  public static function user(): MockUser {
    return new MockUser(007, 'user@mail.com');
  }
}


class MockUser {
  public int $id;
  public string $email;

  public function __construct($id = 1, $email = "test@mail.com") {
      $this->id     = $id;
      $this->email  = $email;
    }
}


function class_basename($class)
{
  $class = is_object($class) ? get_class($class) : $class;

  return basename(str_replace('\\', '/', $class));
}


function check($old_fn, $new_fn, $input) {
  $old_result = $old_fn($input);
  $new_result = $new_fn($input);

  echo ($old_result == $new_result) 
    ? "\e[42m pass \e[0m " 
    : "\e[41m fail \e[0m ";

  echo "function: $new_fn,\t";
  echo "input: ". json_encode($input) . "\t";
  echo "output: $old_result,\t";

  echo "\n";
}

/* -------------------------------------- */ 
/* -------- original functions ---------- */

function _getExecutorInfo($executor):string {
  if ($executor == null) {
    $executor = Auth::user();
  }

  if (isset($executor->id))
    $strId = $executor->id;
  else if (is_string($executor))
    $strId = $executor;
  else $strId = "NoID";

  if (isset($executor->email))
    $strEmail = ':' . $executor->email;
  else 
    $strEmail = '';

  return "$strId$strEmail";
}

function _getActionInfo($action):string {
  if ($action == null)
    $strAct = (debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 2)[1]['function']);
  else if (is_string($action))
    $strAct = $action;
  else $strAct = 'No Action';

  return $strAct;
}

function _getTargetInfo($target):string {
  $strTgtClass = '';
  $strTgtEmail = '';

  if ($target == null)
    $strTgt = 'System';
  else if (isset($target->id)) {
    $strTgtClass = class_basename(get_class($target));
    $strTgt = ':' . $target->id;
    if (isset($target->email))
      $strTgtEmail = ':' . $target->email;
  } else if (is_string($target))
    $strTgt = $target;
  else $strTgt = 'No Target';

  return "$strTgtClass$strTgt$strTgtEmail";
}

/* -------------------------------------- */ 
/* ------- refactored functions---------- */

function getExecutorInfo($executor):string { 
  if (is_string($executor)) return $executor;
  if (is_int($executor)) return "NoID";

  $_executor = $executor ?? Auth::user();
  $executorId    = $_executor->id ?? "NoID";
  $executorEmail = ($_executor->email) ? (':'. $_executor->email) : '';
 
  return "$executorId$executorEmail";
}

function getActionInfo($action):string { 
  if (is_string($action)) return $action;
  if ($action == null) return debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS, 2)[1]['function']; 
  
  return 'No Action';
}

function getTargetInfo($target):string {
  if ($target == null) return "System";
  if (is_string($target)) return $target;

  if (isset($target->id)) {
    $targetClass = class_basename(get_class($target));
    $targetId = ':' . $target->id;
    $targetEmail = ($target->email) ? (':'. $target->email) : '';

    return "$targetClass$targetId$targetEmail";
  }

  return "No Target";
}


function main() {

  print("\nTesting input with <null>\n");
  check("_getExecutorInfo", "getExecutorInfo", null);
  check("_getActionInfo",   "getActionInfo",   null);
  check("_getTargetInfo",   "getTargetInfo",   null);

  print("\nTesting input with number 123\n");
  check("_getExecutorInfo", "getExecutorInfo", 123);
  check("_getActionInfo",   "getActionInfo",   123);
  check("_getTargetInfo",   "getTargetInfo",   123);

  print("\nTesting input with number \"text\"\n");
  check("_getExecutorInfo", "getExecutorInfo", "text");
  check("_getActionInfo",   "getActionInfo",   "text"); 
  check("_getTargetInfo",   "getTargetInfo",   "text");

  print("\nTesting input with a Mock User class\n");
  check("_getExecutorInfo", "getExecutorInfo", new MockUser);
  check("_getActionInfo",   "getActionInfo",   new MockUser);
  check("_getTargetInfo",   "getTargetInfo",   new MockUser);

}

/* call main */ main();

