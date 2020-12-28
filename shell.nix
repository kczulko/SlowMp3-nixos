{ pkgs ? import <nixpkgs> {}}:

let 
  slowMp3 = import ./default.nix {};
in pkgs.mkShell {
  buildInputs = [ slowMp3 ];
}
