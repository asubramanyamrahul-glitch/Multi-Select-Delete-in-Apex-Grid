# Oracle APEX Interactive Grid - Multi Select Delete

This project shows how to add **multi-select** and **delete selected rows** functionality in an **Oracle APEX Interactive Grid**.

The main idea is to let users select multiple records from the grid and delete them in one action using a button. To make this work, a selector column is added to the grid, the selected `AUTHOR_ID` values are stored in a page item, and a delete process removes the matching records from both child and parent tables.

## What this project covers

- Adding a selector column in an Interactive Grid
- Selecting multiple rows at the same time
- Collecting selected `AUTHOR_ID` values
- Storing selected IDs in a page item as a colon-separated string
- Creating a **Delete Selected** button
- Running a process to delete related child records first
- Deleting parent records after child records are removed
- Handling errors properly
- Showing a success message after deletion

## How it works

### 1. Selector column in Interactive Grid
A selector column is added to the Interactive Grid so users can choose one or more rows.

### 2. Store selected row IDs
When rows are selected, a dynamic action captures the selected `AUTHOR_ID` values and stores them in a page item.  
The IDs are saved in this format:

`101:102:103`

This makes it easy to pass multiple values into the delete process.

### 3. Delete Selected button
A button is added on the page for deleting the selected records.

When the user clicks this button:

- The selected IDs are read from the page item
- The related rows in child tables are deleted first
- Then the matching rows in the parent table are deleted
- If something goes wrong, the error is handled
- If the delete is successful, a success message is shown

## Why child records are deleted first

If the parent table has related records in child tables, Oracle will not allow the parent row to be deleted first when foreign key rules exist.

So the correct order is:

1. Delete child records  
2. Delete parent records  

This helps avoid constraint errors.

## Main components used

- **Oracle APEX Interactive Grid**
- **Selector column**
- **Dynamic Action**
- **Page Item**
- **Delete button**
- **PL/SQL process**
- **Success and error handling**

## Use case

This setup is useful when users need to delete many records in one go instead of deleting them one by one. It improves user experience and makes record management faster.

## Basic flow

1. Open the Interactive Grid  
2. Select one or more rows  
3. Selected `AUTHOR_ID` values are stored in a page item  
4. Click **Delete Selected**  
5. Child records are deleted  
6. Parent records are deleted  
7. A success message is shown  


## Result

With this implementation, users can select multiple rows in an Oracle APEX Interactive Grid and delete them safely in one action.

This approach is simple, practical, and useful for applications where bulk delete is required.

## [Please refer the documentation for full understanding](https://github.com/asubramanyamrahul-glitch/Multi-Select-Delete-in-Apex-Grid/tree/main/Multi%20Select%20and%20Delete/Document)


