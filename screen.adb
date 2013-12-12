with Ada.Text_Io; use Ada.Text_Io;
with ada.integer_text_io; use ada.integer_text_io;
with NPC_PC; use NPC_PC;
with enemy_bst; use enemy_bst;
with Combat_package; use Combat_package;
WITH Ada.Characters.Latin_1;with ada.numerics;
with ada.numerics.Elementary_functions;use ada.numerics.Elementary_functions;
use ada.numerics;
with list_lib; use list_lib;

package body Screen is

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- Screen Package
   -------------------------------
   
   --Input Map from file and place in 2d array
   procedure map_input (File : in File_Type; Map : out Map_Array; Hero : in out HeroClass; ET : in out EnemyTree; List : in out LL_Type) is 
      Map_Char : Character;   
      row:integer:=1;
      col:integer:=1;
      Enemy : EnemyClass;
   begin
      InitLL(List);
      while not end_of_file(file) loop
         while not end_of_line(file) loop
            Get(File,Map_Char);
            Map(row,col):=Map_Char;
            --If input character is x then it is Hero
            if(map_char = 'x') then
               SetHeroCoord(row,col,Hero);
            --If input character is E then it is an enemy
            elsif(map_char = 'E') then
               SetEnemyCoord(row,col,Enemy);
               Insert(ET,Enemy);
            --If input character is K then it is a key
            elsif(map_char = 'K') then
               Add(List,row,col);
            end if;
            col:=col+1;
            
         end loop;
         row:=row+1;
         col:=1;
         if not End_Of_File (file) then
            Skip_Line (file);
         end if;
      end loop;
      
   end map_input;
   --------------------------------------------

   --Display map array
   procedure Print_Map (Map : in Map_Array; Hero : in HeroClass ) is 
      Length : float;
   begin
      for X in 1..36 loop
         for Y in 1..79 loop
            Length := sqrt((Float(GetHeroX(hero)-x)*Float(GetHeroX(hero)-x))+(Float(GetHeroY(hero)-y)*Float(GetHeroY(hero)-y)));
            if Length <= 7.0 then
               
               Put(Map(X,Y));
            else
               
               Put(" ");
            end if;
            
         end loop;
         New_Line;
      end loop;
   end Print_Map;
   ---------------------------------------------
   
   --Move character on map
   procedure Move (Direction : in character;Map : in out map_array; Hero : in out HeroClass; ET : in out EnemyTree; List : in out LL_type) is
      Enemy : EnemyClass;
      run : integer := 0;
      Check : integer;
      
   begin
      --Move character North
      if( direction = 'w') then
         --if hero moves into wall
         if(Map((getherox(hero)-1),getheroy(hero)) = '-' or Map((getherox(hero)-1),getheroy(hero)) = '|') then
            put_line("You Hit a Wall!");
         else
            --If hero moves onto enemy
            if (Map((getherox(hero)-1),getheroy(hero)) = 'E') then
               Enemy := Search(ET,getherox(hero)-1,getheroy(hero));
               Combat(hero,Enemy,ET,run);
            end if;
            --If hero moves onto key
            if (Map((getherox(hero)-1),getheroy(hero)) = 'K') then
               check := CheckCurrent(list,(getherox(hero)-1),getheroy(hero));
               if check = 1 then
                  map(getherox(hero),getheroy(hero)) := ' ';
                  map(getherox(hero)-1,getheroy(hero)) := 'x';
                  SetHeroCoord(getherox(hero)-1,getheroy(hero),hero);
                  run := 1;
                  Next_key(list);
               elsif check /= 1 then
                  run := 1;
               end if;
               
            end if;
            
            if run = 0  then
               map(getherox(hero),getheroy(hero)) := ' ';
               map(getherox(hero)-1,getheroy(hero)) := 'x';
               SetHeroCoord(getherox(hero)-1,getheroy(hero),hero);
            end if;
            
         end if;
      
      --Move character west   
      elsif(direction = 'a') then
         --if hero moves into wall
         if(Map((getherox(hero)),getheroy(hero)-1) = '-' or Map((getherox(hero)),getheroy(hero)-1) = '|') then
            put_line("You Hit a Wall!");
         else
            --if hero moves onto enemy
            if (Map((getherox(hero)),getheroy(hero)-1) = 'E') then
               Enemy := Search(ET,getherox(hero),getheroy(hero)-1);
               Combat(hero,Enemy,ET,run);
            end if;
            --if hero movies onto key
            if (Map((getherox(hero)),getheroy(hero)-1) = 'K') then
               if (CheckCurrent(list,getherox(hero),(getheroy(hero)-1))) = 1 then
                  map(getherox(hero),getheroy(hero)) := ' ';
                  map(getherox(hero),getheroy(hero)-1) := 'x';
                  SetHeroCoord(getherox(hero),getheroy(hero)-1,hero);
                  run := 1;
                  Next_key(list);
               else
                  run := 1;
               end if;
               
            end if;
            
            if run = 0  then
               map(getherox(hero),getheroy(hero)) := ' ';
               map(getherox(hero),getheroy(hero)-1) := 'x';
               SetHeroCoord(getherox(hero),getheroy(hero)-1,hero);
           end if;
           
         end if;
         
       --Move character South        
      elsif(direction = 's') then
         --if hero moves onto wall
         if(Map((getherox(hero)+1),getheroy(hero)) = '-' or Map((getherox(hero)+1),getheroy(hero)) = '|') then
            put_line("You Hit a Wall!");
         else
            --if hero moves onto enemy
            if (Map((getherox(hero)+1),getheroy(hero)) = 'E') then
               Enemy := Search(ET,getherox(hero)+1,getheroy(hero));
               combat(hero,enemy,ET,run);
            end if;
            --if hero movies onto key
            if (Map((getherox(hero)+1),getheroy(hero)) = 'K') then
               if (CheckCurrent(list,(getherox(hero)+1),getheroy(hero))) = 1 then
                  map(getherox(hero),getheroy(hero)) := ' ';
                  map(getherox(hero)+1,getheroy(hero)) := 'x';
                  SetHeroCoord(getherox(hero)+1,getheroy(hero),hero);
                  run := 1;
                  Next_key(list);
               else
                  run := 1;
               end if;
               
            end if;

            if run = 0  then
               map(getherox(hero),getheroy(hero)) := ' ';
               map(getherox(hero)+1,getheroy(hero)) := 'x';
               SetHeroCoord(getherox(hero)+1,getheroy(hero),hero);
            end if;
            
         end if;
      
      --Move character East   
      elsif(direction = 'd') then
         --if hero moves into wall
         if(Map((getherox(hero)),getheroy(hero)+1) = '-' or Map((getherox(hero)),getheroy(hero)+1) = '|') then
            put_line("You Hit a Wall!");
         else
            --if hero moves onto enemy
            if (Map((getherox(hero)),getheroy(hero)+1) = 'E') then
               enemy := Search(ET,getherox(hero),getheroy(hero)+1);
               combat(hero,enemy,ET,run);
            end if;
            --if hero movies onto key
            if (Map((getherox(hero)),getheroy(hero)+1) = 'K') then
               if (CheckCurrent(list,getherox(hero),(getheroy(hero)+1))) = 1 then
                  map(getherox(hero),getheroy(hero)) := ' ';
                  map(getherox(hero),getheroy(hero)+1) := 'x';
                  SetHeroCoord(getherox(hero),getheroy(hero)+1,hero);
                  run := 1;
                  Next_key(list);
               else
                  run := 1;
               end if;
               
            end if;
            
            if run = 0  then
               map(getherox(hero),getheroy(hero)) := ' ';
               map(getherox(hero),getheroy(hero)+1) := 'x';
               SetHeroCoord(getherox(hero),getheroy(hero)+1,hero);
            end if;
            
         end if;
         
      end if;
     
   end move;
   ----------------------------------------------------------------------------------------------------------
   
   ----------------------------------------------------------------------------------------------------------
   ----------------------------------------------------------------------------------------------------------
   ----------------------------------------------------------------------------------------------------------
   ----------------------------------------------------------------------------------------------------------
   --Proceudres form the screen package provided to us
   package Int_IO is new Integer_IO (Num => Integer);

  PROCEDURE Beep IS
  BEGIN
    Ada.Text_IO.Put (Item => Ada.Characters.Latin_1.BEL);
    Ada.Text_IO.Flush;
  END Beep;

  PROCEDURE ClearScreen IS
  BEGIN
    Ada.Text_IO.Put (Item => Ada.Characters.Latin_1.ESC);
    Ada.Text_IO.Put (Item => "[2J");
    Ada.Text_IO.Flush;
  END ClearScreen;

  PROCEDURE MoveCursor (Column : Width; Row : Depth) IS
  BEGIN
    Ada.Text_IO.Flush;
    Ada.Text_IO.Put (Item => Ada.Characters.Latin_1.ESC);
    Ada.Text_IO.Put ("[");
    Ada.Integer_Text_IO.Put (Item => Row, Width => 1);
    Ada.Text_IO.Put (Item => ';');
    Ada.Integer_Text_IO.Put (Item => Column, Width => 1);
    Ada.Text_IO.Put (Item => 'f');
  END MoveCursor;
  procedure Set_Fore( Fore : Colors) is
     begin
        Ada.Text_IO.Put (Item => ASCII.ESC);
        Ada.Text_IO.Put ("[");
        case Fore is
           when Black   => Put("30m");
           when Red     => Put("31m");
           when Green   => Put("32m");
           when Yellow  => Put("33m");
           when Blue    => Put("34m");
           when Magenta => Put("35m");
           when Cyan    => Put("36m");
           when White   => Put("37m");
           --when Same    => null;
        end case;
     end Set_Fore;
  procedure Pause  is
    Instring : String (1..1);
    Length : Integer;
  begin

    Movecursor (Row =>23, Column => 15);
    Put (Item => "Press return to continue ");
    Get_line (Item => Instring, Last => length);

  end Pause;

  procedure Pause(Row :   in Depth;
                  Column: in Width;
                  Msg :   in String)  is
    Instring : String (1..1);
    Length : Integer;
  begin

    Movecursor (Row =>Row, Column => Column);
    Put (Item => Msg);
    Get_line (Item => Instring, Last => length);

  end Pause;
   procedure Set_Back( Back : Colors) is
     begin
        Put (Item => ASCII.ESC);
        Put ("[");
        case Back is
           when Black   => Put("40m");
           when Red     => Put("41m");
           when Green   => Put("42m");
           when Yellow  => Put("43m");
           when Blue    => Put("44m");
           when Magenta => Put("45m");
           when Cyan    => Put("46m");
           when White   => Put("47m");
           --when Same    => null;
        end case;
     end Set_Back;

  procedure Set_Default is
     begin
        Put (Item => ASCII.ESC);
        Put ("[0m");
     end Set_Default;
end Screen;

