package Perl::Analysis::Static::Collector;

# ABSTRACT: collects answers to questions about a Perl documents


use Moose;
use Carp;
use English qw( -no_match_vars );    # Avoids regex performance penalty

# with the help of Moose::Meta::Attribute::Native::Trait::Hash
has 'answers' => (
    traits  => ['Hash'],
    is      => 'ro',
    isa     => 'HashRef',
    default => sub { {} },
    handles => {
        set_answer     => 'set',
        get_answer     => 'get',
        has_no_answers => 'is_empty',
        num_answers    => 'count',
        delete_answers => 'delete',
        answer_pairs   => 'kv',
        filenames          => 'keys'
        }
);

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Collector - collects answers to questions about a Perl documents

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

