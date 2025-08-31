{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  # Define your host
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rascal = {
    isNormalUser = true;
    description = "Ra$caL";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Install firefox.
  programs.firefox.enable = true;
  
  # Hyprland program toggle
  programs.hyprland.enable = true;
  
   nix.settings.experimental-features = [ "nix-command" "flakes" ];
   nixpkgs.config.allowUnfree = true;

   environment.systemPackages = with pkgs; [
   # Basic
	    micro
	    wget
	    vscode
	    git
	    tree
	    htop
	    cava
	    xwayland
	    foot
	    killall
	    lf

	# Preview - Editor
		viewnior
		ffmpeg
		mpv

    # Code Extra
	    openjdk17
	    nodejs
	    php83
	    mariadb

    # Extractor
    	# zip unzip 
    	# gnutar 
    	# rar unrar 
    	# p7zip
    	file-roller
    	gnutar
    	gzip
    	bzip2
    	xz
    	p7zip
    	unrar

	# Hyprland
	    hyprland          
	    waybar             # panel (taskbar)
	    wofi               # launcher
	    kitty              # terminal
	    mako               # notifications
	    grim               # screenshot
	    slurp
	    swww			   # background
   ];
   
  system.stateVersion = "25.05";
}
