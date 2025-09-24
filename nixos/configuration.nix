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
    vscode
    foot
    nemo

  # Utils
  	wget
  	git
  	tree
  	exfatprogs
  	brightnessctl
  	pamixer
  	libnotify
  	fzf

  # Extra
    htop
    cava
    kitty              
    lf
    killall
    termusic
    onefetch
    tty-clock
    cmatrix
    nwg-look
    zsh
    wlogout

  # Preview - Editor
		viewnior
		ffmpeg
		mpv

  # Code Extra
    openjdk17
    nodejs
    gcc
    cjson
    sassc

  # Database
    php83
    apacheHttpd

  # Compress - Extract
  	file-roller
  	gnutar
  	gzip
  	bzip2
  	xz
  	p7zip
  	unrar

  # Hyprland
    hyprland          
    xwayland			   
    waybar             
    swww
    rofi-wayland              
    grim               
    slurp
    swaynotificationcenter

  # Pentest
  	aircrack-ng
   ];

  # Default mount
  fileSystems."/mnt/Shared" = {
    device = "/dev/disk/by-uuid/6CC9-D17C";
    fsType = "exfat";
    options = [ "defaults" "uid=1000" "gid=1000" ];
  };
  
   
  system.stateVersion = "25.05";
}
