#!/bin/sh
yum install git python-pip -y
command -v pip >/dev/null 2>&1 || {
  curl -O https://bootstrap.pypa.io/get-pip.py
  python get-pip.py
}
pip install --upgrade pip
pip install git+https://github.com/shadowsocks/shadowsocks.git@master
systemctl stop firewalld
systemctl disable firewalld

rm -rf /usr/lib/systemd/system/shadowsocks.service

cat >> /usr/lib/systemd/system/shadowsocks.service <<EOF
[Unit]
Description=Shadowsocks Server
After=network.target

[Service]
PermissionsStartOnly=true
ExecStartPre=/bin/mkdir -p /run/shadowsocks
ExecStartPre=/bin/chown nobody:nobody /run/shadowsocks
ExecStart=/usr/bin/ssserver -p $1 -k $2 -m aes-256-cfb
Restart=on-abort
User=nobody
Group=nobody
UMask=0027

[Install]
WantedBy=multi-user.target
EOF
systemctl stop shadowsocks
systemctl enable shadowsocks
systemctl start shadowsocks

echo "port:$1 password:$2 aes-256-cfb"
echo "enjoy your shadowsocks service"
