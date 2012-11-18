
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A pure-perl implementation of zabbix-sender.",
  "AUTHOR" => "Dominik Schulz <dominik.schulz\@gauner.org>",
  "BUILD_REQUIRES" => {
    "English" => 0,
    "File::Spec" => 0,
    "Test::Kwalitee" => 0,
    "Test::More" => 0,
    "Test::Perl::Critic" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Zabbix-Sender",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Zabbix::Sender",
  "PREREQ_PM" => {
    "IO::Select" => 0,
    "IO::Socket" => 0,
    "JSON" => 0,
    "Moose" => 0,
    "Net::Domain" => 0,
    "bytes" => 0,
    "namespace::autoclean" => 0
  },
  "VERSION" => "0.03",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



