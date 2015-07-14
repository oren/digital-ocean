# Docker image for provisioning a Digital Ocean Server

## Setup

1. cp .env.example .env
1. Update .env with your [Personal Access Token](https://cloud.digitalocean.com/settings/applications) and other info about your server
1. Copy the [private ssh key](https://cloud.digitalocean.com/settings/security) that you want to use with that droplet into private_ssh_key folder. Make sure that you name it the same as SSH_KEY in the .key file.

## Run

    docker-compose run app ./create-droplet   # create new droplet
    docker-compose run app ./install          # installs everything you need on the droplet

Everything you put in the `home` folder will be copied to the home of the dev user.
The last output will be the ssh command to your new droplet.

## Ansible note

If you want to generate different crypted password you can use this command:

    mkpasswd --method=SHA-512 <password to crypt>

([ansible docs](http://docs.ansible.com/faq.html#how-do-i-generate-crypted-passwords-for-the-user-module))
