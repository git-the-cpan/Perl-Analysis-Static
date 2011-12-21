package Perl::Analysis::Static::Analysis::Block;
{
  $Perl::Analysis::Static::Analysis::Block::VERSION = '0.004'; # TRIAL
}

# ABSTRACT: find all blocks

use Moose;
use Carp;
use English qw( -no_match_vars );    # Avoids regex performance penalty

use Perl::Analysis::Static::Element::Block;

extends 'Perl::Analysis::Static::Analysis';

has '_ppi_class' =>
  ( is => 'rw', isa => 'Str', default => 'PPI::Structure::Block' );

sub _convert {
    my ( $self, $node ) = @_;

    # todo: error check ;)
    return Perl::Analysis::Static::Element::Block->new(
        from     => $node->start->location->[0],
        to       => $node->finish->location->[0],
        ppi_node => $node
    );

}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Analysis::Block - find all blocks

=head1 VERSION

version 0.004

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

