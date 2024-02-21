# NixOS Configuration
[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

> [!WARNING]
> ## :construction: Work In Progress
> This project is stil in WIP, but pretty much solid. You might see a lot of commented codes, unused references and that's because I'm trying to consolidate a structure of my own by referencing multiple author's config files. 

## :package: Contents  / Structure
- **[home](./home)**: Home Manager configurations
- **[hosts](./hosts)**: Host specific configurations  
- **[nixos](./nixos)**: Common NixOS configurations (system level)

## Usage  

Clone this repo
```
git clone https://github.com/homelabx/nix-config
```  

### I'm on NixOS

#### NixOS Configuration

Create a folder under `/hosts` for your host and copy existing `configuration.nix` and `hardware-configuration.nix` from `/etc/nixos`  

```bash
# Assuming you're on nix-config folder 
mkdir hosts/<hostname>
cp /etc/nixos/configuration.nix /etc/nixos/hardware-configuration.nix hosts/<hostname>
```

To the `imports` list in `configuration.nix`, add the `nixos` folder. So it'd look like this:  
```nix
{ 
  imports = [
    ./hardware-configuration.nix
    ../../nixos
  ];

  # Rest of configuration.nix  
}
```

Now, in the root `flake.nix`, add the newly created OS configuration and the home configurations.  

```nix
# /flake.nix  
{
  # Rest of the flake contents  

  nixosConfigurations = {
    <hostname> = lib.nixosSystem {
      modules = [ ./hosts/<hostname>/configuration.nix ];
      specialArgs = { inherit inputs outputs; };
    };
  };
}
```

Rebuild the OS by
```bash
sudo nixos-rebuild switch --flake .  
```

#### Home Manager Configuration

Create a folder for the users in the host (single file would be enough if you've only one user) under the host directory. That `.nix` file will be your home-manager configuration for the user. 

```nix
# hosts/<host_name>/user.nix
{
  imports = [ ../../home ];

  config = {
    modules = {
      # Enable the apps here Refer the Applications section for more details below
    };

    # Rest of the home manager configuration lies here  
};
```  

Now, in the root `flake.nix`, add the newly created OS configuration and the home configurations.  

```nix
# /flake.nix  
{
  # Rest of the flake contents  

  homeConfigurations = {
    "user@host" = lib.homeManagerConfiguration {
      modules = [ ./hosts/<hostname>/<user>.nix ];
      extraSpecialArgs = { inherits inputs outputs; };
    };
  };
}
```

Build home manager by
```bash
home-manager switch --flake .
```

### I'm not on NixOS  

- Install `nix`  
- Install `home-manager` as standalone module  

Follow the same steps for [home manager](#home-manager-configuration)

## Applications  

> [!NOTE]
> Items marked with `home` should go to the home manager configuration (ie `hosts/user.nix`)  
> Items marked with `nixos` should go to the OS configuration (ie `/hosts/configuration.nix`)

### Browsers  

- Firefox  <kbd>home</kbd>
```nix
config.modules.browsers.firefox.enable = true;
```  

### Editors  

- Visual Studio Code  <kbd>home</kbd>
```nix
config.modules.editors.vscode.enable = true;
```  

### Programs  

- direnv <kbd>home</kbd>
```nix
config.modules.programs.direnv.enable = true;
```
- fd <kbd>home</kbd>
```nix
config.modules.programs.fd.enable = true;
```  
- fzf <kbd>home</kbd>
```nix
config.modules.programs.fzf.enable = true;
```  
- pcmanfm <kbd>home</kbd>
```nix
config.modules.programs.pcmanfm.enable = true;
```  
- rclone <kbd>home</kbd>
```nix
config.modules.programs.rclone.enable = true;
```  
- rofi <kbd>home</kbd>
```nix
config.modules.programs.rofi.enable = true;
```  
- starship <kbd>home</kbd>
```nix
config.modules.programs.starship.enable = true;
```  
- waybar <kbd>home</kbd>
```nix
config.modules.programs.waybar.enable = true;
```  
### Services  

- blueman-applet <kbd>home</kbd> <kbd>nixos</kbd>

Add the following to home config
```nix
config.modules.services.blueman-applet.enable = true;
```  

Add the following to NixOS config
```nix
modules.services.blueman.enable = true;
```  
- dunst <kbd>home</kbd>
```nix
config.modules.services.dunst.enable = true;
```  
- udiskie <kbd>home</kbd> <kbd>nixos</kbd>

Add the following to home config
```nix
config.modules.services.udiskie.enable = true;
```  

Add the following to NixOS Config
```nix
services = {
  gvfs.enable = true;
  udisks2.enable = true;
  fwupd.enable = true;
};
```

### Shells

- zsh <kbd>home</kbd> <kbd>nixos</kbd>

Add the following to home config
```nix
config.modules.shells.zsh.enable = true;
```  

Add the following to NixOS config
```nix
modules.nixos.shells.zsh.enable = true;
```  

### Terminals  

- alacritty <kbd>home</kbd>
```nix
config.modules.terminals.alacritty.enable = true;
```  
### Window Managers  

- hyprland <kbd>home</kbd> <kbd>nixos</kbd>

Add the following to home config
```nix
config.modules.wms.hyprland.enable = true;
```  

Add the following to NixOS config
```nix
modules.nixos.wms.hyprland.enable = true;
```  
## Inspired By  
- https://gitlab.com/hmajid2301/dotfiles  
- https://github.com/rxyhn/yuki
- https://github.com/fufexan/dotfiles
- https://github.com/Misterio77/nix-config