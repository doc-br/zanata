#!/bin/sh
#
# Script to copy .po files from a FreeBSD doc repository to Zanata
#

if [ "$1" = "" ] || [ "$2" = "" ]; then
	echo "Need to inform a FreeBSD doc repository and a Zanata Directory"
	echo "Example:"
	echo
	echo "$0 ../doc/pt_BR.ISO8859-1 ./"
	echo
	exit 1
fi

if [ ! -z "$ZANATA_LOCALE" ]; then
	ZANATA_LANG="$ZANATA_LOCALE"
else
	ZANATA_LANG="pt_BR"
fi

for article in $(find "$1/articles/" -name "*.po" ); do
	name=$(basename "$article")
	dirbase=$(dirname "$article")
	dir=$(echo "$dirbase" | rev | cut -d '/' -f 1 | rev)
	cp $article "articles/$ZANATA_LANG/$dir.po"
done

for book in $(find "$1/books/" -name "*.po" ); do
	name=$(basename "$book")
	dirbase=$(dirname "$book")
	dir=$(echo "$dirbase" | rev | cut -d '/' -f 1 | rev)
	cp $book "books/$ZANATA_LANG/$dir.po"
done
