# bzip2
./sim-outorder -redir:sim ./results/dl1/bzip2/$1-1.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/input.source 280
./sim-outorder -redir:sim ./results/dl1/bzip2/$1-2.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/chicken.jpg 30
./sim-outorder -redir:sim ./results/dl1/bzip2/$1-3.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/liberty.jpg 30
./sim-outorder -redir:sim ./results/dl1/bzip2/$1-4.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/input.program 280
./sim-outorder -redir:sim ./results/dl1/bzip2/$1-5.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/text.html 280
./sim-outorder -redir:sim ./results/dl1/bzip2/$1-6.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/input.combined 200

# gcc
./sim-outorder -redir:sim ./results/dl1/gcc/$1-1.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/166.i -o ./spec_alpha/gcc/gcc_input/166.s
./sim-outorder -redir:sim ./results/dl1/gcc/$1-2.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/200.i -o ./spec_alpha/gcc/gcc_input/200.s
./sim-outorder -redir:sim ./results/dl1/gcc/$1-3.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/c-typeck.i -o ./spec_alpha/gcc/gcc_input/c-typeck.s
./sim-outorder -redir:sim ./results/dl1/gcc/$1-4.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/cp-decl.i -o ./spec_alpha/gcc/gcc_input/cp-decl.s
./sim-outorder -redir:sim ./results/dl1/gcc/$1-5.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/expr.i -o ./spec_alpha/gcc/gcc_input/expr.s
./sim-outorder -redir:sim ./results/dl1/gcc/$1-6.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/expr2.i -o ./spec_alpha/gcc/gcc_input/expr2.s
./sim-outorder -redir:sim ./results/dl1/gcc/$1-7.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/g23.i -o ./spec_alpha/gcc/gcc_input/g23.s
./sim-outorder -redir:sim ./results/dl1/gcc/$1-8.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/s04.i -o ./spec_alpha/gcc/gcc_input/s04.s
./sim-outorder -redir:sim ./results/dl1/gcc/$1-9.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/scilab.i -o ./spec_alpha/gcc/gcc_input/scilab.s

# gromacs
./sim-outorder -redir:sim ./results/dl1/gromacs/$1-1.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/gromacs/gromacs_base.alpha -silent -deffnm ./spec_alpha/gromacs/gromacs_base.alpha.tpr -nice 0

# mcf
./sim-outorder -redir:sim ./results/dl1/mcf/$1-1.txt -cache:dl1 dl1:$1 -max:inst 1000000000 ./spec_alpha/mcf/mcf_base.alpha ./spec_alpha/mcf/mcf_input/inp.in
