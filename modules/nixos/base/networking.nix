{
  # Network discovery, mDNS
  # With this enabled, you can access your machine at <hostname>.local
  # it's more convenient than using the IP address.
  # https://avahi.org/
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      domain = true;
      enable = true;
      userServices = true;
    };
  };

  # Use an NTP server located in the mainland of Australia to synchronize the system time
  networking.timeServers = [
    "0.au.pool.ntp.org"
    "1.au.pool.ntp.org"
    "2.au.pool.ntp.org"
    "3.au.pool.ntp.org"
  ];
}
