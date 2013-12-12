with ada.text_io; use ada.text_io;
with screen; use screen;
with NPC_PC; use NPC_PC;
with enemy_bst; use enemy_bst;
with intro; use intro;
with w_gen; use w_gen;
with list_lib; use list_lib;

procedure adventure is

-----------------------------------------------
-- Name: Jon Spohn
--       David Rogina
-- Date: 4/20/07
-- The Legend of Zelba: Wink's Awakening
-- Hello, This is our final game project.
-- It is titled after The Legend of Zelda: Link's Awakening.
-- This program makes use of a few advanced data structures such
-- as a Linked List and a Binary Search Tree to hold the games
-- objectives. The object of the game is to go through the dungeon
-- kill all the monsters and collect all the keys (which have to be done
-- in a specific order). Once these objectives are done you will get the
-- Thank you screen and the credits. Directions on how to play are provided
-- in a welcome start up screen.
-- NOTE: The provided w_gen package and screen package are included.
--       However only one procedure was used from the to help clear the
--       Screen, but the procedures are still included. Same as the BST
--       packages were modified to be used in this game and some procedures
--       are left in them that are not used in the program.
-----------------------------------------------


map:map_array;   --map of dungeon
file:file_type;   --file input variable
choice : character := 'o';   --character to advance pause screen
Hero : HeroClass;   --hero record
ET : EnemyTree;   --enemy record
List : LL_Type; --Key List

begin --game

   --Opening Title Screen
   open(file,in_file,"Zelba.txt");
   title_page(file);
   close(file);
   w_gen.clr_scr;
   
   --Welcome Screen/Story/Instructions
   open(file,in_file,"Welcome.txt");
   title_page(file);
   close(file);
   w_gen.clr_scr;

   --Create enemies and create map array
   InitLL(List);
   Initialize(ET);
   open(file,in_file,"Map.txt");
   map_input(file,map,Hero,et,List);
   print_map(map,hero);
   new_line(spacing=>5);

   --Play game while hero health > 0 and 
   while((choice /= 'g' and (GetHeroH(Hero) > 0)) and (isNull(et) /= 0 or noKey(list) /= 0)) loop
      --menu
      put_line("*************");
      put_line("(v)iew stats");
      put_line("(w) move north");
      put_line("(s) move south");
      put_line("(a) move west");
      put_line("(d) move east");
      put_line("(g)ive up like a scared little girl.");
      put_line("*************");
      put("Choice: ");
      get(choice);
      
      --move character on map
      if (choice = 'w' or choice = 'a' or choice = 's' or choice = 'd') then
         Move(choice,map,Hero,et,list);
      --view character stats   
      elsif choice = 'v' then
         Viewstats(Hero);
      end if;
      
      --clear and redraw screen with updated info
      w_gen.clr_scr;
      print_map(map,hero);
      new_line(spacing=>5);
   end loop;
   
   w_gen.clr_scr;
   close(file);
   if isNull(et) = 0 then
      open(file,in_file,"Win.txt");
      title_page(file);
      close(file);
   end if;

end adventure;