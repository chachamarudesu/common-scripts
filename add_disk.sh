disk_path="$1"
lsblk
sudo parted ${disk_path} -s mklabel gpt
sudo parted ${disk_path} mkpart primary btrfs 0% 100%
lsblk
sudo mkfs -t btrfs ${disk_path}1
echo "${disk_path}1              /var/lib/docker          btrfs   defaults        0 0" | sudo tee -a /etc/fstab
