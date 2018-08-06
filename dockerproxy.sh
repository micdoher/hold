touch http-proxy.conf
cat > http-proxy.conf << EOF
[Service]
Environment="HTTP_PROXY=http://proxy.esl.cisco.com:8080"
Environment="HTTPS_PROXY=http://proxy.esl.cisco.com:8080"
Environment="NO_PROXY=127.0.0.1,localhost
EOF
sudo mkdir /etc/systemd/system/docker.service.d
sudo cp http-proxy.conf /etc/systemd/system/docker.service.d/http-proxy.conf
sudo systemctl daemon-reload
sudo service docker restart

# sudo systemctl show --property Environment docker
