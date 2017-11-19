# SoS_Coq
A repository to host Coq specification of SoS.

To compile, just type "make" in a shell.

NB: Note that the makefile uses the "-R . Top" with coqc, placing all
definitions into t "Top" namespace. Therefore, when launching CoqIDE, 
use the command "coqide -R . Top"