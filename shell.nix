with import <nixpkgs> { config.allowUnfree = true; config.android_sdk.accept_license = true; };

let
  nodePkgs = [
    pkgs.nodejs
    nodePackages.prettier
  ];

  # TODO: use the rust overlay provided by rust
  #rustPkgs = [
  #  pkgs.cargo
  #  pkgs.rustc
  #];

  myPython = pkgs.python311.withPackages (ps: [
    ps.black
    ps.mypy
    ps.pip
    ps.pylint
    ps.wheel
  ]);

  # TODO: this needs fixing
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
    #nodePkgs
    myPython
    #android-sdk-composition.androidsdk
  ];

in pkgs.mkShell rec {
  buildInputs = [
    pkgs.ansifilter
    pkgs.bash
    pkgs.black
    pkgs.buf
    pkgs.curl
    pkgs.direnv
    pkgs.exa
    pkgs.fd
    pkgs.fish
    pkgs.git
    pkgs.glow
    pkgs.grpcurl
    pkgs.htop
    pkgs.jq
    pkgs.man
    pkgs.moreutils
    pkgs.openssh
    pkgs.pkg-config
    pkgs.postgresql
    pkgs.protobuf
    pkgs.ps
    pkgs.ripgrep
    pkgs.tree
    pkgs.vim
  ]
  ++ customInputs
  ;

  shellHook = ''
  '';
}
