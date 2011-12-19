package Perl::Analysis::Static::Filter::Name;
# ABSTRACT: Does the name equal this one?

use Moose;

extends 'Perl::Analysis::Static::Filter';

has 'name' => ( is => 'rw', isa => 'Str' );

sub _filter {
    my ($self, $element) = @_;
    
    return 1 if $self->name() eq $element->name();
}

sub _set_arguments {
    my ($self, $arguments) = @_;

	$self->name($arguments->[0]);    
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Filter::Name - Does the name equal this one?

=head1 VERSION

version 0.003

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

