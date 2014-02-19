# laravel-v4-vm-setup

## Description

A very simple VM setup for building, running, and managing Laravel v4 apps.

## Process

 - Download and install [VirtualBox](https://virtualbox.org "VirtualBox") and [Vagrant](http://vagrantup.com "Vagrant").
 - Clone this project and change into its directory.
 - Run the following commands.

```sh
$ vagrant up
$ vagrant ssh
```

 - Once you have an SSH session active, change into `/srv/app-dev`.
 - Clone or create your Laravel application in this directory.

```sh
# Example 1.
# $ pwd
# /srv/app-dev
$ git clone APPLICATION_GIT_ADDRESS .
```

```sh
# Example 2.
# $ pwd
# /srv/app-dev
$ composer -v create-project --prefer-dist laravel/laravel .
```

## Contributors

__[Jonathan Barronville](mailto:jonathan@belairlabs.com "jonathan@belairlabs.com")__

## License

See "__LICENSE__".
