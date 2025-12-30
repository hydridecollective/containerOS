{
  config,
  pkgs,
  ...
}:

{
  environment.etc."issue" = {
    source = pkgs.replaceVars ./resources/issue {
      CONTAINEROS_VERSION = config.hydride.containers.version.id;
    };
    mode = "0444";
  };

  systemd.services."getty@tty1" = {
    overrideStrategy = "asDropin";
    serviceConfig.ExecStart = [
      ""
      "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${config.services.getty.loginProgram} --autologin hydride-containers --noclear --keep-baud %I 115200,38400,9600 $TERM"
    ];
  };
}
