FROM node:13-stretch-slim

ENV DEBIAN_FRONTEND=noninteractive \
	DEBCONF_NONINTERACTIVE_SEEN=true
	
RUN apt-get update && apt-get install -y \
		biber \
		make \
		latexmk \
		locales \
		texlive \
		texlive-lang-european \
		 # required by tlmgr init-usertree
		wget \
		 # required by tlmgr init-usertree
		xzdec \
	# Removing documentation packages *after* installing them is kind of hacky,
    # but it only adds some overhead while building the image.
    # Source: https://github.com/aergus/dockerfiles/blob/master/latex/Dockerfile
    && apt-get --purge remove -y .\*-doc$ \
    # save some space
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
	# Configuration
    && paperconfig -p a4 \
	&& locale-gen en_US.UTF-8 \
	&& locale-gen da_DK.UTF-8

ENV LANG=da_DK.UTF-8 \
	LANGUAGE=da_DK:da \
	LC_ALL=da_DK.UTF-8
