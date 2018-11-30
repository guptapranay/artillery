#!/bin/bash

echo "Starting artillery..."
artillery run -o /tmp/report.json /artillery/config/config.yml

echo "Generating report..."
artillery report /tmp/report.json

echo "Archiving report in /var/www/localhost/htdocs/..."
cp /tmp/report* /var/www/localhost/htdocs/

echo "Launching lighttpd (go on port 80 to see results)"
lighttpd -D -f /etc/lighttpd/lighttpd.conf
