# 
# /*
#  * *********** WARNING **************
#  * This file generated by ModPerl::WrapXS/0.01
#  * Any changes made here will be lost
#  * ***********************************
#  * 01: lib/ModPerl/Code.pm:716
#  * 02: lib/ModPerl/WrapXS.pm:635
#  * 03: lib/ModPerl/WrapXS.pm:1186
#  * 04: Makefile.PL:435
#  * 05: Makefile.PL:333
#  * 06: Makefile.PL:59
#  */
# 


package APR::Brigade;

use strict;
use warnings FATAL => 'all';


use APR ();
use APR::XSLoader ();
our $VERSION = '0.009000';
APR::XSLoader::load __PACKAGE__;



1;
__END__

=head1 NAME

APR::Brigade - Perl API for manipulating APR Bucket Brigades




=head1 Synopsis

  use APR::Brigade ();
  
  $bb = APR::Brigade->new($r->pool, $c->bucket_alloc);
  $ba = $bb->bucket_alloc();
  $pool = $bb->pool;
  
  $bb->insert_head($b);
  $bb->insert_tail($b);
  
  $b_first = $bb->first;
  $b_last  = $bb->last;
  
  $b_prev = $bb->prev($b_last);
  $b_next = $bb->next($b);
  
  $bb2 = APR::Brigade->new($r->pool, $c->bucket_alloc);
  $bb1->concat($bb2);
  
  $len = $bb->flatten($data);
  $len = $bb2->flatten($data, $wanted);
  
  $len = $bb->length;
  $bb3 = $bb->split($b_last);
  
  last if $bb->is_empty();
  $bb->cleanup();
  $bb->destroy();
  









=head1 Description

C<APR::Brigade> allows you to create, manipulate and delete APR bucket
brigades.






=head1 API

C<APR::Brigade> provides the following functions and/or methods:


=head2 C<cleanup>

Empty out an entire bucket brigade:

  $bb->cleanup;

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

The brigade to cleanup

=item ret: no return value

=item since: 2.0.00

=back

This method destroys all of the buckets within the bucket brigade's
bucket list.  This is similar to C<L<destroy()|/C_destroy_>>, except
that it does not deregister the brigade's C<L<pool()|/C_pool_>>
cleanup function.

Generally, you should use C<L<destroy()|/C_destroy_>>.  This function
can be useful in situations where you have a single brigade that you
wish to reuse many times by destroying all of the buckets in the
brigade and putting new buckets into it later.









=head2 C<concat>

Concatenate brigade C<$bb2> onto the end of brigade C<$bb1>, leaving
brigade C<$bb2> empty:

  $bb1->concat($bb2);

=over 4

=item obj: C<$bb1>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

The brigade to concatenate to.

=item arg1: C<$bb2>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

The brigade to concatenate and empty afterwards.

=item ret: no return value

=item since: 2.0.00

=back




=head2 C<destroy>

destroy an entire bucket brigade, includes all of the buckets within
the bucket brigade's bucket list.

  $bb->destroy();

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

The bucket brigade to destroy.

=item ret: no return value

=item excpt: C<L<APR::Error|docs::2.0::api::APR::Error>>

=item since: 2.0.00

=back





=head2 C<is_empty>

Test whether the bucket brigade is empty

  $ret = $bb->is_empty();

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

=item ret: C<$ret> ( boolean )

=item since: 2.0.00

=back








=head2 C<first>

Return the first bucket in a brigade

  $b_first = $bb->first;

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

=item ret: C<$b_first>
( C<L<APR::Bucket object|docs::2.0::api::APR::Bucket>> )

The first bucket in the bucket brigade C<$bb>.

C<undef> is returned if there are no buckets in C<$bb>.

=item since: 2.0.00

=back







=head2 C<flatten>

Get the data from buckets in the bucket brigade as one string

  $len = $bb->flatten($buffer);
  $len = $bb->flatten($buffer, $wanted);

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

=item arg1: C<$buffer> ( SCALAR )

The buffer to fill. All previous data will be lost.

=item opt arg2: C<$wanted> ( number )

If no argument is passed then all data will be returned. If C<$wanted>
is specified -- that number or less bytes will be returned.

=item ret: C<$len> ( number )

How many bytes were actually read.

C<$buffer> gets populated with the string that is read. It will
contain an empty string if there was nothing to read.


=item since: 2.0.00

=item excpt: C<L<APR::Error|docs::2.0::api::APR::Error>>

=back







=head2 C<insert_head>

Insert a list of buckets at the front of a brigade

  $bb->insert_head($b);

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

Brigade to insert into

=item arg1: C<$b>
( C<L<APR::Bucket object|docs::2.0::api::APR::Bucket>> )

the bucket to insert. More buckets could be attached to that bucket.

=item ret: no return value

=item since: 2.0.00

=back





=head2 C<insert_tail>

Insert a list of buckets at the end of a brigade

  $bb->insert_tail($b);

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

Brigade to insert into

=item arg1: C<$b>
( C<L<APR::Bucket object|docs::2.0::api::APR::Bucket>> )

the bucket to insert. More buckets could be attached to that bucket.

=item ret: no return value

=item since: 2.0.00

=back







=head2 C<last>

Return the last bucket in the brigade

  $b_last = $bb->last;

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

=item ret: C<$b_last>
( C<L<APR::Bucket object|docs::2.0::api::APR::Bucket>> )

The last bucket in the bucket brigade C<$bb>.

C<undef> is returned if there are no buckets in C<$bb>.

=item since: 2.0.00

=back






=head2 C<length>

Return the total length of the data in the brigade (not the number of
buckets)

  $len = $bb->length;

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

=item ret: C<$len> ( number )

=item since: 2.0.00

=back







=head2 C<new>

  my $nbb = APR::Brigade->new($p, $bucket_alloc);
  my $nbb =          $bb->new($p, $bucket_alloc);

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object or class|docs::2.0::api::APR::Brigade>> )

=item arg1: C<$p>
( C<L<APR::Pool object|docs::2.0::api::APR::Pool>> )

=item arg2: C<$bucket_alloc>
( C<L<APR::BucketAlloc object|docs::2.0::api::APR::BucketAlloc>> )

=item ret: C<$nbb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

a newly created bucket brigade object

=item since: 2.0.00

=back

Example:

Create a new bucket brigade, using the request object's pool:

  use Apache2::Connection ();
  use Apache2::RequestRec ();
  use APR::Brigade ();
  my $bb = APR::Brigade->new($r->pool, $r->connection->bucket_alloc);






=head2 C<bucket_alloc>

Get the bucket allocator associated with this brigade.

  my $ba = $bb->bucket_alloc();

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object or class|docs::2.0::api::APR::Brigade>> )

=item ret: C<$ba>
( C<L<APR::BucketAlloc object|docs::2.0::api::APR::BucketAlloc>> )

=item since: 2.0.00

=back






=head2 C<next>

Return the next bucket in a brigade

  $b_next = $bb->next($b);

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

=item arg1: C<$b>
( C<L<APR::Bucket object|docs::2.0::api::APR::Bucket>> )

The bucket after which the next bucket C<$b_next> is located

=item ret: C<$b_next>
( C<L<APR::Bucket object|docs::2.0::api::APR::Bucket>> )

The next bucket after bucket C<$b>.

C<undef> is returned if there is no next bucket (i.e. C<$b> is the
last bucket).

=item since: 2.0.00

=back







=head2 C<pool>

The pool the brigade is associated with.

  $pool = $bb->pool;

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

=item ret: C<$pool>
( C<L<APR::Pool object|docs::2.0::api::APR::Pool>> )

=item since: 2.0.00

=back

The data is not allocated out of the pool, but a cleanup is registered
with this pool.  If the brigade is destroyed by some mechanism other
than pool destruction, the destroying function is responsible for
killing the registered cleanup.








=head2 C<prev>

Return the previous bucket in the brigade

  $b_prev = $bb->prev($b);

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

=item arg1: C<$b>
( C<L<APR::Bucket object|docs::2.0::api::APR::Bucket>> )

The bucket located after bucket C<$b_prev>

=item ret: C<$b_prev>
( C<L<APR::Bucket object|docs::2.0::api::APR::Bucket>> )

The bucket located before bucket C<$b>.

C<undef> is returned if there is no previous bucket (i.e. C<$b> is the
first bucket).

=item since: 2.0.00

=back








=head2 C<split>

Split a bucket brigade into two, such that the given bucket is the
first in the new bucket brigade.

  $bb2 = $bb->split($b);

=over 4

=item obj: C<$bb>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

The brigade to split

=item arg1: C<$b>
( C<L<APR::Bucket object|docs::2.0::api::APR::Bucket>> )

The first bucket of the new brigade

=item ret: C<$bb2>
( C<L<APR::Brigade object|docs::2.0::api::APR::Brigade>> )

The new brigade.

=item since: 2.0.00

=back

This function is useful when a filter wants to pass only the initial
part of a brigade to the next filter.

Example:

Create a bucket brigade with three buckets, and split it into two
brigade such that the second brigade will have the last two buckets.

  my $bb1 = APR::Brigade->new($r->pool, $c->bucket_alloc);
  my $ba  = $c->bucket_alloc();
  $bb1->insert_tail(APR::Bucket->new($ba, "1"));
  $bb1->insert_tail(APR::Bucket->new($ba, "2"));
  $bb1->insert_tail(APR::Bucket->new($ba, "3"));

C<$bb1> now contains buckets "1", "2", "3". Now do the split at the
second bucket:

  my $b = $bb1->first; # 1
  $b = $bb1->next($b); # 2
  my $bb2 = $bb1->split($b);

Now C<$bb1> contains bucket "1".  C<$bb2> contains buckets: "2", "3"





=head1 See Also

L<mod_perl 2.0 documentation|docs::2.0::index>.




=head1 Copyright

mod_perl 2.0 and its core modules are copyrighted under
The Apache Software License, Version 2.0.




=head1 Authors

L<The mod_perl development team and numerous
contributors|about::contributors::people>.

=cut

