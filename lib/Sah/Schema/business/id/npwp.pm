package Sah::Schema::business::id::npwp;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Indonesian taxpayer registration number (NPWP)',
    prefilters => ['Str::remove_nondigit', ['Business::ID::NPWP::check_npwp'=>{allow_nik=>1}]],
    description => <<'MARKDOWN',

MARKDOWN
    examples => [
        {value=>'', valid=>0, summary=>'Empty string'},
        {value=>'123', valid=>0, summary=>'Too short'},
        {value=>'3273010101900005', valid=>1, summary=>'NIK'},
        {value=>'02.183.241.5-000.000', valid=>1, summary=>'Non-digits removed', validated_value=>'021832415000000'},
        {value=>'0.02.183.241.5-000.000', valid=>1, summary=>'16-digit NPWP', validated_value=>'0021832415000000'},
    ],
}];

1;

# ABSTRACT:
