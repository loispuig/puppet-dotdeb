class dotdeb::apt inherits dotdeb {

	apt::source { "dotdeb":
		location => "http://packages.dotdeb.org",
		release => $lsbdistcodename,
		repos => "all",
		include => {
			'src' => true,
			'deb' => true,
		},
		notify => Exec['dotdeb-apt-key'],
	}

	exec { 'dotdeb-apt-key':
		command => 'curl -L --silent "http://www.dotdeb.org/dotdeb.gpg" | apt-key add -',
		unless  => 'apt-key list | grep -q dotdeb',
		path    => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ],
		require => File['/etc/apt/sources.list.d/dotdeb.list'],
		notify  => Exec['apt_update'],
	}
}