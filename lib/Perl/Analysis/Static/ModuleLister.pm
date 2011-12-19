package Perl::Analysis::Static::ModuleLister;
# ABSTRACT: list all module below a namespace


use Moose;

use Module::List qw(list_modules);

has 'kind' => ( is => 'rw', isa => 'Str' );


sub list {
    my ($self) = @_;

    # build the module stem for that kind of modules
    my $stem    = 'Perl::Analysis::Static::' . $self->kind . '::';
    my $modules = list_modules( $stem, { list_modules => 1, recurse => 1 } );

    # remove the stem so the name is readable
    my @result;
    for my $module (@$modules) {
        $module =~ s{$stem}{};
        push @result, $module;
    }
    return \@result;
}

1;

__END__
=pod

=head1 NAME

Perl::Analysis::Static::ModuleLister - list all module below a namespace

=head1 VERSION

version 0.003

=head2 DESCRIPTION

=head2 list ($kind)

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

