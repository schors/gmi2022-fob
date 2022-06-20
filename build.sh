#!/bin/sh

article=$1

if [ "x${article}" = "x" ]; then
        article="golang-map-internals-fob"
fi

rm -f ${article}.aux
rm -f ${article}.bcf
rm -f ${article}.blg
rm -f ${article}.nav
rm -f ${article}.bbl
rm -f ${article}.log
rm -f ${article}.out
rm -f ${article}.run.xml
rm -f ${article}.snm
rm -f ${article}.toc
rm -f ${article}.vrb

docker run -ti --rm -u `id -u`:`id -g` -v /home:/home -w `pwd` -e HOME=$HOME texlive/texlive xelatex ${article}.tex
docker run -ti --rm -u `id -u`:`id -g` -v /home:/home -w `pwd` -e HOME=$HOME texlive/texlive biber ${article}
docker run -ti --rm -u `id -u`:`id -g` -v /home:/home -w `pwd` -e HOME=$HOME texlive/texlive xelatex ${article}.tex
docker run -ti --rm -u `id -u`:`id -g` -v /home:/home -w `pwd` -e HOME=$HOME texlive/texlive xelatex ${article}.tex

