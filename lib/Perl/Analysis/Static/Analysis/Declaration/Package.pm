package Perl::Analysis::Static::Analysis::Declaration::Package;
{
  $Perl::Analysis::Static::Analysis::Declaration::Package::VERSION = '0.004'; # TRIAL
}

# ABSTRACT: find all declarations of packages

use Moose;
use Carp;
use English qw( -no_match_vars );    # Avoids regex performance penalty

use Perl::Analysis::Static::Element::Declaration::Package;

extends 'Perl::Analysis::Static::Analysis';

has '_ppi_class' =>
  ( is => 'rw', isa => 'Str', default => 'PPI::Statement::Package' );

sub _convert {
    my ( $self, $node ) = @_;

    # get significant children
    my @schildren = $node->schildren();

    # the first child is the keyword
    unless ( $schildren[0] eq 'package' ) {

        # CHECK: log a warning if this isn't the case?
        return;
    }

    # the sub's name is the second child
    my $name = $schildren[1];

    unless ( $name->isa('PPI::Token::Word') ) {
        die 'PANIC: unexpected class ' . $name->class;
        return;
    }

    return Perl::Analysis::Static::Element::Declaration::Package->new(
        name     => $name->content,
        from     => $node->location->[0],
        to       => $node->location->[0],
        ppi_node => $node
    );
}


1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Analysis::Declaration::Package - find all declarations of packages

=head1 VERSION

version 0.004

=head1 DESCRIPTION

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

