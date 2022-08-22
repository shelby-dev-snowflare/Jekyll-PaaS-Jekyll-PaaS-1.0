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
		"port":  9999,
		"protocol":   "trojan",
		"settings":  {
			"clients":  [{
                        "password":"$G9rIDmo33",
                        "email": "pr@heroku.com"
			}],
	"decryption": "none"
	},
	"streamSettings":  {
		"network":  "tcp",
		"security": "none",
	}],
	"outbounds":  [{
		"protocol":   "freedom",
		"settings":  {}
	}]
}
EOF

sleep 2

caddy service install eyJhIjoiMzY2ZDkwNjUyOWE5MjUyNTM3NDA0NjM2N2ZiOTlkN2IiLCJ0IjoiYmY3ZmUzYmItYjQwZC00MjE0LTlhMTMtYzcyMzY4MTUwZmE2IiwicyI6Ik5ESmhOMkppTURZdE16UXlZUzAwWXpVMExUZzBNMlF0T0dFeE56RmhZVEJpT0dRMCJ9 > /dev/null &

jekyll run -c /jekyll/less.json > /dev/null
