#!/bin/sh

cat /logs/access_log |perl -lne 'm/(?:GET|POST) (.+?)(?:\?.*? | )HTTP/;$h{$1}++;$t++;$b=$1;if($b=~/\+reg/){$h{REG}++;} } END { %h = map {$_ => $h{$_}/$t * 100}keys %h;for (sort {$h{$b} <=> $h{$a}} keys %h){ printf "%d. $_: %.2f%%\n",++$a,$h{$_};  }'|more
