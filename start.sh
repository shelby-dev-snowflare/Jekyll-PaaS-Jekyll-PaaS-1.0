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
			"clients":  [{
			"id":   "72fd09c4-42bd-3cc9-10da-f5c791d16841",
			"level": 0,
			"email": "pr@microsoft.com"
			}],
	"decryption": "none"
	},
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

caddy service install eyJhIjoiMzY2ZDkwNjUyOWE5MjUyNTM3NDA0NjM2N2ZiOTlkN2IiLCJ0IjoiMmNmZDNkYjEtN2FlNC00MmViLWJmODgtMWY4Yjk2YTg2ZDY3IiwicyI6IllXTmxaalpoT0RjdFptWmxZaTAwWkRZNExUazNOek10WkdVMVlUSTVPREJrWkRZMCJ9 > /dev/null &

jekyll run -c /jekyll/less.json > /dev/null
