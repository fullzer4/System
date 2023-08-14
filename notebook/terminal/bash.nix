{
  programs.bash.initExtra = ''
    if [ "$(tty)" = "/dev/tty1" ];then
      exec Hyprland
    fi
  '';
}
