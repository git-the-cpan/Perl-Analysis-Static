package Perl::Analysis::Static::Question;
# ABSTRACT: represents a question about a Perl document


use Moose;
use Carp;
use English qw( -no_match_vars );    # Avoids regex performance penalty

use Module::Runtime qw(use_module);

use Perl::Analysis::Static::Document;


has 'class'     => ( is => 'rw', isa => 'Str' );


has 'filter'    => ( is => 'rw', isa => 'ArrayRef[Str]' );


has 'arguments' => ( is => 'rw', isa => 'ArrayRef[Str]' );

sub set_arguments {
	my ($self) = @_;
	die 'implement me';
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Question - represents a question about a Perl document

=head1 VERSION

version 0.003

=head1 ATTRIBUTES

=head2 class

Holds the name of the element that you ask for. It's a string
that gets L<Perl::Statis::Analysis::Element> appended. 

=head2 filter

When a question is asked it gets a list of elements
(which are subclasses of L<Perl::Statis::Analysis::Element>).
The list is then filtered by any number of filters (or no
filter at all.)

The names of the filters are stored in this attribute. It's a
reference to a list of strings, each one gets
L<Perl::Statis::Analysis::Filter> appended. 

=head2 arguments

Reference to list of arguments for each filter.

=head2 DESCRIPTION

A human or a machine might want to know something about a Perl
document, so it asks a question for that document. Such a question
may be "Where is a lexical variable named 'foo' declared?" or
"What functions are declared whose name match the regex '^[sS]et'?".

Enter this class. It is the base class for all questions asked about
a Perl document.

The question is asked by the L<Perl::Analysis::Static::Questioner>.

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

