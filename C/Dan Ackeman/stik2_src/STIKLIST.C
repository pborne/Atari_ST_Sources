/* Must define STiKListKeyType and STiKListValType before including this file! */
STiKListGetNextNode( STiKList lst, STiKListNode n )
{
	(void) lst;

	if ( n == NULL )
	{
		return NULL;
	}
	else
	{
		return n->next;
	}
}

static  STiKListValType