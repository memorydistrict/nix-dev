{
	description = "Development environments";

	inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

	outputs = { nixpkgs, ... }: let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };
	in {
		devShells.${system} = {
			web = pkgs.mkShell {
				packages = [
					pkgs.nodejs_latest
					pkgs.fish
				];
				shellHook = ''
					exec fish
				'';
			};
			powershell = pkgs.mkShell {
				packages = [
					pkgs.powershell
				];
				shellHook = ''
					exec pwsh
				'';
			};
		};
	};
}

# --------------------------- #
# Vim modline (do not remove)
# vim: ts=4 sts=4 sw=4
