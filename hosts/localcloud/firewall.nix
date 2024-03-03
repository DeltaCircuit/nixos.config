{
  networking.nftables = {
    enable = true;
    ruleset = ''
      table inet filter {
        type filter hook input priority 0; policy drop;

        # Allow localhost traffic
        iifname "lo" accept

        # Allow established/ related comms
        ct state related,established accept

        # Allow SSH
        tcp dport 22 accept

        # Drop invalid packets
        ct state invalid drop

        reject
      }

      chain forward {
        type filter hook forward priority 0; policy drop;
      }

      chain output {
        type filter hook output priority 0; policy accept;
      }
    '';
  };
}
