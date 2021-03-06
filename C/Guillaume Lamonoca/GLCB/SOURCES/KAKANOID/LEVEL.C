/* Chaque tableau fait 13x2 colonne x 15 lignes */
/* Premier caractere : couleur, Deuxieme nb de cout est couleur G */

#include "level.h"

Niveau Levels[MAX_LEVEL] =
{
 {
  "                          ",
  "                          ",
  "                          ",
  "                          ",
  "G2G2G2G2G2G2G2G2G2G2G2G2G2",
  "5 5 5 5 5 5 5 5 5 5 5 5 5 ",
  "2 2 2 2 2 2 2 2 2 2 2 2 2 ",
  "E E E E E E E E E E E E E ",
  "4 4 4 4 4 4 4 4 4 4 4 4 4 ",
  "3 3 3 3 3 3 3 3 3 3 3 3 3 ",
  "                          ",
  "                          ",
  "                          ",
  "                          ",
  "                          ",
  "                          ",
  "                          "
 },

 {
  "                          ",
  "                          ",
  "F                         ",
  "F 1                       ",
  "F 1 9                     ",
  "F 1 9 3                   ",
  "F 1 9 3 5                 ",
  "F 1 9 3 5 E               ",
  "F 1 9 3 5 E 4             ",
  "F 1 9 3 5 E 4 2           ",
  "F 1 9 3 5 E 4 2 F         ",
  "F 1 9 3 5 E 4 2 F 1       ",
  "F 1 9 3 5 E 4 2 F 1 9     ",
  "F 1 9 3 5 E 4 2 F 1 9 3   ",
  "G2G2G2G2G2G2G2G2G2G2G2G25 ",
  "                          ",
  "                          "
 },

 {
  "                          ",
  "                          ",
  "3 3 3 3 3 3 3 3 3 3 3 3 3 ",
  "                          ",
  "3 3 3 IIIIIIIIIIIIIIIIIIII",
  "                          ",
  "5 5 5 5 5 5 5 5 5 5 5 5 5 ",
  "                          ",
  "IIIIIIIIIIIIIIIIIIII3 3 3 ",
  "                          ",
  "4 4 4 4 4 4 4 4 4 4 4 4 4 ",
  "                          ",
  "E E E IIIIIIIIIIIIIIIIIIII",
  "                          ",
  "9 9 9 9 9 9 9 9 9 9 9 9 9 ",
  "                          ",
  "IIIIIIIIIIIIIIIIIIII9 9 9 "
 },

 {
  "                          ",
  "                          ",
  "                          ",
  "  1 9 3 G2E   2 F 1 9 3   ",
  "  9 3 G2E 4   F 1 9 3 G2  ",
  "  3 G2E 4 2   1 9 3 G2E   ",
  "  G2E 4 2 F   9 3 G2E 4   ",
  "  E 4 2 F 1   3 G2E 4 2   ",
  "  4 2 F 1 9   G2E 4 2 F   ",
  "  2 F 1 9 3   E 4 2 F 1   ",
  "  F 1 9 3 G2  4 2 F 1 9   ",
  "  1 9 3 G2E   2 F 1 9 3   ",
  "  9 3 G2E 4   F 1 9 3 G2  ",
  "  3 G2E 4 2   1 9 3 G2E   ",
  "  G2E 4 2 F   9 3 G2E 4   ",
  "  E 4 2 F 1   3 G2E 4 F   ",
  "  4 2 F 1 9   G2E 4 2 F   "
 },

 {
  "                          ",
  "      2           2       ",
  "      2           2       ",
  "        2       2         ",
  "        2       2         ",
  "      G2G2G2G2G2G2G2      ",
  "      G2G2G2G2G2G2G2      ",
  "    G2G25 G2G2G25 G2G2    ",
  "    G2G25 G2G2G25 G2G2    ",
  "  G2G2G2G2G2G2G2G2G2G2G2  ",
  "  G2G2G2G2G2G2G2G2G2G2G2  ",
  "  G2G2G2G2G2G2G2G2G2G2G2  ",
  "  G2  G2G2G2G2G2G2G2  G2  ",
  "  G2  G2          G2  G2  ",
  "  G2  G2          G2  G2  ",
  "        G2G2  G2G2        ",
  "        G2G2  G2G2        ",
 },

 {
  "                          ",
  "                          ",
  "                          ",
  "E   5   3   9   3   5   E ",
  "E   5   3   9   3   5   E ",
  "E   5   3   9   3   5   E ",
  "E   5   3   9   3   5   E ",
  "E   5   3   9   3   5   E ",
  "E   5   3   9   3   5   E ",
  "E   II1 II1 II1 II1 II  E ",
  "E   5   3   9   3   5   E ",
  "E   5   3   9   3   5   E ",
  "E   5   3   9   3   5   E ",
  "E   5   3   9   3   5   E ",
  "1   1   II  1   II  1   1 ",
  "E   5   3   9   3   5   E ",
  "                          "
 },

 {
  "                          ",
  "                          ",
  "                          ",
  "          2 2 4           ",
  "        2 2 4 4 E         ",
  "      2 2 4 4 E E 5       ",
  "      2 4 4 E E 5 5       ",
  "    2 4 4 E E 5 5 3 3     ",
  "    4 4 E E 5 5 3 3 9     ",
  "    4 E E 5 5 3 3 9 9     ",
  "    E E 5 5 3 3 9 9 1     ",
  "    E 5 5 3 3 9 9 1 1     ",
  "    5 5 3 3 9 9 1 1 F     ",
  "      3 3 9 9 1 1 F       ",
  "      3 9 9 1 1 F F       ",
  "        9 1 1 F F         ",
  "          1 F F           "
 },

 {
  "                          ",
  "                          ",
  "                          ",
  "      II  II  II  II      ",
  "  II                  II  ",
  "  IIII  II      II  IIII  ",
  "            F             ",
  "  II      II1 II      II  ",
  "      II    9     II      ",
  "            3             ",
  "      II    5     II      ",
  "  II      IIE II      II  ",
  "            4             ",
  "  IIII  II      II  IIII  ",
  "  II                  II  ",
  "      II  II  II  II      ",
  "                          "
 },

 {
  "                          ",
  "                          ",
  "  II  II          II  II  ",
  "  II3 II          II3 II  ",
  "  II9 II          II9 II  ",
  "  IIIIII          IIIIII  ",
  "                          ",
  "        4 F F F 2         ",
  "        4 1 1 1 2         ",
  "        4 9 9 9 2         ",
  "        4 3 3 3 2         ",
  "        4 5 5 5 2         ",
  "        4 E E E 2         ",
  "                          ",
  "                          ",
  "                          ",
  "                          "
 },

 {
  "  II                      ",
  "                          ",
  "  II                      ",
  "  II                      ",
  "  II          E           ",
  "  II        E 9 E         ",
  "  II      E 9 F 9 E       ",
  "  II    E 9 F 9 F 9 E     ",
  "  II  E 9 F 9 G29 F 9 E   ",
  "  II    E 9 F 9 F 9 E     ",
  "  II      E 9 F 9 E       ",
  "  II        E 9 E         ",
  "  II          E           ",
  "  II                      ",
  "  II                      ",
  "  II                      ",
  "  IIIIIIIIIIIIIIIIIIIIIIII"
 },

 {
  "                          ",
  "                          ",
  "                          ",
  "  G3G3G3G3G3G3G3G3G3G3G3  ",
  "  G3                  G3  ",
  "  G3  G3G3G3G3G3G3G3  G3  ",
  "  G3  G3          G3  G3  ",
  "  G3  G3  G3G3G3  G3  G3  ",
  "  G3  G3  G3  G3  G3  G3  ",
  "  G3  G3  G3G3G3  G3  G3  ",
  "  G3  G3          G3  G3  ",
  "  G3  G3G3G3G3G3G3G3  G3  ",
  "  G3                  G3  ",
  "  G3G3G3G3G3G3G3G3G3G3G3  ",
  "                          ",
  "                          ",
  "                          "
 },

 {
  "                          ",
  "                          ",
  "IIIIIIIIIIIIIIIIIIIIIIIIII",
  "        II          II3   ",
  "  IIF   II          II    ",
  "  II    II    II    II    ",
  "  II    II3   II    II    ",
  "  II    II    II    II    ",
  "  II  1 II    II  F II    ",
  "  II    II    II    II    ",
  "  II    II  5 II    II    ",
  "  II    II    II    II    ",
  "  II9         II          ",
  "  II          II        2 ",
  "  IIIIIIIIIIIIIIIIIIIIIIII",
  "                          ",
  "                          "
 },

 {
  "                          ",
  "                          ",
  "                          ",
  "  2 2 2   F F F   2 2 2   ",
  "  4 4 4   1 1 1   4 4 4   ",
  "  E E E   9 9 9   E E E   ",
  "  5 5 5   3 3 3   5 5 5   ",
  "  3 3 3   5 5 5   3 3 3   ",
  "  9 9 9   E E E   9 9 9   ",
  "  1 1 1   4 4 4   1 1 1   ",
  "  F F F   2 2 2   F F F   ",
  "                          ",
  "                          ",
  "                          ",
  "                          ",
  "                          ",
  "                          "
 },

 {
  "                          ",
  "                          ",
  "                          ",
  "E E E E E E E E E E E E E ",
  "II                      II",
  "E E E E E E E E E E E E E ",
  "                          ",
  "G3G3G3G3G3G3G3G3G3G3G3G3G3",
  "II                      II",
  "F F F F F F F F F F F F F ",
  "                          ",
  "G3G3G3G3G3G3G3G3G3G3G3G3G3",
  "II                      II",
  "5 5 5 5 5 5 5 5 5 5 5 5 5 ",
  "                          ",
  "5 5 5 5 5 5 5 5 5 5 5 5 5 ",
  "II                      II"
 },

/* 15 */

 {
  "                          ",
  "                          ",
  "                          ",
  "                          ",
  "                          ",
  "  F II              IIF   ",
  "  F 2 II          II2 F   ",
  "  F 2 2 II      II2 2 F   ",
  "  F 2 2 2 IIF II2 2 2 F   ",
  "  F 2 2 2 2 F 2 2 2 2 F   ",
  "  F 2 2 2 2 F 2 2 2 2 F   ",
  "  F 2 2 2 2 F 2 2 2 2 F   ",
  "  G32 2 2 2 F 2 2 2 2 G3  ",
  "    G32 2 2 F 2 2 2 G3    ",
  "      G32 2 F 2 2 G3      ",
  "        G32 F 2 G3        ",
  "          G3F G3          "
 },

/* 16 */

 {
  "                          ",
  "                          ",
  "                          ",
  "            II            ",
  "        F F   F F         ",
  "    F F     II    F F     ",
  "F F     1 1   1 1     F F ",
  "    1 1     II    1 1     ",
  "1 1     2 2   2 2     1 1 ",
  "    2 2     II    2 2     ",
  "2 2     3 3   3 3     2 2 ",
  "    3 3     II    3 3     ",
  "3 3     5 5   5 5     3 3 ",
  "    5 5     II    5 5     ",
  "5 5     E E   E E     5 5 ",
  "    E E           E E     ",
  "E E                   E E "
 },

/* 17 */

 {
  "                          ",
  "            G3            ",
  "      E E E G33 3 3       ",
  "    E E E F F F 3 3 3     ",
  "    E E F F F F F 3 3     ",
  "  E E E F F F F F 3 3 3   ",
  "  E E E F F F F F 3 3 3   ",
  "  E E E F F F F F 3 3 3   ",
  "  G3    G3  G3  G3    G3  ",
  "            G3            ",
  "            G3            ",
  "            G3            ",
  "        II  II            ",
  "        IIIIII            ",
  "          II              ",
  "                          ",
  "                          "

 },

/* 18 */

 {
  "                          ",
  "                          ",
  "                          ",
  "1   II2 2 2 2 2 2 2 II  1 ",
  "1   IIII2 2 2 2 2 IIII  1 ",
  "1   II  II2 2 2 II  II  1 ",
  "1   II  4 II2 II9   II  1 ",
  "1   II  4   G4  9   II  1 ",
  "1   II  4   3   9   II  1 ",
  "1   II  4   3   9   II  1 ",
  "1   II  4   3   9   II  1 ",
  "1   II  4   3   9   II  1 ",
  "1 IIIIII4   3   9 IIIIII1 ",
  "                          ",
  "                          ",
  "                          ",
  "                          "
 },

/* 19 */

 {
  "                          ",
  "                          ",
  "                          ",
  "    IIIIIIIIIIIIIIIIII    ",
  "    3 5 E 4 II4 E 5 3     ",
  "    3 5 E 4 II4 E 5 3     ",
  "    3 5 E 4 II4 E 5 3     ",
  "    3 5 E 4 2 4 E 5 3     ",
  "    3 5 E 4 II4 E 5 3     ",
  "    3 5 E 4 II4 E 5 3     ",
  "    3 5 E 4 II4 E 5 3     ",
  "    IIIIIIIIIIIIIIIIII    ",
  "                          ",
  "                          ",
  "                          ",
  "                          ",
  "                          "
 },

/* 20 */

 {
  "                          ",
  "IIE II1 II9 II3 II5 IIE II",
  "II4 IIG4IIG4IIG4IIG4II1 II",
  "                          ",
  "IIE II  II  II  II  II  II",
  "II  II1 II  II  II  II  II",
  "II  II  II9 II  II  II  II",
  "II  II  II  II3 II  II  II",
  "II  II  II  II  II5 II  II",
  "                      E   ",
  "    II  II  II  II5 II    ",
  "    II  II  II3 II  II    ",
  "    II  II9 II  II  II    ",
  "      1 II  II  II        ",
  "  E     II  II  II        ",
  "            II            ",
  "                          "
 },

};

Niveau G_NiveauActif =
{
 "AAAAAAAAAAAAAAAAAAAAAAAAAA",
 "BBBBBBBBBBBBBBBBBBBBBBBBBB",
 "CCCCCCCCCCCCCCCCCCCCCCCCCC",
 "DDDDDDDDDDDDDDDDDDDDDDDDDD",
 "EEEEEEEEEEEEEEEEEEEEEEEEEE",
 "FFFFFFFFFFFFFFFFFFFFFFFFFF",
 "GGGGGGGGGGGGGGGGGGGGGGGGGG",
 "HHHHHHHHHHHHHHHHHHHHHHHHHH",
 "IIIIIIIIIIIIIIIIIIIIIIIIII",
 "JJJJJJJJJJJJJJJJJJJJJJJJJJ",
 "KKKKKKKKKKKKKKKKKKKKKKKKKK",
 "LLLLLLLLLLLLLLLLLLLLLLLLLL",
 "MMMMMMMMMMMMMMMMMMMMMMMMMM",
 "NNNNNNNNNNNNNNNNNNNNNNNNNN",
 "OOOOOOOOOOOOOOOOOOOOOOOOOO",
 "PPPPPPPPPPPPPPPPPPPPPPPPPP",
 "QQQQQQQQQQQQQQQQQQQQQQQQQQ"
};
 
