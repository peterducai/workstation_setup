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
    
sudo dnf install vlc no-more-secrets code-editor geteltorito genisoimage texlive-* powershell -y
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
sudo dnf install coreos-installer -y


flatpak install flathub io.dbeaver.DBeaverCommunity -y
flatpak install flathub com.visualstudio.code
flatpak install flathub org.gnome.Builder


coreos-installer download --stream stable --platform qemu --decompress  --format qcow2.xz
sudo mv fedora-coreos-qemu.qcow2 /var/lib/libvirt/images/fedora-coreos-qemu.qcow2

# $ vim fcos.fcc 
# variant: fcos
# version: 1.0.0
# passwd:
#   users:
#     - name: core
#       ssh_authorized_keys:
#         - ssh-rsa <ssh-pub-key>
        
# $ podman pull quay.io/coreos/fcct
# $ podman run -i --rm quay.io/coreos/fcct -pretty -strict <fcos.fcc > fcos.ign
# $ podman run --rm -i quay.io/coreos/ignition-validate - < fcos.ign

# virt-install -n fcos --vcpus 2 -r 2048 \
#   --os-variant=fedora31 --import \
#   --network bridge=virbr0 \
#   --disk=/var/lib/libvirt/images/fedora-coreos-qemu.qcow2,format=qcow2,bus=virtio \
#   --noautoconsole \
#   --qemu-commandline="-fw_cfg name=opt/com.coreos/config,file=/path/to/fcos.ign"

