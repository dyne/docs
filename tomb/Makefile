render:
	$(if $(wildcard ${HOME}/devel/tomb/doc/tomb.1),,$(error tomb source not found in ~/devel/tomb))
	 perl man-to-md.pl -f < ~/devel/tomb/doc/tomb.1  \
		| sed 's/^.B//; s/.B$$//; s/.EX/\n```\n/; s/.EE/\n```\n/; s/·//;' \
		| awk '/^<pre><code>.B .IP/ { next; } /tomb\(1\)/ {print("# Tomb, folder encryption on GNU/Linux"); next;} /^# / {printf("#%s",$$0); next} /^tomb,/ {print("Manpage update: " $0)} { print $0 }' > manpage.md
