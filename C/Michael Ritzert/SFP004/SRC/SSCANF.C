#define __SRC__               /* fake prototypes */
#include <stdio.h>

static int sgetc(s)
	unsigned char **s;
	{
	register unsigned char c;

	c = *(*s)++;
	return((c == '\0') ? EOF : c);
	}

static int sungetc(c, s)
	int c;
	unsigned char **s;
	{
	if(c == EOF)
		c = '\0';
	return(*--(*s) = c);
	}

sscanf(buf, fmt, arg)
	const char *buf, *fmt;
	int arg;
	{
	return(_scanf(&buf, sgetc, sungetc, fmt, &arg));
	}
