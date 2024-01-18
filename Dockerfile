# This docker image has LaTeX to build the vignettes
FROM bioconductor/bioconductor_docker:devel

# Update apt-get
RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	&& apt-get install -y --no-install-recommends \
	texlive \
	texlive-latex-extra \
	texlive-fonts-extra \
	texlive-bibtex-extra \
	texlive-science \
	texlive-plain-generic \
	texi2html \
	texinfo \
	lmodern \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

## Install BiocStyle
RUN R -e 'BiocManager::install("BiocStyle")'

## Install spillR
RUN R -e 'BiocManager::install("spillR")'

## Install other packages
RUN R -e 'BiocManager::install(c("cowplot", "transport", "RColorBrewer", "parallel", "kableExtra", "hexbin", "readr"))'