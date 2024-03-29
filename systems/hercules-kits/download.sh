#!/bin/bash

set -e

get() {
  mkdir -p "download/$1"
  if [ ! -f "download/$1/$2" ]; then
    wget -c --no-check-certificate -O "download/$1/$2" "$3"
  fi
}
get_mvs_tk4() {
  get mvs-tk4 $1 "https://wotho.ethz.ch/tk4-/$1"
}
get_vm370_ce() {
  get vm370-ce $2 "http://www.vm370.org/sites/default/files/$1/$2"
}

# DOS/VS 5-pack
get dosvs-5pk DOSVS_5Pack_V1.0-full.zip http://www.vm370.org/sites/default/files/2022-07/DOSVS_5Pack_V1.0-full.zip

# MVS TK3
#get mvs-tk3 MVS_Turnkey_Volker_V3.zip ftp://cbttape.org/pub/cdimages/MVS_Turnkey_Volker_V3.zip

# MVS TK4
get_mvs_tk4 MVS_TK4-_v1.00_Users_Manual.pdf
get_mvs_tk4 tk4-cbt.zip
get_mvs_tk4 tk4-source.zip
get_mvs_tk4 tk4-_v1.00_current.zip

# MVS TK5
get mvs-tk5 mvs-tk5.zip http://www.prince-webdesign.nl/images/downloads/mvs-tk5.zip
get mvs-tk5 srccbt.zip  http://www.prince-webdesign.nl/images/downloads/srccbt.zip

# MVS/CE
get mvs-ce MVSCE.release.v1.0.6.tar https://github.com/MVS-sysgen/sysgen/releases/download/v1.0.6/MVSCE.release.v1.0.6.tar

# VM/370 4-pack
#get vm370-4pk control.zip https://www.ibiblio.org/jmaynard/control.zip
#get vm370-4pk vm3350-1-cckd.zip https://www.ibiblio.org/jmaynard/vm3350-1-cckd.zip
#get vm370-4pk vm3350-2-cckd.zip https://www.ibiblio.org/jmaynard/vm3350-2-cckd.zip
#get vm370-4pk vm3350-3-cckd.zip https://www.ibiblio.org/jmaynard/vm3350-3-cckd.zip
#get vm370-4pk vm3350-4-cckd.zip https://www.ibiblio.org/jmaynard/vm3350-4-cckd.zip
#get vm370-4pk sysres.3350.zip https://www.ibiblio.org/jmaynard/sysres.3350.zip
#get vm370-4pk mcat01.3350.zip https://www.ibiblio.org/jmaynard/mcat01.3350.zip

# VM/370 CE
#get_vm370_ce 2021-05 "VM370CE.V1.R1.1.zip"
get_vm370_ce 2022-07 "VM370CE.V1.R1.2.zip"

# Verify checksums
sha256sum -c SHA256SUMS

