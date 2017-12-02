# Computable Interpretations and Real-World Types for Complex System Configurations

## Explanation

This is work by Chong Tang, Kevin Sullivan, Baishakhi Ray, and Trent
Weiss, University of Virginia Department of Computer Science, December
1, 2017

Today, software engineers mainly deliver code artifacts. Code
artifacts are expressions in low-level ​formal logics that are
substantially machine-oriented so ​as to admit efficient compilation
and evaluation. These logics provide built-in "machine-level" memory
models, data types (e.g., int and float), and commands (e.g.,
assignment, if-then conditionals, loops, procedure call), along with
means of composing these affordances into more complex programs.

In recent work, Xiang, Knight, and Sullivan identified two major
shortcomings in this approach. First, in code, software engineers tend
to represent​ properties of real world phenomena as values of (and in
procedures operating on values of) under-constrained machine types. An
example would be to represent the altitude of an aircraft *in meters
relative to ground* ​as ​an integer (int). This machine type admits
values, such as -1, that are not meaningful given real-world
physics. The constraints of the real-world are not imposed in a
checkable form on the machine-level term, allowing for undetected
errors to persist in code.

The second, related, problem is that the intended interpretations of
code, including uses of machine types (whether built-in or user
defined), are not represented precisely, completely, explicitly, or in
a form that enables automated ​checking of consistency with the
real-world. For example, that a given int value is intended to
represent an altitude *in meters relative to ground* would often be
documented informally and incompletely, e.g., in identifier names or
comments. These are not representations that admit automated
consistency checking. Thus, there is usually nothing to prevent a
program from adding an int (in meters) to an int (in feet).

To address these problems, Xiang, Knight, and Sullivan introduced the
twin notions of real-world types and interpreted formalisms. An
interpreted formalism is a pair, (code, interpretation), that is
intended to be the new form of ​software ​deliverable. The program is
viewed as a pure logical construct (albeit often with hints at
real-world types and ​intended interpretation​s​ in comments and
identifiers). The interpretation ​component of an interpreted
formalism pair is an explicit, formal, computable representation of
the intended interpretation of critical aspects of ​the code that
serves to (1) rigorously document intended interpretations​, (2)
enable automated​ checking for consistency with real-world constraints
and laws​, and (3) support improved human understanding and analysis
of code​. An interpretation (1) associates tighter *real-world types*
with values of machines types, and (2) documents key aspects of the
intended interpretations of machine values and operations, e.g.,
concerning physical units, frames of reference, temporal staleness,
measurement uncertainty and failure, etc.

This short paper presents a first porting of the concept of
interpreted formalisms to the realm of complex software system
configurations and a first example of an interpretation formalized
using a modern declarative specification approach, here using Coq, in
particular.

Configurations are collections of parameter values that can be set by
end users to specialize and optimize code properties for specific uses
or environments. Configurations for complex software-intensive systems
can comprise thousands of parameters, whose real-world types and
intended interpretations are often too loose and unclear, and whose
effects on runtime performance and other system properties (e.g.,
safety, ​security, reliability) are often hard to understand or
predict. This work was motivated by a desire to optimize system
qualities by ​meta-heuristic search over configuration spaces for
high-​performing​ configurations. We found that the ​"machine
types​"​ of configuration parameters (e.g., integer, string, float),
and thus of entire configurations, were often under-constrained and
that intended interpretations were often vague, at best, and not
mechanically checkable. Many fields are just documented as being of
type integer, even in cases where not any integer will do. Among other
harms, this under-specification of machine types vastly enlarges
search spaces to include astronomical numbers of configurations that
violate known but not statically checkable (and sometimes not
runtime-checked) real-world constraints.

The contributions of this paper are ​the concept, and a fully
developed example, of formalized interpreted formalisms for complex
system configurations. We present an application of Coq to formalize
an interpretation that includes real-world types for ​both individual
fields and full configurations for ​Hadoop as a case study, focusing
on ​its approximately one hundred (out of about one thousand)
runtime-performance-related parameters. We take advantage of Coq’s (1)
expressive dependent type theory to formally express constraints, (2)
application-specific proof scripts to automate checking of
configurations for satisfaction of these constraints, and (3) Coq's
module system to structure our Coq code for ease of extension,
contraction, and evolution.

When paired with Hadoop “machine-level” configuration files, these
explicit interpretations constitute interpreted formalism pairs for
Hadoop system configuration. The interpretation component represents
(1) previously undocumented parameterization of configurations by
external platform characteristics (such as the number of hardware CPUs
available, memory system page size, etc.), (2) units for all relevant
fields, (3) all ascertained constraints on values of individual
fields, and also across fields, with constraints expressed using (a)
more restrictive "real-world" types provided by or defined in Coq
(such as "positive" rather than just "integer"), and (b) dependent
pairs that​ pair up values of such types with proofs of additional,
declaratively specified properties of those (particular) values,
thereby enforcing their satisfaction of the specified
properties/constraints.

Coq provides tremendously expressive means for documenting
properties/constraints and powerful facilities for automating much
(and in our work to date, all) of the verification of values against
such constraints. ​ It also provide for trustworthy strong and static
verification that all constraints are satisfied, via its foundational
type checker. As an example, Hadoop informally documents but does not
enforce a constraint that a certain ​configuration ​field ​have a
value that is a ​multiple of the platform-specific​ hardware page
size. Our fully interpreted formalism, on the other hand, immediately
reveals such a real-world type error in the form of a failure to
generate a required proof.  ​ Use cases for such work ​include (1)
automated real-world type checking of configurations via syntactic
mapping to corresponding Coq representations and use of the Coq type
checker to run pre-defined proof scripts to verify that all
constraints are satisfied (providing options for human-assisted
verification if necessary), (2) using this type checker to reject
mechanically generated but inconsistent configurations prior to costly
dynamic profiling during meta-heuristic searches, (3) providing a
formal specification of the constraints to be satisfied in a future,
constraint-driven generator of candidate configurations, e.g., using a
separate SMT solver, (4) supporting the development of a human-facing
interface for better understanding of complex configurations and their
implications, ​which will be critical for human-in-the-loop
search/tuning, ​and (5) for generation of good configurations for use
in testing, and ​of ​counter-examples for use in fuzz testing. We have
already developed (1) and (2), with (3) - (5) remaining ​as future
work. We are also now exploring applications of these ideas to
configurations for complex cyber-physical systems, specifically
industrial robots.

## Two versions

This repository contains two versions, in different states of
development, of interpreted formalisms for Hadoop configurations. The
concept of interpreted formalisms was introduced by Xiang, Knight, and
Sullivan. See their papers for more information.

Each directory, shallow and deep, contains a Coq formalization of an interpretation, including real world types, for fields of and for complete Hadoop configurations. The deep directory contains a version that uses techniques of deep embedding; and the shallow, directory, shallow embedding. 

## How to build

To compile either version, change to the directory and just type
"make" in a shell.

NB: The makefiles use the "-R . Top" coqc option, placing all
definitions into the "Top" namespace. Therefore, when launching
CoqIDE, you should do so from the command line and use the command
"coqide -R . Top"
