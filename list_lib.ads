PACKAGE List_Lib IS

  
   TYPE Node_Pointer IS PRIVATE;
   TYPE LL_Type      IS PRIVATE;
   
   -- exported exceptions
   OUT_OF_SPACE: EXCEPTION;
   PAST_END:     EXCEPTION;
   PAST_BEGIN:   EXCEPTION;
   LL_UNDERFLOW: EXCEPTION;
   --------------------------------------------------------------------------
   -- constructor operations
   
   PROCEDURE InitLL (One_LL: IN OUT LL_Type);
   -- Pre: One_LL is defined
   -- Post: One_LL is empty and ready to take nodes

   --Traverse to next key in key list
   PROCEDURE Next_key(L : IN OUT LL_type);
   --compare current key with position of hero
   Function CheckCurrent(L : LL_type; Xpos : integer; Ypos : Integer) Return integer;
   PROCEDURE Add(One_LL: IN OUT LL_Type; X: IN integer; Y : In integer);
   --No more keys in list
   Function NoKey(L : LL_type) return integer;
   --Print key list
   procedure PrintL(L : In out LL_type);
   --------------------------------------------------------------------------
   -- input/output operations
   

   
   --------------------------------------------------------------------------
   PRIVATE

      TYPE Node;
      TYPE Node_Pointer IS ACCESS Node;
      TYPE Node IS RECORD
         X: Integer;
         Y: Integer;
         Next:  Node_Pointer;
      END RECORD;
      
      TYPE LL_Type IS RECORD
         Head: Node_Pointer;
         Tail: Node_Pointer;
         Current: Node_pointer;
      END RECORD;
      
END List_Lib;
