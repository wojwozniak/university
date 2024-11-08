## Pessimistic Concurrency Control

We assume that conflict are common, so we block access to assets for entire 
duration of the transaction - no other transaction can affect the same data

- if we edit document, we don't let someone else also edit it

## Optimistic Concurrency Control

We assume that conflicts are rare, so we don't block access to assets. Instead
we just check for conflicts on commit, and if there are some, we force the later
transaction to be rerun with updated assets.

- if we edit document, we assume parts we do edit don't change (and if they
do we redo our edit (f.e. like in git merge conflict resolver))