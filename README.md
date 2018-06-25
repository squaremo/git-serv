## A minimal git server image

Use this to create and run a minimal git server that you can access
via SSH.

    make

will create two SSH keys, one for root and one for a git user, and
build an image that bakes them in, naming it `git-serv`.

You can then run

    docker run -d -p 2022:22 git-serv

to get a server that has an empty repo you can use as a remote. Use

    export GIT_SSH_COMMAND='ssh -i ./git -o UserKnownHostsFile=./known_hosts'

then you can

    git clone ssh://git@localhost:2022/home/git/repo

(replacing `localhost` if necessary).
