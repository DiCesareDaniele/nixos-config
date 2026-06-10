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
      fzf = {
        enable = true;
        defaultOptions = ["--bind ctrl-y:accept"];
      };
      starship = enabled;
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
        dotDir = "${config.xdg.configHome}/zsh";
        history = {
          size = 10000;
          ignoreAllDups = true;
          ignoreDups = true;
          saveNoDups = true;
          findNoDups = true;
          append = true;
          share = true;
        };
        plugins = [
          {
            name = "fzf-tab";
            src = pkgs.fetchFromGitHub {
              owner = "Aloxaf";
              repo = "fzf-tab";
              rev = "v1.3.0";
              sha256 = "sha256-8atbysoOyCBW2OYKmdc91x9V/Mk3eyg3hvzvhJpQ32w=";
            };
          }
        ];
        initContent = '' 
          bindkey '^p' history-search-backward
          bindkey '^n' history-search-forward

          bindkey -r '^Y'
          bindkey '^Y' fzf-completion

          # do not disable tab for now (maybe in the future)
          # zstyle ':fzf-tab:*' fzf-bindings \
          #   'ctrl-y:accept' \
          #   'tab:ignore' \
          #   'utab:ignore'
          zstyle ':fzf-tab:*' fzf-bindings 'ctrl-y:accept'

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

          eval "$(starship init zsh)"
        '';
      };
    };
  };
}
