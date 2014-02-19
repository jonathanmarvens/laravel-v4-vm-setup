sudo aptitude $VM_APTITUDE_FLAGS install \
  libpq-dev \
  postgresql \
  postgresql-contrib \

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'password';" -d postgres -U postgres
