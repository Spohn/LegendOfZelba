with NPC_PC; use NPC_PC;
with ada.text_io; use ada.text_io;
with ada.integer_text_io; use ada.integer_text_io;
with ada.integer_text_io;use ada.integer_text_io;
with w_gen; use w_gen;
with Ada.Numerics.Discrete_Random;
with enemy_bst; use enemy_bst;

package body combat_package is

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- Combat Package
   -------------------------------

   Procedure Combat(Hero : in out HeroClass; Enemy : in out EnemyClass; ET : in out EnemyTree; Run : in out integer) is
      answer : character:='a'; --character input to attack
      difference : integer;
      --Random roll
      subtype roll is integer range 0..10;
      package random_roll is new ada.numerics.discrete_random(roll);
      use random_roll;
      your_roll:integer:=0; --Hero roll
      enemy_roll:roll:=0;   --Enemy roll
      run_roll:roll:=0;     --Roll to determine if you can run or not
      g:generator;          --Random number generator
      file:file_type;       --File variable variable
   begin
      
      SetEnemyArmor(GetHeroH(Hero) / 3, Enemy);
      SetEnemyStrength(getheroS(hero) / 2, Enemy);
      
      --Display Monster Screen
      w_gen.clr_scr;
      open(file,in_file,"Monster.txt");
      draw_enemy(file);
      close(file);
      
      --Display starting health
      put("HERO HEALTH: ");
      put(GetHeroH(hero),0);
      put("   ");
      put("ENEMY HEALTH: ");
      put(GetEnemyH(enemy),0);
      new_line;

      --Loop while neither character is dead   
      while (GetHeroH(hero) > 0 and GetEnemyH(enemy) > 0) loop
      put_line("Would you like to:");
         put_line("(a)ttack");
         put_line("(r)un");
         put(": ");
         get(answer);
         new_line;
      if (answer = 'a') then
      reset(g);
      your_roll:=random(g)+1;
      enemy_roll:=random(g);
      
      --Enemy won roll
      if (enemy_roll>your_roll) then
         setherohealth(enemy_roll,hero);
      --Hero won roll
      elsif(enemy_roll<your_roll) then
         setenemyhealth(your_roll,enemy);
      end if;
      
      --Display combat menu
      put_line("------------------------------------------");
      put_line("---------------!!!COMBAT!!!---------------");
      put_line("------------------------------------------");
      put_line("-----HEALTH---------------------ROLLS-----");
      put_line("--            ---------------           --");
      put("-- HERO: ");
      put(GetHeroH(hero),0);
      if((getheroh(hero)<100)and(getheroh(hero)>=10)) then
      put("   --------------- HERO: ");
      elsif((getheroh(hero)>=100)) then
      put("  --------------- HERO: ");
      else
      put("    -------------- HERO: ");
      end if;
      put(your_roll,0);
      if(your_roll<10) then
         put_line("   --");
      else
         put_line("  --");
      end if;
      put_line("--            ---------------           --");
      put_line("--            ---------------           --");
      put("-- ENEMY: ");
      put(getenemyh(enemy),0);
      if((getenemyh(enemy)<100)and(getenemyh(enemy)>=10) )then
      put("  --------------- ENEMY: ");
      elsif((getenemyh(enemy)>=100)) then
      put(" --------------- ENEMY: ");
      else
      put("   --------------- ENEMY: ");
      end if;
      put(enemy_roll,0);
      if(enemy_roll<10) then
         put_line("  --");
      else
         put_line(" --");
      end if;
      put_line("--            ---------------           --");
      put_line("------------------------------------------");
      if (enemy_roll>your_roll) then
         put_line("------------  ENEMY WON ROLL  ------------");
         put_line("------------------------------------------");
      elsif(enemy_roll<your_roll) then
         put_line("------------   HERO WON ROLL  ------------");
         put_line("------------------------------------------");
      else
         put_line("------- ROLLS TIED: NO-ONE DAMAGED -------");
         put_line("------------------------------------------");
      end if;
      
      --Run if hero can roll an even number
      elsif(answer = 'r') then
         reset(g);
         run_roll:=random(g);
         if run_roll rem 2 >0 then
            put("You could not run!!");
            new_line;
         else
            put_line("You ran away successfully!!!");
            put("Enter any key to continue... ");
            run := 1;
            get(answer);
            exit;
         end if;
      end if;
               
      end loop;
      
      --Hero wins combat
      if(GetEnemyH(Enemy) <= 0) then
         Delete(ET,Enemy);
         put_line("You win! You feel a bit stronger!");
         difference := (100 - GetHeroH(hero)) * (-1);
         SetHeroHealth(difference,hero);
         SetHeroArmor(3,hero);
         SetHeroStrength(4,hero);
         put("Enter any key to continue: ");
         get(answer);
         
      --Enemy wins combat
      elsif (getheroh(hero) <= 0) then
         put_line("You Have been SLAIN!!!");
         put_line("Thank you for playing The Legend of Zelba");
         put("Enter any key to quit: ");
         get(answer);
      end if;
      
--      end if;
   end Combat;
   
   --Draw Monster Screen
   procedure draw_enemy(file:in file_type) is
   char:character;
   begin
   while not end_of_file(file) loop
      while not end_of_line(file) loop
         get(file, char);
         put(char);
      end loop;
      if not End_Of_File (file) then
            Skip_Line (file);
            new_line;
      end if;
   end loop;
   new_line;
   end draw_enemy;

end combat_package;