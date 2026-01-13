# docker
wget https://download.docker.com/linux/static/stable/x86_64/docker-29.1.4.tgz -qO- | tar xvfz - docker/docker --strip-components=1
sudo cp -rp ./docker /usr/local/bin/ && rm -r ./docker
