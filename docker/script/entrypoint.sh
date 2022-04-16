echo "Updating cron..."
# Put new cron jobs in cron.d to check and renew the certificates
rm /etc/crontabs/root
cp ./cron /etc/crontabs/root
# Install dependencies
apk add --update python3 py3-pip certbot
pip install certbot-nginx

echo "Updating default nginx conf..."
# Update default nginx conf
rm /etc/nginx/conf.d/default.conf
cp ./default.conf /etc/nginx/conf.d/default.conf

echo "done. Turning on certbot..."
# Load the new nginx conf
nginx -s reload
# Launch certbot cmd to create the certificate for the specified domain
certbot certonly --webroot --webroot-path /var/www/html --staging --agree-tos --non-interactive --email "victor@agencerjs.com" -d call-me-dev.com
curl -sSLo /etc/nginx/conf.d/options-ssl-nginx.conf https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf
# Update the nginx conf to use the new certificate
rm /etc/nginx/conf.d/default.conf
cp ./ssl-default.conf /etc/nginx/conf.d/default.conf
# Reload nginx
nginx -s stop
nginx -g 'daemon off;'

