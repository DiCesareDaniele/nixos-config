{ config, lib, pkgs, ... }: 
with lib;
with lib.internal;
let
  cfg = config.cli-apps.zsh;
in {
  options.cli-apps.zsh = {
    enable = mkBoolOpt false "Whether to configure zsh";
  };
  config = mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;
      useTheme = "catppuccin_mocha";
    };
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting = enabled;
      autosuggestion = enabled;
      defaultKeymap = "viins";
      shellAliases = {
        ls = "ls --color";
        ".." = "cd ..";
        "..." = "cd ../..";
      };
      history = {
        size = 10000;
        ignoreAllDups = true;
      };
      # plugins = [
      #   {
      #     name = "fzf-tab";
      #     file = "fzf-tab.plugin.zsh";
      #     src = pkgs.fetchFromGitHub {
      #       owner = "Aloxaf";
      #       repo = "fzf-tab";
      #       rev = "cf57116eb2410139b8bd78fcb793dd84db79e28f";
      #       sha256 = "IA7JoauKkNOMETUTH4ekKIZWgwmGuEfu2ZN7BKhCXSA=";
      #     };
      #   }
      # ];
      initExtra = '' 
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
      '';
    };
  };
}
