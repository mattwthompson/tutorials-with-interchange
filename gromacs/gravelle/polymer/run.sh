# gro
wget https://raw.githubusercontent.com/gromacstutorials/gromacstutorials-inputs/main/level2/stretching-a-polymer/cubic-box/peg.gro

# Prepare the PEG molecule
cat > topol.top << EOF
[ defaults ]
; nbfunc    comb-rule       gen-pairs       fudgeLJ fudgeQQ
  1         1           no          1.0     1.0

; Include forcefield parameters
#include "ff/charmm35r.itp"
#include "ff/peg.itp"
#include "ff/tip3p.itp

[ system ]
; Name
  PEG

[ molecules ]
; Compound        #mols
  PEG             1
EOF

wget https://raw.githubusercontent.com/gromacstutorials/gromacstutorials-inputs/main/level2/stretching-a-polymer/cubic-box/ff/charmm35r.itp
wget https://raw.githubusercontent.com/gromacstutorials/gromacstutorials-inputs/main/level2/stretching-a-polymer/cubic-box/ff/peg.itp
wget https://raw.githubusercontent.com/gromacstutorials/gromacstutorials-inputs/main/level2/stretching-a-polymer/cubic-box/ff/tip3p.itp
