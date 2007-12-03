package Attribute::SubName;

use strict;
use warnings;
use Sub::Name;
use base 'Attribute::Handlers';


our $VERSION = '0.01';


sub UNIVERSAL::Name : ATTR(CODE) {
   my ($package, $symbol, $referent, $attr, $data, $phase) = @_;
   my $name = "${package}::${data}";
   subname $name => $referent;
   no strict 'refs';
   *{$name} = $referent;
}


1;


__END__



=head1 NAME

Attribute::SubName - Naming anonymous subroutines via attributes

=head1 SYNOPSIS

    use Attribute::SubName;

    my $coderef = sub :Name(foo) { ... };

    print foo(...);

=head1 DESCRIPTION

This module provides an attribute C<:Name> that you can use on anonymous
subroutines to give them a name. This is useful as they will then show up with
that name in stack traces (cf. L<Carp>). The naming is done with L<Sub::Name>.
Additionally, the attribute also installs the newly named subroutine in the
proper glob slot so you can refer to it by name.

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<attributesubname> tag.

=head1 VERSION 
                   
This document describes version 0.01 of L<Attribute::SubName>.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<<bug-attribute-subname@rt.cpan.org>>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHOR

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

