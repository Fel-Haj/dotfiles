{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment = {
    systemPackages = with pkgs; [
      neovim
      tmux
    ];
    systemPath = [
      "/opt/homebrew/bin"
      "/opt/homebrew/sbin"
    ];
    variables.EDITOR = "nvim";
  };

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas
    # Need to install these Apps manually first so that apple account has records of them
    # otherwise Apple Store will refuse to install them.
    # see https://github.com/mas-cli/mas 
    masApps = {
      # Xcode = 497799835;
    };

    taps = [
      "homebrew/services"
      "nikitabobko/tap"
    ];

    brews = [
      "pam-reattach"
    ];

    casks = [
      "aerospace"
      "arc"
      "ghostty"

      "microsoft-excel"
      "microsoft-teams"

      # /usr/sbin/softwareupdate --install-rosetta for Apple silicon
      # see https://github.com/microsoft/AL/issues/7506
      "visual-studio-code"
    ];
  };
}
