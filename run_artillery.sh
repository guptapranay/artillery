#!/bin/bash
#set -x
echo "Starting artillery..."

for cfg_file in `ls /artillery/config/ | grep yml`
do
	echo "Launching rockets for ${cfg_file}"
	artillery run -o /tmp/report_${cfg_file}.json /artillery/config/${cfg_file}
	echo "Generating report for ${cfg_file}"
	artillery report /tmp/report_${cfg_file}.json
done

echo "Archiving report in /var/www/localhost/htdocs/..."
cp /tmp/report* /var/www/localhost/htdocs/

echo "Launching lighttpd (go on port 80 to see results)"
lighttpd -D -f /etc/lighttpd/lighttpd.conf
