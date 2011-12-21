
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Static analysis of Perl documents",
  "AUTHOR" => "Gregor Goldbach <glauschwuffel\@nomaden.org>",
  "BUILD_REQUIRES" => {
    "Test::Deep" => 0,
    "Test::Differences" => 0,
    "Test::More" => 0,
    "Test::Most" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Perl-Analysis-Static",
  "EXE_FILES" => [
    "scripts/perlanalyst"
  ],
  "LICENSE" => "perl",
  "NAME" => "Perl::Analysis::Static",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Config" => 0,
    "Cwd" => 0,
    "English" => 0,
    "File::Next" => 0,
    "FindBin" => 0,
    "Getopt::Long" => 0,
    "IO::Interactive" => 0,
    "List::Util" => 0,
    "Module::List" => 0,
    "Module::Runtime" => 0,
    "Moose" => 0,
    "PPI" => 0,
    "PPI::Cache" => 0,
    "PPI::Node" => 0,
    "Pod::Usage" => 0,
    "Term::ANSIColor" => 0,
    "Term::ProgressBar::Simple" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.004",
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



