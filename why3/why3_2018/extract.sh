#!/bin/sh
echo "why3 extract --recursive --modular -D ocaml64 -D ocaml64_bv.drv *.mlw -o ../../ocaml/extract -L ."
why3 extract --recursive --modular -D ocaml64 -D ocaml64_bv.drv *.mlw -o ../../ocaml/extract -L .
