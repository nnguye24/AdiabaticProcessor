MIPS Multicycle FSM State Diagram

States (Name: encoding):
  INIT:    00
  FETCH1:  81
  FETCH2:  89
  DECODE:  83
  MEMADR:  86
  LBRD:    88
  LBWR:    90
  SBWR:    98
  RTYPEX:  CC
  RTYPEWR: A0
  BEQEX:   04
  JEX:     A8
  ADDIEX:  8E
  ADDIWR:  B0

Transitions:
  Reset      → INIT
  INIT       → FETCH1
  FETCH1     → FETCH2
  FETCH2     → DECODE
  DECODE     → MEMADR   (Op = LB or SB)
  DECODE     → RTYPEX   (Op = R-type)
  DECODE     → BEQEX    (Op = BEQ)
  DECODE     → JEX      (Op = Jump)
  DECODE     → ADDIEX   (Op = ADDI)
  MEMADR     → LBRD     (Op = LB)
  MEMADR     → SBWR     (Op = SB)
  LBRD       → LBWR
  LBWR       → FETCH1
  SBWR       → FETCH1
  RTYPEX     → RTYPEWR
  RTYPEWR    → FETCH1
  BEQEX      → FETCH1
  JEX        → FETCH1
  ADDIEX     → ADDIWR
  ADDIWR     → FETCH1