# == Class: dotdeb
#
# Setup dotdeb repository on Debian OS
#
# === Authors
#
# Author Loïs PUIG <lois.puig@kctus.fr>
#
# === Copyright
#
# Copyright 2016 Loïs PUIG, unless otherwise noted.
#
class dotdeb (
	$pin = 750,
) {
	anchor { "dotdeb::begin": } ->
		class { "::dotdeb::apt": } ->
	anchor { "dotdeb::end": }
}
