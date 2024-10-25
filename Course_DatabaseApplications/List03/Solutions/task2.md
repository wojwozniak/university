## Static cursor
- Static cursor takes a snapshot of the table. It does not reflect any changes.
- In the example static cursor prints all rows, even numbers are dropped from the table

## Keyset cursor
- Keyset captures a set of rows when cursor is opened. It is "partially sensitive" to changes.
- In our example, it is sensitive to second row being deleted. Second row is dropped and cursor cannot detect next one (there is a hole in the place of two, instead of three "becoming the next")

## Dynamic cursor
- Dynamic cursor reflects all changes made to the table, so it shows changes being made during cursor execution
- In the example dynamic cursor prints only odd numbers, even numbers are dropped from the table