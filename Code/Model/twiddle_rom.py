import numpy as np
from FFT import round_and_sat
import sys
fr = open("twiddle_rom_real.mem", "w")
fi = open("twiddle_rom_imag.mem", "w")
for i in range(16):
  tw = np.exp(-2j*i*np.pi/32).astype(np.complex64)
  tw = round_and_sat(np.real(tw), 8, 6) + 1j * \
      round_and_sat(np.imag(tw), 8, 6)
  tw *= 2**6
  fr.write(np.binary_repr(np.real(tw).astype(int), width=8)+'\n')
  fi.write(np.binary_repr(np.imag(tw).astype(int), width=8) + '\n')
  
fr.close()
fi.close()