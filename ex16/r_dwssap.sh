#!/bin/sh

cat /etc/passwd |\
	grep -v '\#' |\
	sed "1!n;d" |\
	cut -d ':' -f1 |\
	rev |\
	sort -r |\
	awk 'FT>= Env[FT_LINE1] && FT<= Env [FT_LINE2]' |\
	paste -s -d "," - |\
	tr ' ' ',' |\
	sed "s/$/./" |\
	tr -d '\n'
