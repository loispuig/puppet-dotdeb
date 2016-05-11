class dotdeb::apt inherits dotdeb {
	if $::osfamily == 'debian' {
		apt::source { "dotdeb":
			location => "http://packages.dotdeb.org",
			release  => $::lsbdistcodename,
			pin      => $pin,
			repos    => "all",
			include  => {
				"src" => true,
				"deb" => true,
			},
			notify => Exec["dotdeb-apt-key"],
		}

		exec { "dotdeb-apt-key":
			cwd		=> "/tmp",
			command => "curl -L --silent 'http://www.dotdeb.org/dotdeb.gpg' | apt-key add -",
			unless  => "apt-key list | grep -q dotdeb",
			path    => ["/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/"],
			require => Apt::Source["dotdeb"],
			notify  => Exec["apt_update"],
		}
	}
	else {
		fail("Unsupported platform: ${::operatingsystem}")
	}
}