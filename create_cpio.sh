#!/bin/bash
CPIOTOOL="$( which bsdcpio )"

usage()
{
	echo "$0 [output.cpio] [CPIO root path]" 1>&2
	exit 1
}

[ -z "$1" -o -z "$2" ] && usage
if [ -e "$1" -a ! -f "$1" ]; then
	echo "Output '$1' does already exist and is not a file" 1>&2
	usage
fi
if [ ! -d "$2" ]; then
	echo "'$2' is not a directory" 1>&2
	usage
fi

OUT_BASE="$( readlink -f "$( dirname "$1" )" )"
OUT_FILE="$( basename "$1" )"

if [ ! -d "${OUT_BASE}" ]; then
	echo "Target directory for '$1' does not exist" 1>&2
	usage
fi
if [ -z "${CPIOTOOL}" ]; then
	echo "Could not find 'bsdcpio'" 1>&2
	exit 1
fi

cd "$2"
find -L . -depth \( ! -iname ".gitkeep" \) -print \
	| tac \
	| "${CPIOTOOL}" -L -v -o --format newc > "${OUT_BASE}/${OUT_FILE}"
exit $?
