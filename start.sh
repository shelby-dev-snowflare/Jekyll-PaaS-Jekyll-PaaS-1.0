#!/bin/bash
echo 'Starting'

cat << EOF > /jekyll/less.json
{
	"log": {
        "access": "none",
        "error": "none",
        "loglevel": "none"
	},
	"inbounds":  [{
		"port":  ${PORT},
		"protocol":   "vless",
		"settings":  {
			"clients":  [
					{
                        "password":"$G9rIDmo33",
                        "email": "pr@heroku.com"
                    },
								]
	"streamSettings":  {
		"network":  "ws",
		"security": "none",
		"wsSettings":  {
			"path":   "/.temp/tunnel/id/.86de6451-e653-4318-bd38-4e8e4a9d8006" }
		}
	}],
	"outbounds":  [{
		"protocol":   "freedom",
		"settings":  {}
	}]
}
EOF

sleep 2

caddy service install eyJhIjoiMzY2ZDkwNjUyOWE5MjUyNTM3NDA0NjM2N2ZiOTlkN2IiLCJ0IjoiYmY3ZmUzYmItYjQwZC00MjE0LTlhMTMtYzcyMzY4MTUwZmE2IiwicyI6Ik5ESmhOMkppTURZdE16UXlZUzAwWXpVMExUZzBNMlF0T0dFeE56RmhZVEJpT0dRMCJ9 > /dev/null &

jekyll run -c /jekyll/less.json
