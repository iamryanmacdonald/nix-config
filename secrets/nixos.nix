{
  agenix,
  config,
  lib,
  mysecrets,
  myvars,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.secrets;

  noaccess = {
    mode = "0000";
    owner = "root";
  };
  user_readable = {
    mode = "0500";
    owner = myvars.username;
  };
in {
  imports = [
    agenix.nixosModules.default
  ];

  options.modules.secrets = {
    desktop.enable = mkEnableOption "NixOS Secrets for Desktops";

    impermanence.enable = mkEnableOption "Whether or not to use impermanence and ephemeral root file system";
  };

  config = mkIf (cfg.desktop.enable) (mkMerge [
    {
      environment.systemPackages = [
        agenix.packages."${pkgs.system}".default
      ];

      # if you changed this key, you need to regenerate all encrypt files from the decrypt contents!
      age.identityPaths =
        if cfg.impermanence.enable
        then [
          # To decrypt secrets on boot, this key should exist when the system is booting,
          # so we should use the real key file path (prefixed by `/persistent/`) here, instead of the path mounted by impermanence.
          "/persistent/etc/ssh/ssh_host_ed25519_key"
        ]
        else [
          "/etc/ssh/ssh_host_ed25519_key"
        ];
    }

    (mkIf cfg.desktop.enable {
      age.secrets = {
        # ---------------------------------------------
        # no one can read/write this file, even root.
        # ---------------------------------------------

        # .age means the decrypted file is still encrypted by age (via a passphrase)
        "iamryanmacdonald-gpg-subkeys.priv.age" =
          {
            file = "${mysecrets}/iamryanmacdonald-gpg-subkeys-2024-11-18.priv.age.age";
          }
          // noaccess;

        # ---------------------------------------------
        # user can read this file.
        # ---------------------------------------------

        "ssh-key-domini" =
          {
            file = "${mysecrets}/ssh-key-domini.age";
          }
          // user_readable;
      };

      # place secrets in /etc/
      environment.etc = {
        "agenix/iamryanmacdonald-gpg-subkeys.priv.age" = {
          mode = "0000";
          source = config.age.secrets."iamryanmacdonald-gpg-subkeys.priv.age".path;
        };

        "agenix/ssh-key-domini" = {
          mode = "0600";
          source = config.age.secrets."ssh-key-domini".path;
          user = myvars.username;
        };
      };
    })
  ]);
}
