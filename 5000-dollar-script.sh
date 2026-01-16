#!/bin/bash

# Title: The 5,000 Dollar Script
# Description: Installs the Zorin "Pro" creative suite of FOSS apps via Flatpak.
# License: CC0 1.0 Universal

echo "-------------------------------------------------------"
echo "Starting the \$5,000 professional software alternatives installation..."
echo "-------------------------------------------------------"

# Check if Flatpak is installed
if ! command -v flatpak &> /dev/null
then
    echo "Flatpak could not be found. Please install it first."
    exit
fi

# Add Flathub if not present
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Base apps (The creative & productivity core)
apps=(
  org.blender.Blender
  org.kde.kdenlive
  org.inkscape.Inkscape
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

# Choice: Office Suite
echo "Which Office Suite would you like?"
echo "1) LibreOffice (Standard)"
echo "2) OnlyOffice (Best MS Office compatibility)"
echo "3) Both"
echo "4) None"
read -p "Select an option [1-4]: " office_choice

case $office_choice in
    1) apps+=(org.libreoffice.LibreOffice) ;;
    2) apps+=(org.onlyoffice.desktopeditors) ;;
    3) apps+=(org.libreoffice.LibreOffice org.onlyoffice.desktopeditors) ;;
    *) echo "Skipping Office Suite..." ;;
esac

# Choice: Graphics
echo -e "\nWhich Image Editors would you like?"
echo "1) GIMP (Photo manipulation)"
echo "2) Krita (Digital painting)"
echo "3) Both"
read -p "Select an option [1-3]: " image_choice

case $image_choice in
    1) apps+=(org.gimp.GIMP) ;;
    2) apps+=(org.kde.krita) ;;
    3) apps+=(org.gimp.GIMP org.kde.krita) ;;
    *) echo "Skipping Image Editors..." ;;
esac

# Choice: Email
echo -e "\nWould you like to install Thunderbird (Email & Calendar)?"
read -p "Install Thunderbird? [y/N]: " thunder_choice
if [[ "$thunder_choice" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    apps+=(org.mozilla.Thunderbird)
fi

echo -e "\nInstalling ${#apps[@]} professional-grade applications..."

flatpak install flathub "${apps[@]}" -y

echo "-------------------------------------------------------"
echo "Removing excecss bloat, this should only take a few moments..."
echo "-------------------------------------------------------"

flatpak uninstall --unused -y

echo "-------------------------------------------------------"
echo "Installation complete. Your system is now worth an extra \$5,000"
echo "in software value (according to Zorin logic)."
echo "-------------------------------------------------------"
