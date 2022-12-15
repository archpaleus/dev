with import <nixpkgs> { config.allowUnfree = true; config.android_sdk.accept_license = true; };

let
  nodePkgs = [
    pkgs.nodejs
    nodePackages.prettier
  ];

  rustPkgs = [
    pkgs.cargo
    pkgs.rustc
  ];

  myPython = pkgs.python39.withPackages (ps: [
    ps.black
    ps.mypy
    ps.pip
    ps.pylint
    ps.wheel
  ]);

  android-sdk-composition = pkgs.androidenv.composeAndroidPackages {
    # Regenerate via nixpkgs/pkgs/development/mobile/androidenv/generate.sh
    toolsVersion = "26.1.1";
    platformToolsVersion = "33.0.3";
    buildToolsVersions = [ "32.0.0" ];
    includeEmulator = false;
    platformVersions = [ "33" ];
    includeSources = false;
    includeSystemImages = false;
    abiVersions = [ "arm64-v8a" ];
    includeNDK = false;
    useGoogleAPIs = false;
    useGoogleTVAddOns = false;
    includeExtras = [
        "extras;google;gcm"
    ];
  };

  customInputs = [
    nodePkgs
    myPython
    rustPkgs
    #android-sdk-composition.androidsdk
  ];

in pkgs.mkShell rec {
  buildInputs = [
    pkgs.curl
    pkgs.direnv
    pkgs.exa
    pkgs.fish
    pkgs.fd
    pkgs.git
    pkgs.glow
    pkgs.grpcurl
    pkgs.htop
    pkgs.jq
    pkgs.killall
    pkgs.less
    pkgs.man
    pkgs.moreutils
    pkgs.openssh
    pkgs.pipenv
    pkgs.pkg-config
    pkgs.postgresql
    pkgs.protobuf
    pkgs.ps
    pkgs.ripgrep
    pkgs.rsync
    pkgs.stunnel
    pkgs.openssl
    pkgs.tree
    pkgs.unzip
    pkgs.vim
    pkgs.which
    pkgs.zip
    pkgs.zsh
  ]
  ++ customInputs
  ;

  shellHook = ''
  '';
}
