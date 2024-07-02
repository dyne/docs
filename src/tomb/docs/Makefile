render:
	$(if $(wildcard ${HOME}/devel/tomb/doc/tomb.1),,$(error tomb source not found in ~/devel/tomb))
	 perl man-to-md.pl -f < ~/devel/tomb/doc/tomb.1  \
		| sed 's/^.B//; s/.B$$//; s/.EX/\n```\n/; s/.EE/\n```\n/; s/·//' > index.md
