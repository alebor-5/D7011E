# D7011E Compiler Construction

## Build
```
ocamlbuild -r -use-menhir -I extract -pkg zarith Cimp.native
```

## Run
```
./Cimp.native imp_programs/program.imp
```
## Credits
Much code from  [cimp_2018](https://gitlab.henriktjader.com/pln/cimp_2018).
