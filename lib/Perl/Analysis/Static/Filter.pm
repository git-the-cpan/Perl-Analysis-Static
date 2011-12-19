package Perl::Analysis::Static::Filter;
# ABSTRACT: decide if we asked for an element


use Moose;
use Carp;
use English qw( -no_match_vars );    # Avoids regex performance penalty


sub set_arguments {
    my ($self, $arguments)=@_;

	my @args=split(/:/, $arguments);
	$self->_set_arguments(\@args);
}


sub filter {
	my ( $self, $elements ) = @_;

	my @e = grep { $self->_filter($_) } @$elements;
	return unless @e;
	return \@e;
}

sub _filter {
	my ( $self, $element ) = @_;
	die 'implement me';
}

sub _set_arguments {
	my ( $self, $arguments) = @_;
	die 'implement me';
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::Filter - decide if we asked for an element

=head1 VERSION

version 0.003

=head2 DESCRIPTION

=head2 set_arguments ($arguments)

=head2 filter ($elements)

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

