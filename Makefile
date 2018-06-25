.PHONY: all

all: Dockerfile root.pub git.pub
	docker build -t git-serv .

root.pub:
	ssh-keygen -f root

git.pub:
	ssh-keygen -f git
