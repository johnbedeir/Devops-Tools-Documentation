# How to run Vagrant?

🎥 For a detailed walkthrough into this project, check out my video on YouTube:

- [Vagrant Part 1](https://youtu.be/uo-0PkcUze8).
- [Vagrant Part 2](https://youtu.be/Xv4I-TCzvP4).
- [Vagrant Part 3](https://youtu.be/cINWNEbS1To).
- [Vagrant Part 4](https://youtu.be/r3or3qlY464).

## Step 1: Download & Install

Download [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

Install Virtualbox using [GDebi Package Installer](https://linuxhint.com/install-and-use-gdebi-ubuntu/)

Download [Vagrant](https://developer.hashicorp.com/vagrant/install?product_intent=vagrant)

## Step 2: Run Vagrant

`Initialize the directory using the vagrant box from here:` [Vagrant Boxes](https://app.vagrantup.com/boxes/search)

```
vagrant init <vagrant-box>
```

`Create the virtualmachine using the initialized Vagrantfile`

```
vagrant up
```

`Access the created virtualmachine`

```
vagrant ssh
```

`Destroy the created virtualmachine`

```
vagrant destroy
```

## Other Commands:

`This command is to save the current virtualmachine status and suspend it`

```
vagrant suspend
```

`This command is to continue again using the suspended virtualmachine`

```
vagrant resume
```

`This command is used to apply the changed configuration into the Vagrantfile`

```
vagrant reload
```

`This command lists all the boxes that are installed into Vagrant`

```
vagrant box list
```

### [Find more commands explained here](https://www.vagrantup.com/docs/cli)
