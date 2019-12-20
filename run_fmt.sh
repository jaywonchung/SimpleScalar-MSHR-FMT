if [ -z "$1" ]; then
    echo "Provide argument for experiment folder/file name."
    exit 1
fi

# bzip2
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/bzip2/$1-1.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/input.source 280
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/bzip2/$1-2.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/chicken.jpg 30
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/bzip2/$1-3.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/liberty.jpg 30
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/bzip2/$1-4.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/input.program 280
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/bzip2/$1-5.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/text.html 280
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/bzip2/$1-6.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/bzip2/bzip2_base.alpha ./spec_alpha/bzip2/bzip2_input/input.combined 200

# gcc
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/gcc/$1-1.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/166.i -o ./spec_alpha/gcc/gcc_input/166.s
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/gcc/$1-2.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/200.i -o ./spec_alpha/gcc/gcc_input/200.s
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/gcc/$1-3.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/c-typeck.i -o ./spec_alpha/gcc/gcc_input/c-typeck.s
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/gcc/$1-4.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/cp-decl.i -o ./spec_alpha/gcc/gcc_input/cp-decl.s
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/gcc/$1-5.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/expr.i -o ./spec_alpha/gcc/gcc_input/expr.s
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/gcc/$1-6.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/expr2.i -o ./spec_alpha/gcc/gcc_input/expr2.s
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/gcc/$1-7.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/g23.i -o ./spec_alpha/gcc/gcc_input/g23.s
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/gcc/$1-8.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/s04.i -o ./spec_alpha/gcc/gcc_input/s04.s
./sim-outorder -config ./config/oo-fmt.cfg -redir:sim ./results/$1/gcc/$1-9.txt -fastfwd 2000000000 -max:inst 1000000000 ./spec_alpha/gcc/gcc.alpha ./spec_alpha/gcc/gcc_input/scilab.i -o ./spec_alpha/gcc/gcc_input/scilab.s
