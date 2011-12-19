package Perl::Analysis::Static::Analysis;

# ABSTRACT: look for certain elements in a Perl document


use Moose;
use Carp;
use English qw( -no_match_vars );    # Avoids regex performance penalty

has '_ppi_class' => ( is => 'rw', isa => 'Str', default => 'PPI::Node' );


sub analyse {
    my ( $self, $document ) = @_;

    # find all nodes of given PPI class
    my $nodes = $document->ppi->find( sub { $_[1]->isa( $self->_ppi_class ) } );

    # return immediately if there were no nodes of this class
    return unless $nodes;

    # convert them
    my @findings;
    for my $node (@$nodes) {
         push @findings, $self->_convert($node);
    }

    # return immediately if we didn't find anything or we get an empty list
    return unless @findings;

    return \@findings;
}

sub _convert {
    my ( $self, $ppi_node ) = @_;

    die 'implement me';
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Analysis - look for certain elements in a Perl document

=head1 VERSION

version 0.003

=head2 DESCRIPTION

=head2 analyse ($document)

Find nodes of a given PPI class in the PPI representation of a
document and convert each one.

Returns reference to list of converted nodes.

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

