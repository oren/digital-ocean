# Docker image for provisioning a Digital Ocean Server

## Setup

1. cp .env.example .env
1. Update .env with your [Personal Access Token](https://cloud.digitalocean.com/settings/applications)
1. Copy the [private ssh key](https://cloud.digitalocean.com/settings/security) that you want to use with that droplet into private_ssh_key folder

## Run

    docker-compose up

## Misc

    docker-compose run app ./create-droplet           # create new droplet
    docker-compose run app ./install                  # install everything you need on the droplet


## Ansible

to Generate [crypted password](http://docs.ansible.com/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module)

    mkpasswd --method=SHA-512 <password to crypt>
