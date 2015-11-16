# Ghost set-up with Vagrant

This repository aims at providing the necessary files to deploy a fully exploitable environnement running [Ghost](https://ghost.org/) at `localhost:8080/ghost` under a `ubuntu/trusty64` virtual machine created with [vagrant](https://www.vagrantup.com/).

## How to use

- `git clone` into your repository
- `vagrant up`
- `vagrant ssh` into your local machine
- `cd /var/www/ghost/ && sudo npm start` to start the ghost platform
- You're all set ! Go to `localhost:8080/ghost` and start playing around 

:octocat:
