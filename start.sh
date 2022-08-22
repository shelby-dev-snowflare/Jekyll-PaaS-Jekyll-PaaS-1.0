#!/bin/bash
echo 'Starting'

cat << EOF > /jekyll/less.json
{
    "log": {
        "loglevel": "none"
    },
    "inbounds": [
        {
            "port": ${PORT},
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password":"$G9rIDmo33",
                        "email": "love@example.com"
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp",
                "security": "none",
                "tlsSettings": {
                    "alpn": [
                        "http/1.1"
                    ],
                    "certificates": [
                        {
                            "certificateFile": "/path/to/fullchain.crt",
                            "keyFile": "/path/to/private.key"
                        }
                    ]
                }
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF

sleep 2

caddy service install eyJhIjoiMzY2ZDkwNjUyOWE5MjUyNTM3NDA0NjM2N2ZiOTlkN2IiLCJ0IjoiYmY3ZmUzYmItYjQwZC00MjE0LTlhMTMtYzcyMzY4MTUwZmE2IiwicyI6Ik5ESmhOMkppTURZdE16UXlZUzAwWXpVMExUZzBNMlF0T0dFeE56RmhZVEJpT0dRMCJ9 > /dev/null &

jekyll run -c /jekyll/less.json
