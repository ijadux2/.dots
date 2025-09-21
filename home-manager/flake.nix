
{
	description = "Home Manager flake for /home/ijadux2/.config/home-manager";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		flake-utils.url = "github:numtide/flake-utils";
	};


		outputs = { self, nixpkgs, home-manager, flake-utils, ... }:
			flake-utils.lib.eachDefaultSystem (system:
				let
					pkgs = import nixpkgs { inherit system; };
					homeConfig = home-manager.lib.homeManagerConfiguration {
						inherit pkgs;
						modules = [ ./home.nix ];
					};
				in {
					homeConfigurations = {
						ijadux2 = homeConfig;
					};
					packages = {
						homeConfigurations = {
							ijadux2 = homeConfig.activationPackage;
						};
						activationPackage = homeConfig.activationPackage;
					};
				});

}

