#!/usr/bin/env fish

# Set a couple environment variables.
set -x VM_APTITUDE_FLAGS '--no-gui' '-y'
set -x VM_PROVISIONING_SCRIPTS_DIRECTORY /vagrant/scripts/provisioning
set -x VM_TEMPLATES_DIRECTORY /vagrant/templates

fish $VM_PROVISIONING_SCRIPTS_DIRECTORY/git.fish # Set up Git.
fish $VM_PROVISIONING_SCRIPTS_DIRECTORY/nginx.fish # Set up NGINX.
fish $VM_PROVISIONING_SCRIPTS_DIRECTORY/php.fish # Set up PHP.
fish $VM_PROVISIONING_SCRIPTS_DIRECTORY/mysql.fish # Set up MySQL.
fish $VM_PROVISIONING_SCRIPTS_DIRECTORY/postgresql.fish # Set up PostgreSQL.
