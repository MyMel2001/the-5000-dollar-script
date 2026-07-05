#!/bin/bash

# Title: The 5,000 Dollar Script
# Description: Installs the Zorin "Pro" creative suite of FOSS apps via Flatpak.
# "Made to spite Zorin's dirty (yet totally legal) practice of selling FOSS apps and making them paid."
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
  org.freecad.FreeCAD
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
read -p "Select an option [1-3]: " office_choice

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

echo -e "\nWhich E-mail solution would you like?"
echo "1) Tuta"
echo "2) Thunderbird (Outlook alternative)"
echo "3) Both"
read -p "Select an option [1-3]: " email_choice

case $email_choice in
    1) apps+=(com.tutanota.Tutanota) ;;
    2) apps+=(org.mozilla.Thunderbird) ;;
    3) apps+=(org.mozilla.Thunderbird com.tutanota.Tutanota) ;;
    *) echo "Skipping E-Mail solutions..." ;;
esac

echo -e "\nType '42' for some apps useful for playing games exclusive to Retro systems and Windows."
echo "1) Tuta"
read -p "Select an option [42]: " gaming_choice

case $gaming_choice in
    42) apps+=(org.vinegarhq.Sober com.valvesoftware.Steam com.github.k4zmu2a.spacecadetpinball com.heroicgameslauncher.hgl org.libretro.RetroArch) ;;
    *) echo "Skipping Game stuff..." ;;
esac

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
