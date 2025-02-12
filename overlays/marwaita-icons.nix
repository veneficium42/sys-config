(self: super: {
  marwaita-icons = super.marwaita-icons.overrideAttrs ({
    dontCheckForBrokenSymlinks = true;
  });
})
