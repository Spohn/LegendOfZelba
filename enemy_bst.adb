with NPC_PC; use NPC_PC;

package body Enemy_BST is

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- Enemy Package
   -------------------------------

  --Make Enemy
  FUNCTION MakeNode (E : EnemyClass) RETURN EnemyTree IS
    Result : EnemyTree;
  BEGIN
    Result := NEW BinaryTreeNode;
    Result.Enemy := E;
    RETURN Result;
  END MakeNode;
  ---------------------------------------------------------------------------------
  --Connect Enemy node to left of tree
  PROCEDURE ConnectLeft (T : IN OUT EnemyTree; E : EnemyClass) IS
  BEGIN
    T.Left := MakeNode (E);
  END ConnectLeft;
  --------------------------------------------------------------------------------
  --Connect Enemy node to right of tree
  PROCEDURE ConnectRight (T : IN OUT EnemyTree; E : EnemyClass) IS
  BEGIN
    T.Right := MakeNode (E);
  END ConnectRight;
  ----------------------------------------------------------------------------------
  PROCEDURE Initialize (T: IN OUT EnemyTree) IS
  BEGIN
    T := NULL;
  END Initialize;
  
  ------------------------------------------------------------------------------------
  
  --Insert Enemy Node into Tree
  PROCEDURE Insert (T : IN OUT EnemyTree; E : IN  EnemyClass) IS
  BEGIN

    IF T = NULL THEN
      T := MakeNode (E);
    ELSIF (GetEnemyY(E)) < (GetEnemyY(T.Enemy)) THEN
      IF T.Left = NULL THEN
        ConnectLeft (T, E);
      ELSE
        Insert (T.Left, E);
      END IF;
    ELSIF (GetEnemyY(E)) > (GetEnemyY(T.Enemy)) THEN
      IF T.Right = NULL THEN
        ConnectRight (T, E);
      ELSE
        Insert (T.Right, E);
      END IF;
    ELSE
      Insert(T.Right , E);
   END IF;

   END Insert;
   ----------------------------------------------------------------------------------------
   --Search through tree for enemy node with specific map coordinates
   FUNCTION Search (T: EnemyTree; X : integer; Y: integer) RETURN EnemyClass IS
   BEGIN

     IF Y < GetEnemyY(T.Enemy) THEN   
       RETURN Search(T.Left,X,Y);
     ELSIF GetEnemyY(T.enemy) < Y THEN    
       RETURN Search(T.Right,X,Y);
     ELSE
       if x = GetEnemyX(T.enemy)  then           
          RETURN T.Enemy;
       else
          Return Search(T.Right,X,Y);
       end if;
     END IF;

   END Search;
   -----------------------------------------------------------------------------------------
   function GetLeft(ET: EnemyTree) Return EnemyTree is
   begin
      return ET.Left;
   end GetLeft;
   -----------------------------------------------------------------------------------------
   function GetRight(ET : EnemyTree) return EnemyTree is
   begin
      return ET.Right;
   end GetRight;
   -----------------------------------------------------------------------------------------
   function GetEnemy(ET : EnemyTree) return EnemyClass is
   begin
      return ET.Enemy;
   end GetEnemy;
   --------------------------------------------------------------------------------------------
   --Determine if all enemies are killed or not, if so game ends
   function IsNull(ET : EnemyTree) return integer is
   begin
      if (ET = NULL) then
         return 0;
      else
         return 1;
      end if;
   end IsNull;
   ---------------------------------------------------------------------------------------
   --Find the smallest leaf of a parent node
   FUNCTION FindSmallest (T : EnemyTree) RETURN EnemyTree IS
   BEGIN -- FindSmallest

   IF T = NULL THEN
     RETURN NULL;
   ELSIF T.Left = NULL THEN
     RETURN T;
   ELSE
     RETURN FindSmallest(T.Left);
   END IF;

   END FindSmallest;
   -------------------------------------------------------------------------------------
   --Delete an enemy node from the tree
   PROCEDURE Delete (T : IN OUT EnemyTree; K : IN EnemyClass) IS
     Temp: EnemyTree;
  BEGIN -- Delete

  IF GetEnemyY(K) < GetEnemyY(T.Enemy) THEN              -- check left subtree
    Delete (T.Left, K);
  ELSIF GetEnemyY(T.Enemy) < GetEnemyY(K) THEN           -- check right subtree
    Delete (T.Right, K);          
  ELSE   
    if GetEnemyX(K) = GetEnemyX(T.enemy)  then           
          IF T.Left = NULL AND T.Right = NULL THEN
             T := NULL;                  -- T is a leaf; delete it
          ELSIF T.Right = NULL THEN     -- replace T by its predecessor
             T:= T.Left;
          ELSIF T.Left = NULL THEN      -- replace T by its successor
             T := T.Right;
          else
             Temp := FindSmallest(T.Right);
             T.Enemy := Temp.Enemy;
             Delete(T.Right, (T.Enemy));                        
          END IF;
    else
         Delete(T.Right,K);
    end if; 

  END IF;

   END Delete;
   ----------------------------------------------------------------------------------------

end Enemy_BST;
