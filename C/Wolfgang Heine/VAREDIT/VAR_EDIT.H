
char *var_edit(OBJECT tree[], int index, int n, char *pt, char *tx, char *val);
    /* OBJECT tree[]:       Object passed                     */
    /* int index:           Object index                      */
    /* int n:               Length of the Edit fields         */
    /* char *pt, *tx, *val: Pointer to the Mask text and Text */

int hndl_dial (OBJECT tree[],int cur,int x,int y,int w,int h);
    /* OBJECT tree []:  Tree address                  */
    /* int cur,x,y,w,h: Where should the Cursor sit?  */
