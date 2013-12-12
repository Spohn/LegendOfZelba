with ada.text_io;
use ada.text_io;

package body intro is

   -------------------------------
   -- Name: Jon Spohn
   --       David Rogina
   -- Game Intro Package
   -------------------------------

--Read in and display title page
procedure title_page(file:in file_type) is
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
   new_line(2);
   put("Type any character to continue... ");
   get(char);
end title_page;

end intro;
      
