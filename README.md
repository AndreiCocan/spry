# spry

**A blazingly *FAST* environment setup, ready to deploy with a single command line!**

This is using [Chezmoi](https://chezmoi.io), [Ansible](https://www.ansible.com/) and (mostly) [Brew](https://brew.sh/) to setup the install.


> [!IMPORTANT]  
> This automated setup is currently only configured for `macOS`, `Debian` and `Ubuntu` machines.


## How to run

To setup a computer, run the following command:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:AndreiCocan/spry.git
```

aaaand, thats it! **Your good to go!**