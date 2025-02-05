{
  config,
  lib,
  myvars,
  ...
}: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  # https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ${config.home.homeDirectory}/.gitconfig
  '';

  programs.git = {
    enable = true;
    userEmail = myvars.useremail;
    userName = myvars.userfullname;

    aliases = {
      # common aliases
      br = "branch";
      ca = "commit -am"; # commit all changes via `git ca <message>`
      cm = "commit -m"; # commit via `git cm <message>`
      co = "checkout";
      dc = "diff --cached";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      st = "status";
    };

    delta = {
      enable = true;
      options = {
        diff-so-fancy = true;
        line-numbers = true;
        true-color = "always";
      };
    };

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      trim.bases = "develop,master,main";

      # replace https with ssh
      url = {
        "ssh://git@github.com/iamryanmacdonald" = {
          insteadOf = "https://github.com/iamryanmacdonald";
        };
      };
    };
  };
}
