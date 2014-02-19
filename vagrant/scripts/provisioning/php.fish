sudo apt-add-repository -y 'ppa:ondrej/php5'

sudo aptitude $VM_APTITUDE_FLAGS update
sudo aptitude $VM_APTITUDE_FLAGS install \
  php5-cli \
  php5-common \
  php5-curl \
  php5-fpm \
  php5-mcrypt \
  php5-mysql \
  php5-pgsql \
  php5-sqlite \

cd /tmp
curl -v https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
cd -

sudo service nginx restart
