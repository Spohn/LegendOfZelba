WITH Unchecked_Deallocation;
with ada.integer_text_io; use ada.integer_text_io;
with ada.text_io; use ada.text_io;
PACKAGE BODY List_Lib IS

   --------------------------------------------------------------------------
   --| Name: Jon Spohn
   --|       David Rogina
   --| 
   --------------------------------------------------------------------------
   
   PROCEDURE Dispose IS 
      NEW Unchecked_Deallocation(Object => Node, Name => Node_Pointer);
    
   FUNCTION Allocate (Xpos: integer;
                      Ypos: integer;
                      P:    Node_Pointer) RETURN Node_Pointer IS
      Result: Node_Pointer;
   BEGIN
      Result := NEW Node'(X => Xpos,Y => Ypos,Next => P);
      RETURN Result;
   EXCEPTION
      WHEN STORAGE_ERROR =>
         RAISE OUT_OF_SPACE;
   END Allocate;
  
   PROCEDURE Deallocate (P: IN OUT Node_Pointer) IS
   BEGIN
      Dispose (X => P);
   END Deallocate;
   --------------------------------------------------------------------------
   -- Constructors
   --------------------------------------------------------------------------
   PROCEDURE InitLL (One_LL: IN OUT LL_Type) IS   
   BEGIN 
         One_LL := (Head => NULL, Tail => NULL, Current => NULL);  
   END InitLL;
   

   PROCEDURE Add(One_LL: IN OUT LL_Type; X: IN integer; Y : In integer) IS
      P: Node_Pointer;
   BEGIN
      P := Allocate(X, Y, NULL);
      IF One_LL.Head = NULL THEN
         One_LL.Head := P;
         One_LL.Tail := P;
         One_LL.Current := P;
      ELSE
         One_LL.Tail.Next := P;
      END IF;
      One_LL.Tail := P;
   END Add;
   
  
   --------------------------------------------------------------------------
   --Check is current key node is correct key
   Function CheckCurrent(L : LL_type; Xpos : integer; Ypos : Integer) Return integer is
   
   begin
      
      if (L.Current.X = Xpos and L.Current.Y = Ypos) then
         return 1;
      else
         return 0;
      end if;
   
   end CheckCurrent;
   
   ------------------------------------------------------------------------
   
   --traverse to next key in list
   PROCEDURE Next_key(L : IN OUT LL_type) is
   
   begin

      L.Current := L.Current.next;
         
   end Next_key;
   -------------------------------------------------------------------------
   
   --current = No Key
   Function NoKey(L : LL_type) return integer is
   begin
      if L.Current = NULL then
         return 0;
      else
         return 1;
      end if;
   
   end NoKey;
   
   ---------------------------------------------------------------------------
   
   --Print Key List
   procedure PrintL(L : In out LL_type) is
      position : node_pointer;
   begin
      position := L.current;
      while (position /= NULL) loop
         put(position.x);
         put(position.y);
         position := position.next;
         new_line;
      end loop;
   end PrintL;
   
END List_Lib;
