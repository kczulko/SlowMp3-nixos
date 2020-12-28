{pkgs ? import <nixpkgs> {}, jre ? pkgs.jre }:

let

  name = "SlowMp3";

  src = pkgs.fetchurl {
    url = "http://www.rinki.net/pekka/slowmp3/SlowMP3.jar";
    sha256 = "1rcnlcsga7ifmnf93ldvb3jdj2vixj58c8sfx5vqpxg8xh3cyfl1";
  };

  runCmd = "${jre}/bin/java -jar ${src}";

in pkgs.writeShellScriptBin name runCmd
