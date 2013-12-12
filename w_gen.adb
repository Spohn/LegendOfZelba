with Ada.Text_IO;
with Screen;
use Ada.Text_IO;

PACKAGE BODY w_gen IS

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- w_gen Package
   -------------------------------
---------------------------------------------------------
-- clears the screen

        PROCEDURE clr_scr IS
      R, C : Integer := 1;
        BEGIN
            move_to (1,1);
            WHILE R < 44 LOOP
               WHILE C < 79 LOOP
                    Put (" ");
                    C := C + 1;
               END LOOP;
               R := R + 1;
               C := 1;
               New_Line;
            END LOOP;

        END clr_scr;
---------------------------------------------------------
-- moves cursor to independent position

        PROCEDURE move_to (gCol : IN col;
                           gRow : IN row) IS
        BEGIN
            Screen.Movecursor(gCol, gRow);
        END move_to;
---------------------------------------------------------
-- makes border around a designated window

        PROCEDURE mk_border (sCol : IN col;
                             sRow : IN row;
                             height : IN row;
                             width : IN col) IS
        num : Integer := 1;
        BEGIN
                move_to (gCol => sCol, gRow => sRow);

                FOR CMove IN 1..width LOOP
                        Put ("-");
                END LOOP;
                New_Line;

                move_to (gCol => sCol, gRow => (sRow + num));

                FOR RMove IN 1..(height - 1) LOOP
                        num := num + 1;
                        Put ("|");

                        FOR CMove2 IN 1..(width - 2) LOOP
                                Put (" ");
                        END LOOP;

                        Put ("|");
                        New_Line;
                        move_to (gCol => sCol, gRow => (sRow + num));
                END LOOP;

                FOR CMove3 IN 1..width LOOP
                        Put ("-");
                END LOOP;
        END mk_border;
---------------------------------------------------------
-- fill a designated window with text from file

        PROCEDURE fill (C : IN col;
                        R : IN row;
                        H : IN row;
                        W : IN col;
                        fName : IN String) IS
        fileVar : File_Type;
        current : Character;
        lCount : Integer := 1;
        BEGIN
                Open (File => fileVar, Mode => In_File, Name => fName);
                Get (File => fileVar, Item => current);

                move_to (gCol => (C + 3), gRow =>(R + 1));

                LOOP
                        IF current /= '%' THEN
                                Put (Item => current);
                        END IF;

                        IF current = '%' THEN   -- operator EOL character
                                move_to (gCol =>(C + 3), gRow => (R + 1 + lcount));
                                lCount := lCount + 1;
                        ELSIF End_of_Line(fileVar) THEN
                                move_to (gCol =>(C + 3), gRow => (R + 1 + lCount));
                                lCount := lCount + 1;
                        END IF;

                        EXIT WHEN End_of_File(fileVar);

                        Get (File => fileVar, Item => current);
                END LOOP;
                Close(fileVar);
        END fill;
---------------------------------------------------------
-- clear a designated window of all characters

        PROCEDURE blank_box (sCol : IN col;
                             sRow : IN row;
                             height : IN row;
                             width : IN col) IS
        BEGIN
                move_to (gCol => sCol, gRow => sRow);
                FOR row_move IN 1..(height + 1) LOOP
                        FOR col_move IN 1..width LOOP
                                Put (" ");
                        END LOOP;
                        move_to (gCol => sCol, gRow => (sRow + row_move));
                END LOOP;
        END blank_box;
---------------------------------------------------------

END w_gen;
