package Perl::Analysis::Static::Analysis::Sub;
{
  $Perl::Analysis::Static::Analysis::Sub::VERSION = '0.004'; # TRIAL
}

# ABSTRACT: find all subroutine declarations

use Moose;
use Carp;
use English qw( -no_match_vars );    # Avoids regex performance penalty

use Perl::Analysis::Static::Element::Sub;

extends 'Perl::Analysis::Static::Analysis';

has '_ppi_class' =>
  ( is => 'rw', isa => 'Str', default => 'PPI::Statement::Sub' );

sub _convert {
    my ( $self, $node ) = @_;

    # get significant children
    my @schildren = $node->schildren();

    # the first child is the keyword, for subs
    # this has to be 'sub'
    unless ( $schildren[0] eq 'sub' ) {

        # CHECK: log a warning if this isn't the case?
        return;
    }

    # the sub's name is the second child
    my $name = $schildren[1];

    # CHECK: look for a block that has been found by the Block analysis?
    my $block = $schildren[2];

    # the third one is the block containing the statements
    unless ( $block->isa('PPI::Structure::Block') ) {

        # CHECK: log a warning if this isn't the case?
        return;
    }

    my $from = $block->start->location->[0];
    my $to   = $block->finish->location->[0];

    return Perl::Analysis::Static::Element::Sub->new(
        name     => $name->content(),
        from     => $from,
        to       => $to,
        ppi_node => $node
    );
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Analysis::Sub - find all subroutine declarations

=head1 VERSION

version 0.004

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

