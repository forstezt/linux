echo "America/$1" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
