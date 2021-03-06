package { ["openjdk-7-jre", "tomcat7"]:
    ensure => installed,
    # require => Exec["apt-update"]
}

service { "tomcat7":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Package ["tomcat7"]
}

file { "/var/lib/tomcat7/webapps/vraptor-musicjungle.war":
    source => "/vagrant/manifests/vraptor-musicjungle.war",
    owner => tomcat7,
    group => tomcat7,
    mode => 0644,
    require => Package ["tomcat7"],
    notify => Service ["tomcat7"]
}    
