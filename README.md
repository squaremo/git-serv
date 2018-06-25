## A minimal git server image

Use this to create and run a minimal git server that you can access
via SSH.

    make

will create two SSH keys, one for root in `./root` and one for a git
user in `./git`, and build an image that bakes them in, naming it
`git-serv`.

You can then run

    docker run -d -p 2022:22 git-serv

to get a server that has an empty repo you can use as a remote. Use

    export GIT_SSH_COMMAND='ssh -F ./ssh_config -i ./git'

then you can

    git clone ssh://git@localhost:2022/home/git/repo

(replacing `localhost` if your docker daemon is remote).

You can also SSH into the image, if you need to have a poke
around. Use

    ssh -F ./ssh-config -p 2022 root@localhost

(again, replacing `localhost` with your docker host, if necessary).

The host key may change if you rebuild the image, so be prepared to
delete the `./known_hosts` file and be asked about the host key again.
