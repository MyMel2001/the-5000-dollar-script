#!/bin/bash

# Title: The 5,000 Dollar Script
# Description: Installs the Zorin "Pro" creative suite of FOSS apps via Flatpak.
# License: CC0 1.0 Universal

echo "Starting the \$5,000 professional software alternatives installation..."

# Check if Flatpak is installed
if ! command -v flatpak &> /dev/null
then
    echo "Flatpak could not be found. Please install it first."
    exit
fi

# Add Flathub if not present
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# The "Pro" App List
apps=(
  org.blender.Blender
  org.kde.kdenlive
  org.inkscape.Inkscape
  org.gimp.GIMP
  org.kde.krita
  org.freecadweb.FreeCAD
  org.darktable.Darktable
  net.scribus.Scribus
  com.obsproject.Studio
  org.ardour.Ardour
  com.github.johnfactotum.Foliate
  com.github.xournalpp.xournalpp
  org.gnome.gitlab.somas.Apostrophe
  io.github.alainm23.planify
  com.logseq.Logseq
  com.github.tchx84.Flatseal
)

echo "Installing ${#apps[@]} professional-grade applications..."

flatpak install flathub "${apps[@]}" -y

echo "Installation complete. Your system is now worth an extra \$5,000 in software value (according to Zorin logic)."
