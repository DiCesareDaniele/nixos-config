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
    programs = {
      fzf = enabled; 
      oh-my-posh = {
        enable = true;
        useTheme = "catppuccin_mocha";
      };
      zsh = {
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
        plugins = [
          {
            name = "fzf-tab";
            src = pkgs.fetchFromGitHub {
              owner = "Aloxaf";
              repo = "fzf-tab";
              rev = "6aced3f35def61c5edf9d790e945e8bb4fe7b305";
              sha256 = "EWMeslDgs/DWVaDdI9oAS46hfZtp4LHTRY8TclKTNK8=";
            };
          }
        ];
        initExtra = '' 
          zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
          # disable sort when completing `git checkout`
          zstyle ':completion:*:git-checkout:*' sort false
          # set descriptions format to enable group support
          # NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
          zstyle ':completion:*:descriptions' format '[%d]'
          # set list-colors to enable filename colorizing
          zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
          # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
          zstyle ':completion:*' menu no
          # preview directory's content when completing
          zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
          zstyle ':fzf-tab:complete:ls:*' fzf-preview 'ls --color $realpath'
          # switch group using `<` and `>`
          zstyle ':fzf-tab:*' switch-group '<' '>'
        '';
      };
    };
  };
}
