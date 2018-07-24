Strict Antecedent Basis: Sets and Iteration
==========

Working with sets of objects and iterating through a set of objects.

## Sets

__**Attention**__: courts may construe a "set" of objects as two or more objects. Construing sets to mean two or more is a ridiculous interpretation because one skilled in the art of software knows that a set can comprise zero or more objects. One solution is to include the following in the specification:

> A "set" may comprise zero, one, or two or more elements.

## First rule

The first rule of sets is—__*do not use sets*__! Sets often create confusion. Do not use a set unless a set is required.

In many cases, you can use one or two objects rather than a set. Referencing multiple references for multiple objects is usually clearer and broader than using sets. The following is an example:

``` claim
doing a first thing with a first object;
doing the first thing with a second object;
```

## Second rule

The second rule of sets: If using a set is required, then each thing in the set should have the same common properties or be part of the same steps
Sets should be sets of common objects.

Each object in a set should have common properties or be part of the same steps. Do not create ambiguity by using clumsy language like, "ones of a set"—*ew*.

To refer to a subset of a set, instantiate a new noun phrase for the subset.  Although a subset can include all objects in a set, courts are usually made up of technically ignorant judges. So, use the `one or more` keyword phrase to instantiate a noun phrase to represent a subset of some or all of the objects in a set. The following is an example of using a set and a subset:

``` claim
receiving a set of things;
determining one or more first things of the set of things has a first property;
determining one or more second things of the set of things has a second property;
for each thing in the one or more first things, doing a first action;
for each thing in the one or more second things, doing a second action;
```

### Banned: "respectively"

A claim that uses a set often uses "respectively" haphazardly, and often incorrectly. If two sets are needed, and each object in a first set is related to a corresponding object in a second set, then consider doing the following:

``` claims
A method comprising:
  ... a first set of objects;
  ... a second set of objects;
  wherein each object in the first set of objects has a corresponding object in the second set of objects;
  ...
  selecting a particular object from the first set of objects;
  ...
  performing a step with the particular object and the corresponding object.
```
 

## Iteration

Iterating over a set leads to tricky claim language. When iterating over a set is required, perform the iteration with an iterative block. The following is an example of an iterative block that performs two actions on each object in a set:

``` claim
for each thing among a plurality of things:
  doing a first action with the thing;
  doing a second action with the thing;
```

In this example, the claim is iterating over a set—the plurality of things— and doing a first action and a second action with the thing from the plurality of things in the current iteration.

An iterative block may be a single line. For example, the following is an example of an iterative block that is a single line. The scope, which is discussed further herein, is just the single line.

``` claim
for each thing among a plurality of things, doing an action with the thing; 
```

### Scope

The keyword phrase `each`, unlike any of the other keyword phrases that instantiate a noun phrase, instantiates a noun phrase for an object only within the scope of the iterative block.  The following is an example that violates this rule.

``` claim
for each thing among a plurality of things:
  doing a first action with the thing; and
  doing a second action with the thing;
creating a particular widget;
doing a third action with the thing and the particular widget;
```

As seen in the example above, the reference to the thing in the last line is nonsensical, because the reference to the thing in the last line is outside the scope of the iterative block.

### Multiple iterative blocks

...

### Nested blocks

...