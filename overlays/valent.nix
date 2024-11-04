final: prev: {
  valent = prev.valent.overrideAttrs (old: {
    nativeBuildInputs =
      old.nativeBuildInputs
      ++ (with prev.pkgs; [
        vala
      ]);
    buildInputs =
      old.buildInputs
      ++ (with prev.pkgs; [
        libportal
        libportal-gtk4
        tinysparql
        gdk-pixbuf
        libphonenumber
      ]);
    version = "v1.0.0.alpha.46";
    src = prev.fetchFromGitHub {
      owner = "andyholmes";
      repo = "valent";
      rev = "165a2791d4bf3e7dee69e3dd7885dbe4948265b9";
      hash = "sha256-7klvOvwyAg+Xno6zWo8UByjaS9OkOuCceuZcAIEgdyU=";
      fetchSubmodules = true;
    };
  });
}
