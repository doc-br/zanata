#!/bin/sh
#
# Script to translate .po files into SGML
#

if [ "$1" = "" ]; then
	echo "Need to inform a FreeBSD doc repository"
	echo "Example:"
	echo
	echo "$0 ../freebsd-doc/pt_BR.ISO8859-1"
	echo
	exit 1
fi

for article in $(find "$1/articles/" -type d -maxdepth 1 -mindepth 1); do
	cd "$article"
	pwd
	echo "make tran"
	make tran
	cd -
done

for book in $(find "$1/books/" -type d -maxdepth 1 -mindepth 1); do
	cd "$book"
	pwd
	echo "make tran"
	make tran
	cd -
done

