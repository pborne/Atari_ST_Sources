**************************************************************
*ROUTINES BY EDDIE BRYAN OF THE HAPPENING BOIZ		     *
**************************************************************

*EDDIES BARREL SCROLLL ROUTINE - BASED ON MANIKINS TWIST SCROLL
*ADAPTED FOR USE WITH STOS !!!!!!!!!
*THIS ONE IS FOR MEGA TEXT SCROLLERS - 5 AT ONCE!!!



*A1-DESTINATION
*A0 SOURCE
*D0-SOURCE POS (160'S)
*D1-DEST POS   (160'S)

BARREL_SCROLL	ADD.L 	D1,A1			
		ADD.L	D0,A0		*SOURCE ADDRESS
		MOVE.L	A1,A3
		ADD.L	#15840,A3	*PLANE 1 
		ADD.L	#2,A1		*PLANE 2
		MOVE.L #ADDTAB,A2	
		MOVE.W #99,D0		*LINES TO DRAW
CON_LOOP		

*PLANE ONE -		
		MOVE.W (A0),16(A1)
		MOVE.W 8(A0),24(A1)		
		MOVE.W (A0),48(A1)
		MOVE.W 8(A0),56(A1)
		MOVE.W (A0),80(A1)
		MOVE.W 8(A0),88(A1)		
		MOVE.W (A0),112(A1)
		MOVE.W 8(A0),120(A1)
		MOVE.W (A0),144(A1)
		MOVE.W 8(A0),152(A1)

*PLANE TWO -
		MOVE.W (A0),16(A3)
		MOVE.W 8(A0),24(A3)		
		MOVE.W (A0),48(A3)
		MOVE.W 8(A0),56(A3)
		MOVE.W (A0),80(A3)
		MOVE.W 8(A0),88(A3)		
		MOVE.W (A0),112(A3)
		MOVE.W 8(A0),120(A3)
		MOVE.W (A0),144(A3)
		MOVE.W 8(A0),152(A3)

		ADD.L 	#160,A1		
		SUB.L	#160,A3
		MOVE.W 	(A2)+,D1		
		ADD.W 	D1,A0		
		DBF D0,CON_LOOP
		RTS

ADDTAB		DC.W 800,640,480,320,320,320,320,160,320,160,320,160,160,160,0,160,160,0
		DC.W	160,160,0,160,160,0,160,0,160,0,160,0,160,0,160,0
		DC.W 0,160,0,160,0,160,0,160,0,160,0,160,160,0,160,160
		DC.W 0,160,0,160,0,160,0,160,0,160,0,160,160,0,160,160
		DC.W 0,160,0,160,0,160,0,160,0,160,0,160,160,0,160,160
		DC.W	0,160,160,0,160,160,160,320,160,320,160,320,320,320,480,320,640,800

GOING_UP	DC.B	0	



