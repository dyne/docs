#!/bin/sh
set -e

[ -r "$1" ] || {
	>&2 echo "cjit.1 manpage not found, pass path as argument, i.e:"
	>&2 echo "~/devel/cjit/docs/cjit.1"
	exit 1
}
res=0
out=docs/manpage.md
#tmp=`mktemp`
#pandoc --to asciidoc $1 > ${tmp} || res=1
#asciidoctor -b manpage ${1} -o docs/manpage.md || res=1
#cat "$1" | groff -mandoc -Thtml > ${tmp}
#pandoc --to markdown ${tmp} > ${out}
#rm -f ${tmp}
perl ../../man-to-md.pl -f "$1" > "$out"
[ "$res" = "0" ] && {
  >&2 echo "Manpage written to: $out"
}
exit $res
