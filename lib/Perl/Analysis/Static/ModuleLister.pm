package Perl::Analysis::Static::ModuleLister;
{
  $Perl::Analysis::Static::ModuleLister::VERSION = '0.004'; # TRIAL
}
# ABSTRACT: list all module below a namespace


use Moose;

use Module::List qw(list_modules);


has 'kind' => ( is => 'rw', isa => 'Str' );


sub list {
    my ($self) = @_;

    # build the module stem for that kind of modules
    my $stem    = 'Perl::Analysis::Static::' . $self->kind . '::';
    my $modules = list_modules( $stem, { list_modules => 1, recurse => 1 } );

    # if the hash is empty we found nothing
    return unless keys %$modules;

    # remove the stem so the name is readable
    my @result;
    for my $module (keys %$modules) {
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

version 0.004

=head1 DESCRIPTION

This class searches for modules of a given prefix in the
namespace F<Perl::Analysis::Static>.

Is main purpose is to give programs an easy way to show the user
possible arguments. For example, L<perlanalst> uses it for
its option C<--list--questions>.

=head1 ATTRIBUTES

=head2 kind

String defining what 'kind' of module you want to find.
Reasonable values are 'Question', 'Filter', and 'Analysis' since
there are actually modules in the according namespace.

=head1 METHODS

=head2 list

Searches for modules that live in the namespace
F<Perl::Analysis::Static::KIND>. KIND is the attribute C<kind>.

Returns reference to a list with the names of the modules (with
the Perl::Analysis::Static::KIND removed), or undef if there
are no modules in this namespace.

=head1 EXAMPLES

  # find out what questions may be called
  my $ml = Perl::Analysis::Static::ModuleLister->new(kind => 'Question');
  my $questions=$ml->list();

=head1 AUTHOR

Gregor Goldbach <glauschwuffel@nomaden.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Gregor Goldbach.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

