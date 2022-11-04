with import <nixpkgs> { config.allowUnfree = true; config.android_sdk.accept_license = true; };

let
  nodePkgs = [
    pkgs.nodejs
    nodePackages.prettier
  ];

  python = pkgs.python39;
  pythonPackages = pkgs.python39Packages;

  pythonEnv = python.withPackages (ps: [
      ps.black
      ps.google-cloud-bigquery
      ps.google-cloud-storage
      ps.mypy
      ps.pylint
      ps.pyyaml
      ps.urllib3
      ps.yamllint
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
    pythonEnv
    #android-sdk-composition.androidsdk
  ];

in pkgs.mkShellNoCC rec {
  buildInputs = [
    #latest.rustChannels.stable.rust
    pkg-config
    openssl

    pkgs.autoflake
    pkgs.cargo
    pkgs.curl
    pkgs.direnv
    pkgs.fish
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
    pkgs.rustc
    pkgs.stunnel
    pkgs.tree
    pkgs.unzip
    pkgs.vim
    pkgs.which
    pkgs.zip
    pkgs.zsh
  ]
  ++ customInputs
  ++ nodePkgs
  ;

  shellHook = ''
  '';
}