{ lib }: {
  initialHashedPassword = "$7$CU..../....rXsJS9iKCfbKKvOcFKmQA.$nln7KPAYBfH/T4b.pAdhgiyYQJj5Z3HqzVf9ymtZ3A8";
  networking = import ./networking.nix { inherit lib; };
  useremail = "ryan@ryanmacdonald.io";
  userfullname = "Ryan Macdonald";
  username = "ryan";
}
