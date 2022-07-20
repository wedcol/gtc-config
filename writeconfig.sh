#! /bin/bash
echo "hello world"

[ ! -d "/home/configbackup" ] && mkdir /home/configbackup

#mkdir /home/configbackup/

foldername="$(date +%F)_$(date +%T)"
mkdir /home/configbackup/"$foldername"

#back up nginx.conf
cp /etc/nginx/nginx.conf /home/configbackup/"$foldername"

#overwrite nginx.conf with pulled file
cp ./etc/nginx/nginx.conf /etc/nginx/

#back up catch all
cp /etc/nginx/sites-enabled/000-catch-all /home/configbackup/"$foldername"

#overwrite catch all with pulled file
cp ./etc/nginx/sites-enabled/000-catch-all /etc/nginx/sites-enabled/

#back up www.conf
cp /etc/php/7.4/fpm/pool.d/www.conf /home/configbackup/"$foldername"

#overwrite www.conf with pulled file
cp ./etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/

#back up limits.conf
cp /etc/security/limits.conf /home/configbackup/"$foldername"

#overwrite limits.conf with pulled file
cp ./etc/security/limits.conf /etc/security/

echo "done"
