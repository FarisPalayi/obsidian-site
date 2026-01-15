# Topics
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

# Code Optimization
- Machine-dependent
    - Peephole optimization
    - Data-level optimization
    - Cache optimization
- Machine-independent
    - Loop optimization
    - Constant folding
    - Constant propagation
    - Common subexpression elimination

# Loop Optimizations
- Loop motion
- Loop fusion
- Loop unrolling
- Reduction in strength
