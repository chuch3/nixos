{...}: {
  programs.git = {
    enable = true;
    settings = {
      user.email = "polychch3@gmail.com";
      user.name = "chuch3";
      pull.rebase = false;
    };
    ignores = [
      ".ccls-cache"
      ".direnv"
      ".envrc"
    ];
  };
}
