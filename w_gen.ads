PACKAGE w_gen IS

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- w_gen package specification
   -------------------------------

---------------------------------------------------------
-- declaration of data types and structures

        row_range : CONSTANT Integer := 50;
        col_range : CONSTANT Integer := 79;

        SUBTYPE row IS Integer RANGE 1..row_range;
        SUBTYPE col IS Integer RANGE 1..col_range;

        TYPE Window IS RECORD
                st_row : row;
                st_col : col;
                length : col;
                width : row;
        END RECORD;
---------------------------------------------------------

        PROCEDURE clr_scr;
                -- receives : none
                -- action : clears entire prompt screen
                -- returns : none

        PROCEDURE move_to (gCol : IN col;
                           gRow : IN row);
                -- receives : row, col
                -- action : moves cursor to coordinates
                -- returns : none

        PROCEDURE mk_border (sCol : IN col;
                             sRow : IN row;
                             height : IN row;
                             width : IN col);
                -- receives : col, row, row, col
                -- action : forms a window by generating a
                --      border with the given parameters
                -- returns : none

        PROCEDURE fill (C : IN col;
                        R : IN row;
                        H : IN row;
                        W : IN col;
                        fName : IN String);
                -- receives : col, row, row, col
                -- action : fills the window given by the
                --      parameters with text from file
                -- returns : none

        PROCEDURE blank_box (sCol : IN col;
                             sRow : IN row;
                             height : IN row;
                             width : IN col);
                -- receives : col, row, row, col
                -- action : clears the window given by the
                --      parameters of all characters
                -- returns : none
END w_gen;
