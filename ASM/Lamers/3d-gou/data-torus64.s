      cnop 0,4
points3d_gou
      dc.w -91,0,0
      dc.w -65,-26,0
      dc.w -65,26,0
      dc.w -64,0,64
      dc.w -64,0,-64
      dc.w -45,-26,45
      dc.w -45,-26,-45
      dc.w -45,26,45
      dc.w -45,26,-45
      dc.w -39,0,0
      dc.w -27,0,27
      dc.w -27,0,-27
      dc.w 0,0,-91
      dc.w 0,-26,-65
      dc.w 0,26,-65
      dc.w 0,0,-39
      dc.w 0,0,39
      dc.w 0,-26,65
      dc.w 0,26,65
      dc.w 0,0,91
      dc.w 27,0,27
      dc.w 27,0,-27
      dc.w 39,0,0
      dc.w 45,-26,45
      dc.w 45,-26,-45
      dc.w 45,26,45
      dc.w 45,26,-45
      dc.w 64,0,64
      dc.w 64,0,-64
      dc.w 65,-26,0
      dc.w 65,26,0
      dc.w 91,0,0
      cnop 0,4
gouFaces3d
      dc.w 30,25,27,0
      dc.w 31,30,27,0
      dc.w 25,22,20,0
      dc.w 25,30,22,0
      dc.w 22,29,23,0
      dc.w 20,22,23,0
      dc.w 29,27,23,0
      dc.w 31,27,29,0
      dc.w 25,18,19,0
      dc.w 27,25,19,0
      dc.w 18,20,16,0
      dc.w 18,25,20,0
      dc.w 20,23,17,0
      dc.w 16,20,17,0
      dc.w 23,19,17,0
      dc.w 27,19,23,0
      dc.w 7,3,19,0
      dc.w 18,7,19,0
      dc.w 10,18,16,0
      dc.w 7,18,10,0
      dc.w 10,16,17,0
      dc.w 5,10,17,0
      dc.w 19,5,17,0
      dc.w 19,3,5,0
      dc.w 2,0,3,0
      dc.w 7,2,3,0
      dc.w 9,7,10,0
      dc.w 2,7,9,0
      dc.w 1,9,5,0
      dc.w 9,10,5,0
      dc.w 3,1,5,0
      dc.w 3,0,1,0
      dc.w 2,4,0,0
      dc.w 2,8,4,0
      dc.w 8,2,9,0
      dc.w 11,8,9,0
      dc.w 6,9,1,0
      dc.w 11,9,6,0
      dc.w 4,6,1,0
      dc.w 0,4,1,0
      dc.w 8,12,4,0
      dc.w 8,14,12,0
      dc.w 15,8,11,0
      dc.w 14,8,15,0
      dc.w 15,11,13,0
      dc.w 13,11,6,0
      dc.w 4,13,6,0
      dc.w 4,12,13,0
      dc.w 12,26,28,0
      dc.w 14,26,12,0
      dc.w 26,14,21,0
      dc.w 14,15,21,0
      dc.w 21,15,13,0
      dc.w 21,13,24,0
      dc.w 12,28,24,0
      dc.w 13,12,24,0
      dc.w 28,30,31,0
      dc.w 26,30,28,0
      dc.w 26,21,22,0
      dc.w 30,26,22,0
      dc.w 22,24,29,0
      dc.w 22,21,24,0
      dc.w 28,31,29,0
      dc.w 24,28,29,0
      cnop 0,4
gouPointsColor3d ds.w 32
      cnop 0,4
gouColor3d incbin '3d-gou/color2bw.dat'
gouPoints3dCnt dc.l 32-1
gouFaces3dCnt dc.l 64
gouCoordShift dc.w 91
      cnop 0,4
gouColorMap
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w  0
      dc.w 0
      dc.w 2
      dc.w 4
      dc.w 5
      dc.w 7
      dc.w 9
      dc.w 11
      dc.w 13
      dc.w 14
      dc.w 16
      dc.w 18
      dc.w 20
      dc.w 22
      dc.w 23
      dc.w 25
      dc.w 27
      dc.w 29
      dc.w 31
      dc.w 32
      dc.w 34
      dc.w 36
      dc.w 38
      dc.w 40
      dc.w 41
      dc.w 43
      dc.w 45
      dc.w 47
      dc.w 49
      dc.w 50
      dc.w 52
      dc.w 54
      dc.w 56
      dc.w 58
      dc.w 59
      dc.w 61
      dc.w 63
      dc.w 65
      dc.w 67
      dc.w 69
      dc.w 70
      dc.w 72
      dc.w 74
      dc.w 76
      dc.w 78
      dc.w 79
      dc.w 81
      dc.w 83
      dc.w 85
      dc.w 87
      dc.w 88
      dc.w 90
      dc.w 92
      dc.w 94
      dc.w 96
      dc.w 97
      dc.w 99
      dc.w 101
      dc.w 103
      dc.w 105
      dc.w 106
      dc.w 108
      dc.w 110
      dc.w 112
      dc.w 114
      dc.w 115
      dc.w 117
      dc.w 119
      dc.w 121
      dc.w 123
      dc.w 124
      dc.w 126
      dc.w 128
      dc.w 130
      dc.w 132
      dc.w 133
      dc.w 135
      dc.w 137
      dc.w 139
      dc.w 141
      dc.w 142
      dc.w 144
      dc.w 146
      dc.w 148
      dc.w 150
      dc.w 151
      dc.w 153
      dc.w 155
      dc.w 157
      dc.w 159
      dc.w 160
      dc.w 162
      dc.w 164
      dc.w 166
      dc.w 168
      dc.w 169
      dc.w 171
      dc.w 173
      dc.w 175
      dc.w 177
      dc.w 178
      dc.w 180
      dc.w 182
      dc.w 184
      dc.w 186
      dc.w 187
      dc.w 189
      dc.w 191
      dc.w 193
      dc.w 195
      dc.w 197
      dc.w 198
      dc.w 200
      dc.w 202
      dc.w 204
      dc.w 206
      dc.w 207
      dc.w 209
      dc.w 211
      dc.w 213
      dc.w 215
      dc.w 216
      dc.w 218
      dc.w 220
      dc.w 222
      dc.w 224
      dc.w 225
      dc.w 227
      dc.w 229
      dc.w 231
      dc.w 233
      dc.w 234
      dc.w 236
      dc.w 238
      dc.w 240
      dc.w 242
      dc.w 243
      dc.w 245
      dc.w 247
      dc.w 249
      dc.w 251
      dc.w 252
      dc.w 254
      dc.w  255
      dc.w  255
      dc.w  255
      dc.w  255
      dc.w  255
      dc.w  255
      dc.w  255
      dc.w  255
      dc.w  255
      dc.w  255
      cnop 0,4