# File:         Makefile
# Maintainer:   Shintaro Kaneko <kaneshin0120@gmail.com>
# Last Change:  08-Feb-2014.

COCOAPODS = pod
GIT = git
UPDATESUBMODULE = submodule update --recursive

all: install

# install
install: define
	$(COCOAPODS) install; $(GIT) $(UPDATESUBMODULE) --init

# update
update: pod git

pod:
	$(COCOAPODS) update

git:
	$(GIT) $(UPDATESUBMODULE)

define:
	cd ./couples/ && cp Defines.h.sample Defines.h

# shell
shell:
	which $(SHELL)

clean:

purge:

