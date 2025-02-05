{pkgs, ...}: {
  home.packages = with pkgs; [
    dive
    docker-compose
    lazydocker
  ];
}
