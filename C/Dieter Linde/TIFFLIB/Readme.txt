$Header: /usr/people/sam/tiff/libtiff/RCS/README,v 1.2 90/11/24 11:33:34 sam Exp $

Configuration Comments:
----------------------
There is one configuration-related define that you should
set in the Makefile if you want it:

SUBFILE_COMPAT  if this is defined in tif_dir.c, an entry will be
                included in the tag table to support short SubFileType
                tags, as (incorrectly) generated by earlier versions
                of this library

By default, SUBFILE_COMPAT is not defined.

Portability Comments:
--------------------
I run this code on SGI machines (big-endian, MIPS CPU, 32-bit ints,
IEEE floating point).  Makefiles exist for other platforms that
code runs on -- this work has mostly been done by other people.
I've also been told that the code runs on Macintosh and PC-based
systems, although I don't know the particulars.

In general, I promise only that the code runs on SGI machines.
I will, however, gladly take back fixes to make it work on other
systems -- when the changes are reasonable unobtrusive.

I've tried to isolate as many of the UNIX-dependencies as possible in
two files: tiffcompat.h and tif_compat.c.  There are still some problems
with the use of lseek().  I personally don't care to devote
much effort to making the code work (untouched) on lots of non-UNIX
platforms.

Machine dependencies such as byte order are specified in the
file machdep.h.  You DO NOT need to define the floating point
related stuff for the library to compile!  This may be needed
in the future if/when floating point data formats are supported.

Two general portability-related defines are:
    USE_VARARGS         define as 0 or 1 to select between the
                        use of varargs.h and stdarg.h; i.e.
                        -DUSE_VARARGS=0 means use stdarg.h
    USE_PROTOTYPES      define as 0 or 1 to select function
                        declarations with parameter types
If you compile the code with prototypes (USE_PROTOTYPES=1), then
you must have USE_VARARGS=0.

Beware that if __STDC__ is defined and the USE_* symbols are
NOT defined, then compat.h defines:
    USE_PROTOTYPES      1
    USE_VARARGS         0

There is also a control over how to use the C preprocessor to paste
lexical tokens together.  Ansi C defines the ## operator.  This is
used if __STDC__ is defined; otherwise the usual trick is done (see
tiffcompat.h).

General Comments:
----------------
The TIFF library is designed to hide as much of the details of TIFF as
possible.  In particular, TIFF directories are read in their entirety
into an internal format.  This means that only the tags known by the
library are available to a user and that certain tag data may be
maintained that a user doesn't care about (e.g. color response
curves).

To add support for a new directory tag the following changes will be
needed:

1. Define the tag in tiff.h.
2. Add a field to the directory structure in tiffio.h and define a
   FIELD_* bit.
3. Add an entry in the FieldInfo array defined at the top of tiff_dir.c.
4. Add entries in TIFFSetField() and TIFFGetField1() for the new tag.
5. (optional) If the value associated with the tag is not a scalar value
   (e.g. the array for GrayResponseCurve), then add the appropriate
   code to TIFFReadDirectory() and TIFFWriteDirectory().  You're best
   off finding a similar tag and cribbing code.
6. Add support to TIFFPrintDirectory() in tiff_print.c to print the
   tag's value.

To add support for a compression algorithm:

1. Define the tag value in tiff.h.
2. Edit the file tiff_compress.c to add an entry to the
   CompressionSchemes[] array.
3. Create a file with the compression scheme code, by convention files
   are named tiff_*.c (except perhaps on System V where the tiff_ prefix
   pushes some filenames over 14 chars.
4. Edit the Makefile to include the new source file.

A compression scheme, say foo, can have up to 6 entry points:

TIFFfoo(tif)            /* initialize scheme and setup entry points in tif */
fooPreDecode(tif)       /* called once per strip, after data is read,
                           but before the first row in a strip is decoded */
fooDecode(tif, bp, cc)  /* decode cc bytes of data into the supplied buffer */
fooStripEncode(tif)     /* called once per strip, before the first row in
                           a strip is encoded */
fooEncode(tif, bp, cc)  /* encode cc bytes of user data (bp) */
fooPostEncode(tif)      /* called once per strip, just before data is written */
fooSeek(tif, row)       /* seek forwards row scanlines from the beginning
                           of a strip (row will always be >0 and <rows/strip */
fooCleanup(tif)         /* called when compression scheme is replaced by user */

The library handles most I/O buffering.  There are two data buffers
when decoding data: a raw data buffer that holds all the data in a
strip, and a user-supplied scanline buffer that compression schemes
place decoded data into.  When encoding data the data in the
user-supplied scanline buffer is encoded into the raw data buffer (from
where it's written).  Decoding routines should never have to explicitly
read data -- a full strip's worth of raw data is read and scanlines
never cross strip boundaries.  Encoding routines must be cognizant of
the raw data buffer size and call TIFFFlushData1() when necessary.
Note that any pending data is automatically flushed when a new strip is
started, so there's no need do that in the tif_encodestrip routine (if
one exists).

The variables tif_rawcc, tif_rawdata, and tif_rawcp in a TIFF structure
are associated with the raw data buffer.  tif_rawcc must be non-zero
for the library to automatically flush data.  The variable
tif_scanlinesize is the size a user's scanline buffer should be.  This
should not be used by compression routines, except where it relates to
the compression algorithm.  That is, the cc parameter to the tif_decode
and tif_encode routines should be used in terminating
decompression/compression.  This ensures these routines can be used,
for example, to decode/encode entire strips of data.

In general, if you have a new compression algorithm to add, work from
the code for an existing routine.  In particular, tiff_dumpmode.c has
the trivial code for the "nil" compression scheme, tiff_packbits.c is a
simple byte-oriented scheme that has to watch out for buffer
boundaries, and tiff_lzw.c has the LZW scheme that has the most
complexity -- it tracks the buffer boundary at a bit level.

Of course, using a private compression scheme (or private tags) limits
the portability of your TIFF files.
