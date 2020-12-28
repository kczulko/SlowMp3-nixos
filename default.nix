{pkgs ? import <nixpkgs> {}}:

pkgs.stdenv.mkDerivation {

  name = "SlowMp3";
  version = "0.1";
  src = pkgs.fetchurl {
    url = "http://www.rinki.net/pekka/slowmp3/SlowMP3.jar";
    sha256 = "1rcnlcsga7ifmnf93ldvb3jdj2vixj58c8sfx5vqpxg8xh3cyfl1";
  };
  buildInputs = [ pkgs.jdk ];

  phases = [ "installPhase" ];
  
  installPhase = ''
    mkdir -p $out/bin
    cd $out/bin
    touch $name
    chmod +x $name
    cat <<EOF > $name
      #!/usr/bin/env bash
      java -jar $src
    EOF
  '';
}
