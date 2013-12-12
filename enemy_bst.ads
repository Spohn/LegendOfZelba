with NPC_PC; use NPC_PC;

package Enemy_BST is

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- Enemy Package Specification
   -------------------------------

   type EnemyTree is private;
   
   --Connect enemy node to right of parent
   procedure ConnectRight (T : IN OUT EnemyTree; E : EnemyClass);
   --Connect enemy node to left of parent
   procedure ConnectLeft (T : IN OUT EnemyTree; E : EnemyClass);
   --Make Enemy
   function MakeNode (E : EnemyClass) RETURN EnemyTree;
   --Initialize enemy tree
   procedure Initialize (T: IN OUT EnemyTree);
   --Insert enemy node into tree
   procedure Insert (T : IN OUT EnemyTree; E : EnemyClass);
   --Search enemy tree for specific enemy coordinates
   FUNCTION Search (T: EnemyTree; X : integer; Y: integer) RETURN EnemyClass;
   
   function GetLeft(ET: EnemyTree) Return EnemyTree;
   function GetRight(ET : EnemyTree) return EnemyTree;
   function GetEnemy(ET : EnemyTree) return EnemyClass;
   
   function IsNull(ET : EnemyTree) return integer;
  
   --Find smallest leaf of parent node
   FUNCTION FindSmallest (T : EnemyTree) RETURN EnemyTree;
   --Delete enemy node
   PROCEDURE Delete (T : IN OUT EnemyTree; K : IN EnemyClass);
   

   private
      
      TYPE BinaryTreeNode;
      TYPE EnemyTree IS ACCESS BinaryTreeNode;
      TYPE BinaryTreeNode IS RECORD
        Enemy : EnemyClass;
        Left  : EnemyTree := NULL;
        Right : EnemyTree := NULL;
      END RECORD;


end Enemy_BST;
