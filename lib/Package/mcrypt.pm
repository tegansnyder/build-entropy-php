package Package::mcrypt;

use strict;
use warnings;

use base qw(PackageSplice);

our $VERSION = '2.5.7';




sub base_url {
	return "http://switch.dl.sourceforge.net/sourceforge/mcrypt";
}


sub packagename {
	return "libmcrypt-" . $VERSION;
}



sub subpath_for_check {
	return "lib/libmcrypt.dylib";
}


sub build_arch_pre {

	if (-e "/usr/lib/libltdl.dylib") {
		die "/usr/lib/libltdl.dylib is present on this system but will be missing on target systems, please move it aside. died";
	}

}


sub php_extension_configure_flags {

	my $self = shift @_;
	my (%args) = @_;

	return "--with-mcrypt=shared," . $self->config()->prefix();

}




sub php_dso_extension_names {
	my $self = shift @_;
	return $self->shortname();
}




sub package_filelist {

	my $self = shift @_;

	return $self->config()->extdir_path('mcrypt'), qw(
		lib/libmcrypt*.dylib
		php.d/50-extension-mcrypt.ini
	);
	
}





1;
