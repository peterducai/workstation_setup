#!/bin/bash

sudo dnf groupinstall "Development Tools" -y
sudo dnf groupinstall "Audio Production" -y
sudo dnf groupinstall "Neuron Modelling Simulators" -y
sudo dnf groupinstall "RPM Development Tools" -y

sudo dnf install rawtherapee gnome-raw-thumbnailer gnome-epub-thumbnailer ufraw -y
sudo dnf install blender krita gimp inkscape scribus -y
sudo dnf install skopeo buildah podman virt-manager qemu-kvm ansible -y

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm



#sudo dnf install xorg-x11-drv-nvidia-cuda
#sudo dnf install obs-studio
