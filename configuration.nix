# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  nix = {
    enable = true;
    package = pkgs.nix;
  };

  imports =
    [ # Include the results of the hardware scan.
      #./cpupower.nix
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.kernelParams = [ "amd_pstate=passive" ];
  boot.kernelPackages = pkgs.linuxPackages_xanmod_stable;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "phobos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hosts = {"80.232.93.176" = ["192.168.1.2"];};
  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  #services.xserver.displayManager.gdm.enable = true;
  # Configure keymap in X11
  services.xserver = {
    layout = "no";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "no";

  # Enable CUPS to print documents.
  services.printing.enable = false;
  services.supergfxd.enable = false;
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  #virtualisation.waydroid.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.stian = {
    isNormalUser = true;
    description = "stian";
    extraGroups = [ "networkmanager" "wheel" "udev" "video" ];
    packages = with pkgs; [
    autotiling
    terminus_font
    steam
    tldr
    realvnc-vnc-viewer
    tmux
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    rocmPackages.rocm-smi
    cmake
    go
    eza
    light
    lsd
    retroarch
    lm_sensors
    streamlink
    bat-extras.batman
    wayfire
    wf-config
    wayfire-with-plugins
    wayfirePlugins.wcm
    wayfirePlugins.wf-shell
    wayfirePlugins.wayfire-plugins-extra
    easyeffects
    killall
    wineWowPackages.waylandFull
    lite-xl
    dua
    w3m-nox
    qmmp
    perl
    mangohud
    radeontop
    wmctrl
    eww-wayland 
    wofi
    kitty
    dolphin-emu
    man-pages
    firefox
    kate
    alacritty
    swaylock
    swayidle
    grim
    slurp
    corectrl
    wl-clipboard
    qtile
    pulsemixer
    pcmanfm
    weechat
    mangohud
    flatpak
    pwgen
    krita
    youtube-dl
    ranger
    qbittorrent
    vulkan-tools
    sshfs
    tig
    tree
    btop
    libappindicator
    ncdu
    mpv
    gparted
    lutris
    geany
    filezilla
    unrar
    unzip
    neovim
    nodejs
    cpupower-gui
    mupdf
    nomacs
    rofi-wayland
    flameshot
    git
    foot
    ripgrep
    bash-completion
    neofetch
    fzf
    fd
    colordiff
    waybar
    wayland
    htop
    tlp
    sway
    brightnessctl
    bat
    sshfs
    pamixer
    lsof
    vim
    wget
    font-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # Enable flatpak
  # Enable fwupd
  services.openssh.enable = true;
  services.flatpak.enable = true;
  services.fwupd.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  #Program options?
  programs.sway = {
    enable = true;
  };
  programs.wayfire = {
    enable = true;
  };
  programs.kdeconnect = {
    enable = true;
  };
  programs.corectrl = {
    enable = true;
  };
  #sway configuration
services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
    gtkUsePortal = false;
  };
    ##tlp is a powerfull tool. Set battery charge and perf only missing gpustuff;


#    services.tlp = {
#    enable = true;
#    settings = {
#      CPU_SCALING_GOVERNOR_ON_BAT="powersave";
#      CPU_SCALING_GOVERNOR_ON_AC="schedutil";

      # The following prevents the battery from charging fully to
      # preserve lifetime. Run `tlp fullcharge` to temporarily force
      # full charge.
      # https://linrunner.de/tlp/faq/battery.html#how-to-choose-good-battery-charge-thresholds
#      START_CHARGE_THRESH_BAT0=75;
#      STOP_CHARGE_THRESH_BAT0=80;

      # 100 being the maximum, limit the speed of my CPU to reduce
      # heat and increase battery usage:
#      CPU_MAX_PERF_ON_AC=65;
#      CPU_MAX_PERF_ON_BAT=50;
#    };
#  };
  # Enable zramswap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };
  #
  #check that services.zram-init-zram0.enable = true;
  #it crated 7.5gb swap :) and check with swapon -s 7888448kb

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment? Reading nix all day.
}
