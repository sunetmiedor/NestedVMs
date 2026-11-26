#Install VM dependencies
apt update
apt install -y qemu-kvm qemu-system libvirt-daemon-system libvirt-clients bridge-utils
#start libvirt daemon(to manage VMs)
systemctl start libvirtd