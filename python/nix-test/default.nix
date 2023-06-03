{ pythonPackages }:

let
  flaskApp = pythonPackages.buildPythonApplication {
    pname = "nix-test";
    src = ./.;
    python = pythonPackages.python39;
  };
in
  pythonPackages.mkDerivation {
    pname = "nix-test-env";
    inherit pythonPackages;
    buildScripts = [ flaskApp ];
  }

