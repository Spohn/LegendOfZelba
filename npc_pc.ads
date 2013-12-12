package NPC_PC is

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- Hero and enemy stats package 
   -------------------------------

   type HeroClass is private;
   Type EnemyClass is private;
   
   --Set hero x,y coordinates
   procedure SetHeroCoord( X: in integer; Y: in integer; Hero : in out HeroClass);
   --set hero health
   procedure SetHeroHealth( H : in integer; Hero : in out HeroClass);
   --set hero armor
   procedure SetHeroArmor( A : in integer; Hero : in out HeroClass);
   --set hero strength
   procedure SetHeroStrength( S : in integer; Hero : in out HeroClass);
   
   --get hero X coordinate
   function GetHeroX(Hero : in HeroClass) return integer;
   --get hero Y coordinate
   function GetHeroY(Hero : in HeroClass) return integer;
   --get hero health
   function GetHeroH(Hero : in HeroClass) return integer;
   --get hero armor
   function GetHeroA(Hero : in HeroClass) return integer;
   --get hero strength
   function GetHeroS(Hero : in HeroClass) return integer;
   
   --Set enemy x,y coordinates
   procedure SetEnemyCoord( X: in integer; Y: in integer; Enemy : in out EnemyClass);
   --set enemy health
   procedure SetEnemyHealth( H : in integer; Enemy : in out EnemyClass);
   --set enemy armor
   procedure SetEnemyArmor( A : in integer; Enemy : in out EnemyClass);
   --set enemy strength
   procedure SetEnemyStrength( S : in integer; Enemy : in out EnemyClass);
   
   --get enemy X coordinate
   function GetEnemyX(Enemy : in EnemyClass) return integer;
   --get enemy Y coordinate
   function GetEnemyY(Enemy : in EnemyClass) return integer;
   --get enemy health
   function GetEnemyH(Enemy : in EnemyClass) return integer;
   --get enemy armor
   function GetEnemyA(Enemy : in EnemyClass) return integer;
   --get enemy strength
   function GetEnemyS(Enemy : in EnemyClass) return integer;
   
   --view hero stats
   procedure viewstats(Hero: in HeroClass);
   
   private
      
      type HeroClass is record
         HeroX : integer;
         HeroY : integer;
         Health : integer := 100;
         Armor : integer := 10;
         Strength : integer := 10;
      end record;
      
      type EnemyClass is record
         EnemyX: integer;
         EnemyY: integer;
         Health : integer := 100;
         Armor : integer := 0;
         Strength : integer := 0;
      end record;

end NPC_PC;
