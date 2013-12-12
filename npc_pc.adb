with ada.integer_text_io; use ada.integer_text_io;
with ada.text_io; use ada.text_io;
package body NPC_PC is

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- Hero and Enemy stats Package
   -------------------------------

   --------------------------------------
   --Procedures and functions to set and 
   --get Hero's stats
   --------------------------------------
   --Set X,Y coordinates of Hero
   procedure SetHeroCoord( X: in integer; Y: in integer; Hero : in out HeroClass) is
   begin      
      Hero.HeroX := X;
      Hero.HeroY := y;
   end SetHeroCoord;
   ----------------------------------------------------------------------
   --Set Health of Hero
   procedure SetHeroHealth( H : in integer; Hero : in out HeroClass) is
   begin
      Hero.Health := Hero.Health - H;
   end SetHeroHealth;
   ----------------------------------------------------------------------
   --Set Armor of Hero
   procedure SetHeroArmor( A : in integer; Hero : in out HeroClass) is
   begin
      Hero.Armor := Hero.Armor + A;
   end SetHeroArmor;
   ----------------------------------------------------------------------
   --Set strength of hero
   procedure SetHeroStrength( S : in integer; Hero : in out HeroClass) is
   begin
      Hero.Strength := Hero.Strength + S;
   end SetHeroStrength;
   
   ----------------------------------------------------------------------
   
   --Get X coordinate of Hero
   function GetHeroX(Hero : in HeroClass) return integer is
   begin
      return Hero.HeroX;
   end GetHeroX;
   ----------------------------------------------------------------------
   --Get Y coordinate of Hero
   function GetHeroY(Hero : in HeroClass) return integer is
   begin
      return Hero.HeroY;
   end GetHeroY;
   ----------------------------------------------------------------------
   --Get the health of the Hero
   function GetHeroH(Hero : in HeroClass) return integer is
   begin
      return Hero.Health;
   end GetHeroH;
   ----------------------------------------------------------------------
   --Get armor for Hero
   function GetHeroA(Hero : in HeroClass) return integer is
   begin
      return Hero.Armor;
   end GetHeroA;
   ----------------------------------------------------------------------
   --Get strength of Hero
   function GetHeroS(Hero : in HeroClass) return integer is
   begin
      return Hero.Strength;
   end GetHeroS;
   ----------------------------------------------------------------------
   ----------------------------------------------------------------------
   ----------------------------------------------------------------------
   --------------------------------------
   --Procedures and functions to set and 
   --get Enemy's stats
   --------------------------------------
   
   --Set Enemy's coordinates on map
   procedure SetEnemyCoord( X: in integer; Y: in integer; Enemy : in out EnemyClass) is
   begin      
      Enemy.EnemyX := X;
      Enemy.EnemyY := y;
   end SetEnemyCoord;
   ----------------------------------------------------------------------   
   --Set Enemy's health
   procedure SetEnemyHealth( H : in integer; Enemy : in out EnemyClass) is
   begin
      Enemy.Health := Enemy.Health - H;
   end SetEnemyHealth;
   ----------------------------------------------------------------------   
   --Set Enemy's armor
   procedure SetEnemyArmor( A : in integer; Enemy : in out EnemyClass) is
   begin
      Enemy.Armor := Enemy.Armor + A;
   end SetEnemyArmor;
   ----------------------------------------------------------------------   
   --Set Enemy's Strength
   procedure SetEnemyStrength( S : in integer; Enemy : in out EnemyClass) is
   begin
      Enemy.Strength := Enemy.Strength + S;
   end SetEnemyStrength;
   ----------------------------------------------------------------------   
   --Get Enemy's X coordinate
   function GetEnemyX(Enemy : in EnemyClass) return integer is
   begin
      return Enemy.EnemyX;
   end GetEnemyX;
   ----------------------------------------------------------------------
   --Get Enemy's Y coordinate
   function GetEnemyY(Enemy : in EnemyClass) return integer is
   begin
      return Enemy.EnemyY;
   end GetEnemyY;
   ----------------------------------------------------------------------
   --Get Enemy's Health
   function GetEnemyH(Enemy : in EnemyClass) return integer is
   begin
      return Enemy.Health;
   end GetEnemyH;
   ----------------------------------------------------------------------
   --Get Enemy's Armor
   function GetEnemyA(Enemy : in EnemyClass) return integer is
   begin
      return Enemy.Armor;
   end GetEnemyA;
   ----------------------------------------------------------------------
   --Get Enemy's Strength
   function GetEnemyS(Enemy : in EnemyClass) return integer is
   begin
      return Enemy.Strength;
   end GetEnemyS;
   ----------------------------------------------------------------------
   
   --View Stats of Hero
   procedure viewstats(Hero: in HeroClass) is
      test: character;
   begin
   
      new_line;
      put("Your Current Health is: ");
      put(item=>Hero.Health, width=> 1);
      new_line;
      put("Your Current Armor is: ");
      put(item=>Hero.Armor, width=> 1);
      new_line;
      put("Your Current Strength is: ");
      put(item=>Hero.Strength, width=> 1);
      new_line;
      put("Enter in any key to continue");
      get(test);
   
   end viewstats;
   
end NPC_PC;
