
# This is CPAN.pm's systemwide configuration file. This file provides
# defaults for users, and the values can be changed in a per-user
# configuration file. The user-config file is being looked for as
# ~/.cpan/CPAN/MyConfig.pm.

$CPAN::Config = {
  'auto_commit' => q[1],
  'build_cache' => q[10],
  'build_dir' => q[/root/.cpan/build],
  'cache_metadata' => q[1],
  'commandnumber_in_prompt' => q[1],
  'cpan_home' => q[/root/.cpan],
  'dontload_hash' => {  },
  'ftp' => q[/usr/kerberos/bin/ftp],
  'ftp_passive' => q[1],
  'ftp_proxy' => q[],
  'getcwd' => q[cwd],
  'gpg' => q[/usr/bin/gpg],
  'gzip' => q[/bin/gzip],
  'histfile' => q[/root/.cpan/histfile],
  'histsize' => q[100],
  'http_proxy' => q[],
  'inactivity_timeout' => q[0],
  'index_expire' => q[1],
  'inhibit_startup_message' => q[0],
  'keep_source_where' => q[/root/.cpan/sources],
  'lynx' => q[/usr/bin/lynx],
  'make' => q[/usr/bin/make],
  'make_arg' => q[-j3],
  'make_install_arg' => q[-j3],
  'make_install_make_command' => q[/usr/bin/make],
  'makepl_arg' => q[],
  'mbuild_arg' => q[],
  'mbuild_install_arg' => q[],
  'mbuild_install_build_command' => q[./Build],
  'mbuildpl_arg' => q[],
  'ncftpget' => q[/usr/bin/ncftpget],
  'no_proxy' => q[],
  'pager' => q[/usr/bin/less],
  'prerequisites_policy' => q[follow],
  'scan_cache' => q[atstart],
  'shell' => q[/bin/bash],
  'tar' => q[/bin/tar],
  'term_is_latin' => q[1],
  'term_ornaments' => q[1],
  'unzip' => q[/usr/bin/unzip],
  'urllist' => [q[http://cpan.scalableinformatics.com]],
  'use_sqlite' => q[0],
  'wget' => q[/usr/bin/wget],
};
1;
__END__
