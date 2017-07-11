#!/bin/sh
yum install git -y
pip install git+https://github.com/shadowsocks/shadowsocks.git@master
systemctl stop firewalld
systemctl disable firewalld

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
systemctl enable shadowsocks
systemctl start shadowsocks
