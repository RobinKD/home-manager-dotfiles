{
  description = "Home Manager configuration of keanu";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # AI stuff
    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs =
    { nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      llm-agents-pkgs = inputs.llm-agents.packages.${system};

      # Extra packages if I want some one day
      # extra-pkgs = {
    
      # };
    in
    {
      homeConfigurations."keanu" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
	# extraSpecialArgs = {
        #   extra-pkgs = extra-pkgs;
        # };
      };
    };
}
