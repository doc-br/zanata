#!/bin/sh
#
# Script to translate .po files into SGML
#

if [ "$1" = "" ]; then
	echo "Need to inform a FreeBSD doc repository"
	echo "Example:"
	echo
	echo "$0 ../freebsd-doc-br/pt_BR.ISO8859-1"
	echo
	exit 1
fi

for article in $(find "$1/articles/" -type d); do
	cd "$article"
	make tran
done

for book in $(find "$1/books/" -type d); do
	cd "$book"
	make tran
done

