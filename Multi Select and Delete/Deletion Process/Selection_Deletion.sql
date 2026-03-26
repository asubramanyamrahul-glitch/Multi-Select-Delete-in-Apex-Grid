declare
   v_deleted_books   number := 0;
   v_deleted_authors number := 0;
begin
   for r in (
      select to_number(column_value) as author_id
        from table ( apex_string.split(
         rtrim(
            :p4_array_selection,
            ':'
         ),
         ':'
      ) )
   ) loop

        -- Delete child records first
      delete from books
       where author_id = r.author_id;

      v_deleted_books := v_deleted_books + sql%rowcount;

        -- Delete parent record
      delete from authors
       where author_id = r.author_id;

      if sql%rowcount = 0 then
         raise_application_error(
            -20002,
            'No matching author found for AUTHOR_ID = ' || r.author_id
         );
      end if;

      v_deleted_authors := v_deleted_authors + sql%rowcount;
   end loop;

    -- Optional: show success message in APEX UI
   apex_application.g_print_success_message := 'Deleted Authors: '
                                               || v_deleted_authors
                                               || ', Deleted Books: '
                                               || v_deleted_books;
exception
   when others then
        -- Rollback any partial changes
      rollback;
      raise_application_error(
         -20001,
         'Error deleting records: ' || sqlerrm
      );
end;