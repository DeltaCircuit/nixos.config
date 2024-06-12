function upgrade(){

  # Eelevate Privilages
  sudo -s 
  # Pushd
  pushd $HOME/.config/nixos

  # Update Flakes
  nix flake update

  # Rebuild
  sudo nixos-rebuild switch --flake . 
  
  # Reload HM
  home-manager switch --flake .

  # Exit
  popd
}

