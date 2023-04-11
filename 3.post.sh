phonopy -f disp-{001..018}/vasprun.xml
cat>band.conf<<**
DIM = 4 4 1
BAND = 0.0 0.0 0.0 0.0 0.5 0.0  0.5 0.5 0.0 0.0 0.5 0.0 0.0 0.0 0.0  
BAND_LABELS = $\Gamma$ X M  Y  $\Gamma$   
BAND_POINTS = 100
MP = 61 61 1
**
phonopy -p band.conf
phonopy-bandplot --gnuplot band.yaml> bands.dat
xmgrace bands.dat
cat>mesh.conf<<**
ATOM_NAME =Al C N
DIM= 4 4 1
MP=10 10 1
**
phonopy -t mesh.conf | tee thermal.out
sed -n '33,1000p' thermal.out > thermaldata.out
