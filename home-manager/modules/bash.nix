{ config, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      export PS1="\[\e[1;33m\]\u\[\e[0;37m\]@\[\e[1;32m\]\h\[\e[0m\] \[\e[94m\]\W\[\e[0m\] \\$ "
    '';
    shellAliases = {
      ".." = "cd ..";
    };
  };
}
