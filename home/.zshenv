[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# NixOS: Home Manager session variables (no-op on Arch).
for hm_vars in "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh" \
               "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"; do
  [ -f "$hm_vars" ] && . "$hm_vars" && break
done
unset hm_vars
