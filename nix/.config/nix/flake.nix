{
  description = "MacBook system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    wezterm.url = "github:wez/wezterm?dir=nix";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, wezterm }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [ 
          pkgs.bat
          pkgs.eza
          pkgs.fd
          pkgs.fzf
          pkgs.jq
          pkgs.lazygit
          pkgs.neovim
          pkgs.ripgrep
          pkgs.starship
          pkgs.stow
          pkgs.tmux
          pkgs.vivid
          pkgs.watch
          pkgs.wget
          pkgs.yazi
          pkgs.zoxide
          inputs.wezterm.packages.${pkgs.system}.default
        ];

      fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Set up zsh
      programs.zsh = {
        enable = true;
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."macbook".pkgs;
  };
}
