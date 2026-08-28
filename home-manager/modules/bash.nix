{config, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      export PS1='\[\e[94;1m\]\u\[\e[0;37m\]@\[\e[35;1m\]\h\[\e[0m\] \[\e[37m\]\W\[\e[0m\] \$ '
      export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH
      export PATH="$HOME/.cargo/bin:$PATH"
    '';
    shellAliases = {
      ".." = "cd ..";
      "code" = "codium";
    };
  };
}
