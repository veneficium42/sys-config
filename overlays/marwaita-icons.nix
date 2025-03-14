(self: super: {
  marwaita-icons = super.marwaita-icons.overrideAttrs ({
    dontWrapQtApps = true;
    dontCheckForBrokenSymlinks = true;
  });
})
