{...}: {
	
  # Enable CUPS to print documents.
  services.printing = {
		enable = true;
	};

	services.avahi = {
  	enable = true;
  	nssmdns4 = true;  # Enable mDNS hostname resolution
	};

}
