# Careful about copy/pasting, Makefiles want tabs!
# But you're not copy/pasting, are you?
.PHONY: update
update:
	home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#mathipe --show-trace

.PHONY: clean
clean:
	nix-collect-garbage -d
