# Compiler Design Syllabus

## [](.md)
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

## [](.md)
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
- [ ] ~~Top-down parsing techniques~~
  - [ ] Recursive descent parsing
  - [ ] LL(1) grammars
  - [ ] Non-recursive predictive parsing
- [ ] ~~Bottom-up parsing techniques~~
  - [ ] Reductions
  - [ ] Handle pruning
  - [ ] Shift-reduce parsing
  - [ ] Operator precedence parsing
  - [ ] Simple LR parsing

## [](.md)
- [ ] Syntax-directed translation
  - [ ] Syntax-directed definitions
  - [ ] S-attributed definitions
  - [ ] L-attributed definitions
  - [ ] Bottom-up and top-down translations
- [ ] Type checking
  - [ ] Type systems
  - [ ] Specification of a type checker
  - [ ] Symbol table
- [ ] Intermediate code generation
  - [ ] Directed acyclic graphs (DAG)
  - [ ] Three-address code
    - [ ] Addresses and instructions
    - [ ] Quadruples
    - [ ] Triples
    - [ ] Indirect triples

## [](.md)
- [ ] Run-time environments
  - [ ] Storage optimization
  - [ ] Static vs dynamic allocation
  - [ ] Stack allocation of space
- [ ] Activation records and procedures
  - [ ] Activation trees and records
  - [ ] Calling sequences
  - [ ] Access to non-local data on the stack
  - [ ] Data access without nested procedures
  - [ ] Issues with nested procedures
- [ ] Heap management
  - [ ] The memory manager
  - [ ] The memory hierarchy

## [](.md)
- [ ] Code generation
  - [ ] Issues in the design of a code generator
  - [ ] The target language
  - [ ] A simple target machine model
  - [ ] Program and instruction costs
  - [ ] Addresses in the target code
  - [ ] Static allocation
  - [ ] Stack allocation
  - [ ] Run-time addresses for names
- [ ] Basic blocks and flow graphs
  - [ ] Representation of flow graphs
- [ ] Code optimization
  - [ ] Principal sources of optimization
  - [ ] Data flow analysis
    - [ ] Abstraction
    - [ ] Data flow analysis schema
    - [ ] Data flow schemas on basic blocks
    - [ ] Reaching definitions
    - [ ] Live variable analysis
    - [ ] Available expressions
- [ ] Region-based analysis
  - [ ] Regions
  - [ ] Region hierarchies for reducible flow graphs
  - [ ] Overview of region-based analysis
