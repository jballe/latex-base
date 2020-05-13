FROM node:13-stretch-slim

RUN apt-get update && apt-get install -y \
		biber \
		latexmk \
		make \
		texlive \
	&& rm -rf /var/lib/apt/lists/* \
    && paperconfig -p a4
