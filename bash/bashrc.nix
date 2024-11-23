{
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(fzf --bash)"
    '';

    bashrcExtra = ''
      fg="#CBE0F0"
      bg="#011628"
      bg_highlight="#143652"
      purple="#B388FF"
      blue="#06BCE4"
      cyan="#2CF9ED"

      # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
      # - The first argument to the function ($1) is the base path to start traversal
      # - See the source code (completion.{bash,zsh}) for the details.
      _fzf_compgen_path() {
        fd --hidden --exclude .git . "$1"
      }

      # Use fd to generate the list for directory completion
      _fzf_compgen_dir() {
        fd --type=d --hidden --exclude .git . "$1"
      }
    '';

    sessionVariables = {
      TEST_VAR = "hello_world";
      # --- setup fzf theme ---
      FZF_DEFAULT_OPTS="--color=fg:\${fg},bg:\${bg},hl:\${purple},fg+:\${fg},bg+:\${bg_highlight},hl+:\${purple},info:\${blue},prompt:\${cyan},pointer:\${cyan},marker:\${cyan},spinner:\${cyan},header:\${cyan}";

      # -- Use fd instead of fzf --

      FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git";
      FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND";
      FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git";
    };
  };
}