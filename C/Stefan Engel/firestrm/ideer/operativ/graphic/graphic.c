/************************************************************************/
/* Draw a Point                                                         */
/************************************************************************/
short Draw_Point(Window* win, Pen* pen,Point point);
{
  
};

/************************************************************************/
/* Draw Multiple Points                                                 */
/************************************************************************/
short Draw_Points(Window* win,Pen* pen,Point* point,short number)
{
  while(number>0)
  {
    point++;
    number--;
  }
};

/************************************************************************/
/* Draw an Line                                                         */
/************************************************************************/
short Draw_LIne(Window* win,Pen* pen,Point *point)
{
  
};

/************************************************************************/
/* Draw multiple lines                                                  */
/************************************************************************/
short Draw_Lines(Window* win,Pen* pen,Point *point,short number)
{
  while(number>0)
  {
    piont+=2;
    number--;
  }
};

/************************************************************************/
/* Draw connected Lines                                                 */
/************************************************************************/
short Draw_Polyline(Window* win,Pen* pen,Point *point,short number)
{
	while(number>1)
	{
    point++;
		number--;
	}
};

/************************************************************************/
/************************************************************************/