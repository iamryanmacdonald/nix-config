{mysecrets, ...}: {
  home.file.".ssh/domini".source = "${mysecrets}/public/domini.pub";

  programs.ssh = {
    enable = true;

    extraConfig = ''
      # a private key that is used during authentication will be added to ssh-agent if it is running
      AddKeysToAgent yes

      Host 192.168.*
        ForwardAgent yes
        IdentitiesOnly yes
        IdentityFile /etc/agenix/ssh-key-domini
    '';
  };
}
