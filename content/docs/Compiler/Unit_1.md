# Topics
- [ ] Introduction to Compiling
- [ ] Definition of compiler
  - [ ] Translator
  - [ ] Interpreter
  - [ ] Analysis of the source program
- [ ] Phases of a compiler
- [ ] Compiler construction tools
- [ ] Programming language basics
- [ ] Lexical analysis
  - [ ] Role of lexical analyzer
  - [ ] Input buffering
  - [ ] Specification of tokens
  - [ ] Recognition of tokens using finite automata
- [ ] Regular expressions and finite automata
  - [ ] Conversion from NFA to DFA
  - [ ] Regular expression to NFA

---

# Introduction to Compiling
- A type of translator
- Define compiler
- Give language examples: C, C++, Rust, ...
- Draw 2 diagrams: compiler pass & source program pass
- 2 parts: synthesis & analysis
- Structure of a compiler (6 phases)
    - describe each 
    - draw diagram

# Definition of compiler
- Same as above

## Translator
>> A translator is a program that converts a program written in one language into another.

- Types: 
    1. Compilers
    2. Interpreters
    3. Assemblers
    - Hybrid models such as Java's language processor exist
- Draw language processor diagram. refer table below
- Language processors:

| Preprocessor | Compiler      | Assembler                | Link/Loader  |
| ------------ | ------------- | ------------------------ | ------------ |
| Pure HLL     | Assembly Code | Relocatable Machine code | Machine code |
|              |               |                          |              |

## Interpreter
- Define
- Draw diagram
- Example: Python, JS, Ruby, PHP

## Analysis of the source program
- Analyzed in stages for:
    - Error detection
    - understand Structure
    - generate machine code
- Analyzed in 3 phases:
    1. Linear analysis (Lexical)
        - Source string is read ltr
        - Grouped to tokens
    2. Hierarchical analysis (Syntactical)
        - Tokens are grouped hierarchically 
        - Checks for syntax errors
    3. Semantic analysis
        - Checks for the correctness and meaning
- This is achieved by the phases of compiler
    - Mention the analysis part of the compiler

# Phases of a compiler
Analysis:
1. Lexical Analysis 
2. Syntax Analysis 
3. Semantic Analysis 
Synthesis:
4. Intermediate Code Representation 
5. Code Optimization 
6. Target Code Generation

- Symbol table
- Error handler

# Compiler construction tools
1. Scanner generators
    - produce **lexical analyzers** from a **regular-expression description of the tokens** of a language
    - Ex: Lex
2. Parser generators
    - produce **syntax analyzers** from a **grammatical description of the programming language**
    - Ex: YACC
3. Syntax-directed translation engines
    - produce **collections of routines for walking a parse tre**e and **generating intermediate code**
4. Code-generator generators
    - produce a **code generator** from a **collection of rules for translating each operation of the intermediate language into the machine language for a target machine**
5. Data-flow analysis engines
    - does the **gathering of information about how values are transmitted from one part of a program to each other part.**
    - Data-flow analysis is a key part of code optimization
6. Compiler-construction toolkits 
    - provides an **integrated set of routines** for constructing various phases of a compiler.

- Some examples of compiler construction tools:
    - LLVM
    - Lance compiler

# Programming language basics
1. The static/dynamic distinction:
    - static policy - policy decided at compile time by a language
    - dynamic policy - decided at runtime
    - example: static scope & dynamic scope
2. Environment and States
    - Two-stage mapping from names to values
    - names -> locations(variables) -> values
    - environment - mapping from names to locations in the store
    - state - mapping from locations in store to their values
3. Static scope & Block structure
    - Static scope => scope rules are based on program structure 
    - Explicit control over scope => access specifiers
    - Uses **blocks** which is the grouping of declarations and statements
4. Explicit access control 
    - Access specifiers
5. Dynamic Scope
    - a use of name x refers to the declaration of x in the most recently called, not-yet-terminated, procedure with such a declaration
    - ex: macro expansion in C, method resolution in OOP
6. Parameter passing mechanisms
    1. Call-by-Value
    2. Call-by-Reference
    3. Call-by-Name
7. Aliasing
    - consequence of call-by-reference where two formal parameters referring to the same location

# Lexical analysis
- a.k.a Scanning
- Reads the stream of characters of the source program and groups the characters into meaningful sequences called **lexemes**
- For each lexeme, it produces a **token** as output:
    - <token-name, attribute-value>
    - ex: <id, 1>
- Which is passed to the next phase
- Lexical analyzer generator: Lex (or Flex)
- Uses **regex** to specify lexeme patterns

## Role of lexical analyzer
- Lexemes
- Tokens
- Interacts with symbol table 
- Draw diagram: page 110
- Removes comments and whitespaces
- Helps in error generation
- Has two steps:
    1. Scanning:
        - Simpler
        - Deletion of comments
        - Compaction of consecutive whitespaces
    2. Lexical Analysis
        - More complex
        - Produces tokens
- Uses DFA for pattern matching
- Define Tokens, Patterns, Lexemes
- Attributes for tokens
- Lexical errors
    - Lexical analyzer doesn't do a lot of error detection
    - But when no patterns not found **"panic mode"** recovery is used where successive characters are deleted till a pattern is matched.

## Input buffering
>> Input buffering is a technique in which the source program is read into two memory buffers so that the lexical analyzer can scan characters efficiently without frequent disk I/O, using pointers to identify lexemes.
- Disk access is slow compared to RAM
- Thus reading character-by-character will be very slow
- Thus, input buffering is used to _speed up_ this
- Lexers needs to lookahead one or more symbols:
    - ex: = could be the beginning of ==
- Thus a **2-buffer scheme** is deviced to deal large lookaheads
- It uses 2 buffers:
    1. one for current input
    2. one for lookahead
- Both buffers have the same size usually the size of disc block
- It reads big chunks of file into memory and lexer works on it 
- Sentinel - each buffer has a special marker at the end **EOF**
- 2 pointers are used:
    - lexemeBegin: where current token starts
    - forward: scan ahead to the find the end of token(til a pattern match is found)
- Draw diagram: page 115
```md
_________________________
| E = M * | C * * 2 EOF |
-------------------------
              ^   ^
              |   |
    lexemeBegin  forward
```

## Specification of tokens

- Strings & Languages
    - Alphabets (∑)
        - Finite set of symbols:
        - {0, 1} -> Binary Alphabets
        - {0, 9} -> Digits
        - {a-z} {A-Z} -> letters
        - ASCII, Unicode
    - Strings -> Finite set of symbols drawn from alphabets 
        - length of str -> no.of occurrence of symbols
        - empty string -> ε
    - Language -> Finite set of strings over some alphabet 
        - ex: x & y are strings
        - concatenation -> xy
- Operations on Languages: page 120
    1. Union - union of sets: x is in a _or_ x is in b
    2. Concatenation - x is in a _and_ x is in b
    3. Closure(L^i): set of L of of i length
        i. Kleen-closure(L^*): concatenate L zero or more times
        ii. Positive closure(L^+): one or more occurrence of L
- Regular Expressions 
    - It is a formal way to describe a set of strings.
    - Used to describe tokens such identifiers, operators, etc.
    - `letter_ ( letter | digit)*`
    - | -> union
    - () -> to group subexpressions
    - * -> zero or more occurrence of
    - + -> one  or more occurrent of
    - _ -> concatenation
    - ε → Represents empty string
    - Regex has operator precedence

- Regular Definitions

## Recognition of tokens using finite automata
- Transition Diagram 
- Finite Automata 
    1. NFA
        - Can have multiple transitions
        - Can have ε (empty) moves
        - Q * ∑ -> 2^Q
    2. DFA
        - One transition for each symbol
        - No ε moves
        - Q * ∑ -> Q

# Regular expressions and finite automata
## Conversion from NFA to DFA
- Subset construction
## Regular expression to NFA
- Thompson's construction



