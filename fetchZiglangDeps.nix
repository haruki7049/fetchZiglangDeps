{
  pkgs,
  zig ? pkgs.zig,
  stdenv ? pkgs.stdenv,
  url,
  zig-hash,
}:

let
  fetchzip = pkgs.fetchzip;
  calc-hash = url: pkgs.writeShellScriptBin "calc-hash" ''
    ${pkgs.nix}/bin/nix-prefetch-url --unpack ${url}
  '';
in

stdenv.mkDerivation {
  name = zig-hash;

  src = fetchzip {
    inherit url;
    hash = calc-hash url;
  };
}
