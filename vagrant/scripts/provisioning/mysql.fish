echo 'mysql-server mysql-server/root_password password password' | sudo debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password password' | sudo debconf-set-selections

sudo aptitude $VM_APTITUDE_FLAGS install \
  libmysqlclient-dev \
  mysql-client \
  mysql-server \
