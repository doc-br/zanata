#!/bin/sh
#
# Script to copy .pot files from a FreeBSD doc repository to Zanata
#

if [ "$1" = "" ] || [ "$2" = "" ]; then
	echo "Need to inform a FreeBSD doc repository and a Zanata Directory"
	echo "Example:"
	echo
	echo "$0 ../doc/en_US.ISO8859-1 ./"
	echo
	exit 1
fi

for article in $(find "$1/articles/" -name "*.pot" ); do
	name=$(basename "$article")
	dirbase=$(dirname "$article")
	dir=$(echo "$dirbase" | rev | cut -d '/' -f 1 | rev)
	cp $article "articles/$dir.pot"
done

for book in $(find "$1/books/" -name "*.pot" ); do
	name=$(basename "$book")
	dirbase=$(dirname "$book")
	dir=$(echo "$dirbase" | rev | cut -d '/' -f 1 | rev)
	cp $book "books/$dir.pot"
done
