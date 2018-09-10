# D7011E Compiler Construction

## Build
```
ocamlbuild -r -use-menhir -I extract -pkg zarith Cimp.native
```

## Run
```
./Cimp.native imp_programs/program.imp
```
