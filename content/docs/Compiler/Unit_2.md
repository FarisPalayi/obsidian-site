# Topics
- [ ] Syntax analysis
  - [ ] Role of parser
  - [ ] Error handling and recovery
- [ ] Parsing concepts
  - [ ] Definitions of parsing
  - [ ] Top-down parsing
  - [ ] Bottom-up parsing
- [ ] Context-free grammars
  - [ ] Derivations
  - [ ] Parse tree
  - [ ] Ambiguity
  - [ ] Associativity and precedence of operators
- [ ] Top-down parsing techniques
  - [ ] Recursive descent parsing
  - [ ] LL(1) grammars
  - [ ] Non-recursive predictive parsing
- [ ] Bottom-up parsing techniques
  - [ ] Reductions
  - [ ] Handle pruning
  - [ ] Shift-reduce parsing
  - [ ] Operator precedence parsing
  - [ ] Simple LR parsing

---

# Context-free Grammar
1. Terminals
2. Non-terminals
3. Productions: a -> b (N∪T)
4. Start symbol (A special non-terminal)

$$ G(N,T,P,S) $$

- For solving left associativity rule violation, left-recursive grammar can be used
- In the parse tree, the higher precedence derivation should take place at the lower levels. otherwise it causes precedence rule violation
- Except for Operator precedence parser, all the parsers need right recursive grammar

# Left Recursive Grammar:
$$ A -> Aα | β $$
- Left recursion gets stuck in an infinite loop in top down parsers
- Which gives an output with the pattern:
$$ A => βα* $$

# Right Recursive Grammar:
$$ A -> αA | β $$
- Output pattern:
$$ A => α*β $$

# Conversion of Left -> Right
$$ A -> Aα | β $$
This can be turned to Right recursive grammar by:
$$ A -> βA' $$
$$ A' -> αA' | ε $$

# Non-Deterministic CFG
- Has **common prefixes** in production rules
- They lead to backtracking in top-down parsers. Thus, **left factoring** is done
- Where the elements after the common prefix is factored out to a new production rule
$$ 1. A -> ab $$
$$ 2. A -> ac $$
$$ 3. A -> ad $$
- This grammar is left factored to:
$$ A -> aA' $$
$$ A' -> b | c | d $$

---

# Parser
- It is a program that generates a parse tree for a string, if the string is generated from the underlying grammar
- Parsing can be done in two ways:
    1. Top-down approach
    2. Bottom-up approach

![]()

## 1. Top-down approach
- It uses left-most derivation
- They can't handle left recursion
- Also they needs unambigous grammar
- Top-down parsers without backtracking can't handle non-determinism

## 2. Bottom-up approach
- It uses right-most derivation in **reverse** 

# Recursive Descent Parser
- uses lookahead

# Predictive Parser
## LL(1)
![]()

### FIRST()
- Given any non-terminal of a CFG, if we derive all the possible strings from it, the **first terminal(s)** is the FIRST() of the non-terminal
- it includes ε
- It's often helpful to start from the bottom of the production rule to find the FIRST() when trying to find it
### FOLLOW()
- During the process of derivation, the **terminals that could follow** the non-terminal are to be considered as FOLLOW() of the non-terminal 
- it doesn't include ε
- FOLLOW() of start symbol is $
- It has 3 cases:
	1. The **following terminal  symbol** will be selected as FOLLOW
	2. The **FIRST of the following non-terminal** will be selected as FOLLOW
	3. If it is the right most in the RHS, the follow of the LHS will be selected
#### Construction of LL(1) Parsing Table
- Terminals as columns
- Non-terminals as rows
Rules to follow:
1. All the **ε productions** are placed under follow sets
2. **Remaining productions** are placed under the firsts
- LL(1) parsing table should only have one production rule for each non-terminal corresponding to a terminal. i.e., it's LL(1) grammar. i.e., the table cells can't contain more than one rule.
- Remember, the RHS of a non-terminal will pushed on to the stack in reverse order
- Whenever the input buffer lookahead symbol and the stack item matches, move to the next lookahead symbol
- When a match in the table cell is found, the item is popped off and parse tree is being updated during that.
- The first item in the stack and the last item in the input buffer will be $


