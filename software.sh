#!/bin/bash

sudo dnf groupinstall "Development Tools" -y
sudo dnf groupinstall "Audio Production" -y
sudo dnf groupinstall "Neuron Modelling Simulators" -y
sudo dnf groupinstall "RPM Development Tools" -y

VERSION=1.14
sudo dnf module enable cri-o:$VERSION
sudo dnf install cri-o -y

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
    
sudo dnf install vlc no-more-secrets code-editor geteltorito genisoimage texlive-* -y
sudo dnf install rawtherapee gnome-raw-thumbnailer gnome-epub-thumbnailer ufraw fltk fltk-devel gnome-tweaks -y
sudo dnf install blender krita gimp inkscape scribus java-latest-openjdk-devel cmake clang llvm qtcreator -y
sudo dnf install skopeo buildah podman virt-manager qemu-kvm ansible nodejs postgres -y


sudo dnf install dotnet-sdk-3.0 -y


# dotnet new console -o console
# $ cd console
# $ dotnet publish
# $ bin/Debug/netcoreapp3.0/publish/console

#sudo dnf install xorg-x11-drv-nvidia-cuda
#sudo dnf install obs-studio

sudo flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.dbeaver.DBeaverCommunity -y
flatpak install flathub com.visualstudio.code
flatpak install flathub org.gnome.Builder
