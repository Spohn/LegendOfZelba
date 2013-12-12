with NPC_PC; use NPC_PC;
with ada.text_io;
use ada.text_io;
with enemy_BST; use enemy_bst;

package Combat_package is

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- Combat Package Specification
   -------------------------------

   --Combat procedure
   Procedure Combat(Hero : in out HeroClass; Enemy : in out EnemyClass;ET : in out EnemyTree; Run : in out integer);
   --Draw Monster picture
   procedure draw_enemy(file:in file_type);

end Combat_package;