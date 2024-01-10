package Data::Sah::Filter::perl::Business::ID::NPWP::check_npwp;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub meta {
    +{
        v => 1,
        summary => 'Check that string is a valid NPWP',
        might_fail => 1,
        args => {
            allow_nik => {schema=>'bool*', default=>0},
        },
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};
    my $gen_args = $args{args} // {};
    my $allow_nik = $gen_args->{allow_nik} ? 1:0;

    my $res = {};

    $res->{modules}{"Business::ID::NPWP"} //= 0.091;

    $res->{expr_filter} = join(
        "",
        "do { my \$tmp = $dt; my \$res = Business::ID::NPWP::parse_npwp(npwp => \$tmp, allow_nik=>$allow_nik); \$res->[0] == 200 ? [undef,\$tmp] : [\$res->[1], \$tmp] }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 DESCRIPTION

=cut
