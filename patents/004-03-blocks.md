Strict Antecedent Basis: Blocks and Scope
===========

Grouping sections of a claim.

## Blocks

A block is a group of components or steps that are related. Block that are multi-line blocks should be visually identifiable with indentation. The first line of a  multi-line block should end with a `:` and each subsequent line in the block should have a deeper indentation than the first line of the block. The second to last line should end with one of the following, whichever is more appropriate:

- `, or`,
- `; or`,
- `, and`, or
- `; and`.

The following is an example of a  multi-line block.

``` claim
for each thing among a plurality of things:
  doing a first action with the thing; and
  doing a second action with the thing;
```

A single-line block is used primarily to iterate over a set. Accordingly, single-line blocks are discussed in [Sets and Iteration](/posts/sab-sets-and-iteration). 

## Nested Blocks

A block may include one or more blocks.  The following is an example of a block that includes a nested block.

``` claim
A method comprising:
  receiving a plurality of things;
  for each thing in the plurality of things:
    doing a first action with the thing; and
    doing a second action with the thing.
```
