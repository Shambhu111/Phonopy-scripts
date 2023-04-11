#!/bin/bash
phonopy -d --dim="4 4 1"

for file in POSCAR-*; do
  disp=$(echo "$file" | sed 's/POSCAR-\(.*\)/\1/')
  mkdir -p "disp-$disp"
done
for file in POSCAR-*; do
  disp=$(echo "$file" | sed 's/POSCAR-\(.*\)/\1/')
  cp "$file" "disp-$disp/POSCAR"
done
for folder in disp-*; do
  cp INCAR KPOINTS POTCAR "$folder"
  rm -rf POSCAR-*
done
