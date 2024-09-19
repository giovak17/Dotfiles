# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      # Include the postgresql file
      #./postgresql.nix
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  #networking.wireless.iwd.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  services.atd.enable = true;
   
  # services.dnsmasq.enable = true;
  # services.dnsmasq.alwaysKeepRunning = true;
  # services.dnsmasq.settings.server = [ "208.67.222.123" "208.67.220.123"];
  # services.dnsmasq.settings = { cache-size = 500; };
  
  # Set your time zone.
  time.timeZone = "America/Tijuana";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.giovak = {
    isNormalUser = true;
    description = "giovak";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

  users.users.delayed-admin = {
    isNormalUser = true;
    description = "delayed-admin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  

  #Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
    
  # Changing shell to ZSH
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;


  #Greeter greetd
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --cmd Hyprland";
        user = "giovak";
      };
    };
  };  


  #services.mongodb = {
    #enable = true;
  #};


  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };


    nix.extraOptions = ''
        experimental-features = nix-command
        '';



  #BT stuff
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
      Enable = "Source,Sink,Media,Socket";
    };
  };

  # USing bluetooth headset button to control media player
  systemd.user.services.mpris-proxy = {
    description = "Mpris proxy";
    after = [ "network.target" "sound.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
};

  virtualisation.virtualbox.host.enableKvm = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     # Paste in nvim
     wl-clipboard
     wget
     waybar
     dunst
     libnotify
     kitty
     wofi
     swww
     anki
     qbittorrent
     vlc
     zip
     unzip
     unrar
     cinnamon.nemo
     auto-cpufreq
     brightnessctl
     zsh
     git
     curl
     gcc
     clang
     clang-tools
     fastfetch
     lunarvim
     yazi
     unclutter
     pavucontrol
     libreoffice-fresh
     btop
     bat
     greetd.greetd
     greetd.tuigreet
     emmet-ls
     postman
     fzf
     zellij
     # With this one i can open files in nvim
     xdg-utils
     python3
     python311Packages.pip
     evtest
     brave
     nodejs_22
     go
     air
     starship
     sqlite
     appimage-run
     pgcli
     pgadmin4
     mycli
     android-tools
     hyprshot
     # Lutris crap
     lutris-unwrapped
     wineWowPackages.waylandFull
     wineWowPackages.stable
     winetricks
     dxvk
     at
     docker_27
     gnumake
  ];


  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    udev-gothic-nf
  ];


  programs.direnv.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
  "electron-25.9.0"
  ];

  programs.neovim.defaultEditor=true;

  programs.steam.enable = true;

  programs.hyprland.enable = true;
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  #Make sound work again
  boot.kernelParams = [ "snd-intel-dspcfg.dsp_driver=1" ];

  # LEMP, XAMPP equivalent
  services.httpd.adminAddr = "localhost";

  services.httpd.virtualHosts."localhost" = {
   documentRoot = "/var/www/html";
   # want ssl + a let's encrypt certificate? add forceSSL = true; right here
  };


#Already had a swap so i commented it out
  # Swap file 
 #swapDevices = [ {
    #device = "/var/lib/swapfile";
    #size = 12*1024;
  #} ];


  


  # Custom DNS
  #environment.etc = {
    #"resolv.conf".text = "nameserver 208.67.222.123\n nameserver 208.67.220.123";
  #};
  

  networking.firewall.allowPing = true;
  networking.firewall.allowedTCPPorts = [ 80 443 9512 9511 25000 27017 1883 ];

  # apache
   services.httpd.enable = true;
   services.httpd.package = pkgs.apacheHttpd;

  #php
  services.httpd.enablePHP = true;
  services.httpd.phpPackage = pkgs.php;

  #mysql
  services.mysql.enable = true;
  services.mysql.package = pkgs.mariadb;

  # end LEMP

  #Docker
  virtualisation.docker.enable = true;



  # Supposed to enable VULKAN
  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;

  #postgresql
  # services.postgresql = {
  #   settings = {
  #     listen_addresses = "*";  
  #   };
  #   enable = true;
  #   enableTCPIP = true;
  #   authentication = pkgs.lib.mkOverride 10 ''
  #     local all       all     trust
  #     host all all      ::1/128      trust
  #     host all postgres 127.0.0.1/32 trust
  #     host all giovak 127.0.0.1/32 trust
  #   '';
  # };

  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.auto-cpufreq.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  networking.firewall.allowedUDPPorts = [];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?


}
