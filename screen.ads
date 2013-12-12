with ada.text_io; use ada.text_io;
with NPC_PC; use NPC_PC;
with enemy_bst; use enemy_bst;
with list_lib; use list_lib;


package screen is

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- Screen Package specification
   -------------------------------

   type Map_Array is array (1 .. 36, 1 .. 79) of Character; 

   --input map and store in 2d array
   procedure map_input (File : in File_Type; Map : out Map_Array; Hero : in out HeroClass; ET : in out EnemyTree; List : in out LL_Type); 
   --display map
   procedure Print_Map (Map : in Map_Array; Hero : in HeroClass );      
   --more hero on map
   procedure Move (Direction : in character;Map : in out map_array; Hero : in out HeroClass; ET : in out EnemyTree; List : in out LL_type);
   
   ---------------------------------------------------------------------------------------------------------------------
   --Procedures from the screen package provided to us
   ScreenDepth : CONSTANT Integer := 42;
   ScreenWidth : CONSTANT Integer := 200;

  -- subtypes giving the ranges of acceptable inputs
  -- to the cursor-positioning operation

  SUBTYPE Depth IS Integer RANGE 1..ScreenDepth;
  SUBTYPE Width IS Integer RANGE 1..ScreenWidth;
  
  type Colors is ( Black, Red, Green, Yellow, Blue, Magenta, Cyan, White);

  procedure Set_Fore( Fore : Colors);
  -- Pre:
  -- Post: Sets the foreground (text) to the specified color

  PROCEDURE Beep;
  -- Pre:  None
  -- Post: Terminal makes its beep sound once

  PROCEDURE ClearScreen;
  -- Pre:  None
  -- Post: Terminal Screen is cleared

  PROCEDURE MoveCursor (Column : Width; Row : Depth);
  -- Pre:  Column and Row have been assigned values
  -- Post: Cursor is moved to the given spot on the screen
  procedure Pause;
  -- Pre: none
  -- Post: the message "Press return to continue" is display on row 23
  --           and the program waits for the return key

  procedure Pause(Row :    in Depth;
                  Column : in Width;
                  Msg :    in String);
  -- Pre: Row, Column must be within defined screen boundries
  --           or Constraint_Error will be raised
  -- Post: the message Msg is display on row Row, column Column,
  --           and the program waits for the return key

  procedure Set_Back( Back : Colors);
  -- Pre:
  -- Post: Sets the background to the specified color

  procedure Set_Default;
  -- Pre:
  -- Post: Returns both the foreground and background to default colors
  ----------------------------------------------------------------------------------------------------------
end screen;
