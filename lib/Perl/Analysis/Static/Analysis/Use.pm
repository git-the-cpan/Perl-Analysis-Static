package Perl::Analysis::Static::Analysis::Use;
{
  $Perl::Analysis::Static::Analysis::Use::VERSION = '0.004'; # TRIAL
}

# ABSTRACT: find all module imports via use

use Moose;
use Carp;
use English qw( -no_match_vars );    # Avoids regex performance penalty

use Perl::Analysis::Static::Element::Use;

extends 'Perl::Analysis::Static::Analysis';

has '_ppi_class' =>
  ( is => 'rw', isa => 'Str', default => 'PPI::Statement::Include' );

sub _convert {
    my ( $self, $node ) = @_;

    # get significant children
    my @schildren = $node->schildren();

    # the first child is the keyword
    unless ( $schildren[0] eq 'use' ) {
        # CHECK: log a warning if this isn't the case?
        return;
    }

    # name is the second child
    my $name = $schildren[1];

    return Perl::Analysis::Static::Element::Use->new(
        name     => $name->content(),
        from     => $node->location->[0],
        to       => $node->location->[0],
        ppi_node => $node
    );
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Analysis::Use - find all module imports via use

=head1 VERSION

version 0.004

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

