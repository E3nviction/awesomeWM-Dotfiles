function startpc
  sudo mkdir -p \
    /run/media \
    /run/media/enviction/ \
    /run/media/enviction/Projects/ \
    /run/media/enviction/Windows/
  sudo mount /dev/sda4 /run/media/enviction/Projects
  sudo mount /dev/sdb3 /run/media/enviction/Windows
  sudo systemctl start bluetooth.service
end
