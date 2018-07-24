Strict Antecedent Basis: Noun Phrases
===========

Instantiating and referencing noun phrases.

## Noun phrases

Noun phrases are the building blocks of clear claim language. A noun phrase is a word or group of words that functions in a sentence as subject, object, or prepositional object. A noun phrase in a claim should be clearly defined so that future references to the noun phrase are easily recognized.

## Instantiation

A noun phrase should be instantiated only once in a claim using one keyword phrase among a set of instantiating keyword phrases:

- `a`,
- `an`,
- `one|two|`,
- `at least`,
- `each`.

The following are examples of instantiating a noun phrase with a keyword phrase from the set of instantiating keyword phrases:

- `a first thing`,
- `a second thing`,
- `a plurality of things`,
- `one or more things`,
- `two or more things`,
- `three or more things`,
- `at least one thing`,
- `at least two things`.

The `each` instantiating keyword phrase is a special keyword phrase that is discussed in [Sets and Iteration](/posts/sab-sets-and-iteration).

## Referencing

Use the `the` keyword phrase to reference a noun phrase exactly as instantiated. The following are examples of referencing an instantiated noun phrase:

- `the first thing`,
- `the second thing`,
- `the plurality of things`,
- `the one or more things`,
- `the two or more things`,
- `the three or more things`,
- `the at least one thing`,
- `the at least two things`.

A noun phrase should not be referenced using a modifier, such as an adjective.  For example, if a claim includes `receiving a thing`, then `the thing` should __**not**__ be referenced as `the received thing` in the claim.

## Immutable objects

A noun phrase references an object that is immutable. If the object is modified, then the object is a new object.  Accordingly, a new noun phrase should be instantiated to represent the new object.  The following is an example of assigning a new noun phrase to a modified object:

``` claim
1. A method comprising:
   receiving a first thing;
   modifying the first thing to produce a second thing.
```

Do not make a noun phrase ambiguous by referring to two objects with the same noun phrase.  The following is an example of a claim that creates an antecedent basis error by using a single noun phrase to reference two objects with different states: 

``` claim
1. A method comprising:
   receiving a thing that includes an original component;
   modifying the original component included in the thing;
   sending the thing to a client computer.
```

Some may argue that sending `the thing` clearly means sending `the thing` with a new component from a previous component included in `the claim`. However, that logic requires steps in a claim to have a rigid order, and someone could invent around the claimed invention by merely performing two or more steps in a different order. Furthermore, in a long or subsequent dependent claim, a reader may also have a hard time determining whether a reference to `the thing` is referring to `the thing` with the previous component or the new component. 

The following claim is free of antecedent basis errors by assigning a new noun phrase to a new object created by modifying an original object:

``` claim
1. A method comprising:
   receiving a first thing that includes a particular component;
   producing a second thing from the first thing by modifying the particular component;
   sending the second thing to a client computer.
``` 

### Classification distinction

Although a noun phrase represents an immutable object, a new noun phrase should not be instantiated when an object is merely further characterized, clarified, or described.  The following is an example of a noun phrase that represents an object that is further described after the noun phrase was instantiated.

``` claim
1. A method comprising:
   receiving a thing, wherein the thing has a particular component;
   sending the thing to a client computer.
```