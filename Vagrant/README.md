# How to run Vagrant?

## Step 1: Download & Install

[Download Virtualbox](https://www.virtualbox.org/wiki/Downloads)

[Install Virtualbox using GDebi Package Installer](https://linuxhint.com/install-and-use-gdebi-ubuntu/)

[Download Vagrant](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqblpDZ2YwOHQ3cmJITHRtT1RTXzk1N0VWRzlnUXxBQ3Jtc0trQjJpMldKVlh1VWpEVnl1c1BKRG5uWVM0elZJSm9rckUybENoa1dIWXROQkNDS2VjR2Nqd0lKNV85T3lVLW5yeUdOMG5pWmFBY0JURUwySG9ZRkppbHRGVVJrdWlxdXdfUndUa3U1bmh2OGhQVjgzMA&q=https%3A%2F%2Fwww.vagrantup.com%2Fdownloads%23%3A%7E%3Atext%3Dall%2520Vagrant%2520tutorials-%2CRelease%2520Information%2C-Releases%253A&v=uo-0PkcUze8)

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
