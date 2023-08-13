{
home.file.".ssh/allowed_signers".text =
    "* ${builtins.readFile /home/fullzer4/.ssh/id_rsa.pub}";

programs.git = {
  enable = true;
  userName = "fullzer4";
  userEmail = "gabrielpelizzaro@gmail.com";
  extraConfig = {
    commit.gpgsign = true;
    gpg.format = "ssh";
    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    user.signingkey = "~/.ssh/id_rsa.pub";
  };
};
}
