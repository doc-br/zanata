#!/bin/sh
#
# Script to copy Zanata .po files into a FreeBSD doc repository 
#

set -x

if [ "$1" = "" ] || [ "$2" = "" ]; then
	echo "Need to inform Zanata Directory and a FreeBSD doc repository"
	echo "Example:"
	echo
	echo "$0 ./ ../freebsd-doc-br/pt_BR.ISO8859-1"
	echo
	exit 1
fi

if [ ! -z "$ZANATA_LOCALE" ]; then
	ZANATA_LANG="$ZANATA_LOCALE"
else
	ZANATA_LANG="pt_BR"
fi

for article in $(find "$1/articles/$ZANATA_LANG" -name "*.po" ); do
	fullname=$(basename "$article")
	filename="${fullname%%.*}"
	cp -vf "$article" "${2}/articles/${filename}/${ZANATA_LANG}.po"
done

for book in $(find "$1/books/$ZANATA_LANG" -name "*.po" ); do
	fullname=$(basename "$book")
	filename="${fullname%%.*}"
	cp -vf "$book" "${2}/books/${filename}/${ZANATA_LANG}.po"
done

