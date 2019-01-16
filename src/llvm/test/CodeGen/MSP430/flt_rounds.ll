; RUN: llc -verify-machineinstrs < %s -march=msp430

define i16 @foo() {
entry:
  %0 = call i8 @llvm.flt.rounds()
  %1 = sext i8 %0 to i16
  ret i16 %1
}

declare i8 @llvm.flt.rounds() nounwind 
