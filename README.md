# fetchZiglangDeps

## How to use
```nix
{
  pkgs ? import <nixpkgs> { },
  build-zig-zon ? builtins.readFile ./build.zig.zon;

  # Edit commitHash
  fetchZiglangDeps ? import (builtins.fetchTarball "https://github.com/haruki7049/fetchZiglangDeps/archive/${commitHash}.tar.gz");
}:

fetchZiglangDeps {
  inherit build-zig-zon;
}

### This nix expression's result
# {
#   linkFarm,
#   fetchzip,
# }:
#
# linkFarm "zig-packages" [
#   {
#     name = "12209936c3333b53b53edcf453b1670babb9ae8c2197b1ca627c01e72670e20c1a21";
#     path = fetchzip {
#       url = "https://github.com/zigzap/zap/archive/v0.8.0.tar.gz";
#       hash = "sha256-UtxN9l2zZlpfFGKBYv9PsBJEmUwaaVy3VUmCqIHh7vk=";
#     };
#   }
# ]
```
