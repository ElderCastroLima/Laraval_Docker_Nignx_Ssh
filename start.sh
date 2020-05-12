#!/bin/sh

# ----------------------------------------------------------------------
# Create the .env file if it does not exist.
# ----------------------------------------------------------------------

#if [[ ! -f "/var/www/.env" ]] && [[ -f "/var/www/.env.example" ]];
#then
#cp /var/www/.env.example /var/www/.env
#fi

# ----------------------------------------------------------------------
# Run Composer
# ----------------------------------------------------------------------

if [[ ! -d "/var/www/vendor" ]];
then
cd /var/www
composer install --no-dev
fi

# ----------------------------------------------------------------------
# Run Npm 
# ----------------------------------------------------------------------

#if [[ ! -d "/var/www/node_modules" ]];
#then
#cd /var/www
#npm install
#npm rum production
#fi

cd /var/www/
chmod -R 777 storage

# Get environment variables to show up in SSH session
eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)


# ----------------------------------------------------------------------
# Start SSH
# ----------------------------------------------------------------------
echo "Starting SSH..."
exec /usr/sbin/sshd &
(echo "Starting supervisord..."; /usr/bin/supervisord -c /etc/supervisord.conf -n)
