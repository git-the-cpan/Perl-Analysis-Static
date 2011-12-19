package Perl::Analysis::Static::Answer;
# ABSTRACT: represents an answer to a question about a Perl document


use Moose;
use Carp;
use English qw( -no_match_vars );    # Avoids regex performance penalty

has 'class'     => ( is => 'rw', isa => 'Str' );

has 'elements' => (
        traits  => ['Array'],
        is      => 'ro',
        isa     => 'ArrayRef',
        default => sub { [] },
        handles => {
            add_element  => 'push'
        }
);

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Answer - represents an answer to a question about a Perl document

=head1 VERSION

version 0.003

=head2 DESCRIPTION

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

