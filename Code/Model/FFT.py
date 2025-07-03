import numpy as np
np.set_printoptions(precision=3)
np.random.seed(2)


def round_and_sat(x: np.ndarray, WordSize: int, FractionSize: int) -> np.ndarray:
    xScaled = round(x * (2**FractionSize))
    xScaled = np.clip(xScaled, -2**(WordSize-1), 2**(WordSize-1)-1)
    return xScaled/(2**FractionSize)


round_and_sat_v = np.vectorize(round_and_sat)


def reverse_bits(n: int, num_bits: int = 5) -> int:
    reversed_num = 0
    for i in range(num_bits):
        reversed_num = (reversed_num << 1) | (n >> i) & 1
    return reversed_num


def reorder_input(x: np.ndarray) -> None:
    N = len(x)
    for i in range(N):
        j = reverse_bits(i)
        if i < j:
            x[i], x[j] = x[j], x[i]
    return


for twiddle_word_size, twiddle_fraction_size in [(8,6)]:
    for butterfly_word_size, butterfly_fraction_size in [(13,0)]:    
        xIdeal_arr = []
        error = []
        for i_iter in range(1):
            x = np.random.rand(32) #+ 1j * np.random.rand(32) 
            x *= 2**7
            x = round_and_sat_v(np.real(x), 8, 0) #+ 1j * \
            #     round_and_sat_v(np.imag(x), 8, 0)
            f = open(f"input.txt", "w")
            xScaled = x 
            for i in xScaled:
                f.write(str(np.real(i).astype(int))+'\n') #+ ' ' +
                        # str(np.imag(i).astype(int)) + '\n')
            f.close()
            x_c = x.copy()
            # FFT
            N = 32
            reorder_input(x)
            for stage in range(5):
                x_temp = np.zeros(N, dtype=np.complex64)
                size = 2**stage
                for i in range(0, N, 2*size):
                    for k in range(size):
                        tw = np.exp(-2j * np.pi * k / (2*size)
                                    ).astype(np.complex64)
                        tw = round_and_sat(np.real(tw),
                                        twiddle_word_size, 
                                        twiddle_fraction_size) + 1j * \
                            round_and_sat(
                                np.imag(tw), 
                                twiddle_word_size, 
                                twiddle_fraction_size)
                        in2 = tw*x[i+size+k]
                        x_temp[i + k] = x[i+k] + in2
                        x_temp[i+k] = round_and_sat(
                            np.real(x_temp[i+k]),
                            butterfly_word_size,
                            butterfly_fraction_size) + \
                            1j*round_and_sat(
                                np.imag(x_temp[i+k]),
                                butterfly_word_size,
                                butterfly_fraction_size)
                        x_temp[i+size + k] = x[i+k] - in2
                        x_temp[i+size+k] = round_and_sat(
                            np.real(x_temp[i+k+size]),
                            butterfly_word_size,
                            butterfly_fraction_size) + \
                            1j*round_and_sat(
                                np.imag(x_temp[i+k+size]),
                                butterfly_word_size,
                                butterfly_fraction_size) 

                x = x_temp
                f = open(f"stage{stage}.txt", "w")
                xScaled = x * 2**butterfly_fraction_size
                for i in xScaled:
                    f.write(str(np.real(i).astype(int)) + ' ' +
                            str(np.imag(i).astype(int)) + '\n')
                f.close()
            XIdeal = np.fft.fft(x_c)
            xIdeal_arr.append(np.sum(np.abs(XIdeal)))
            error.append(np.sum(np.abs(x - XIdeal)))
            
        print(np.allclose(x, np.fft.fft(x_c), atol=1e1))
        SQNR = 10*np.log10(sum(xIdeal_arr)**2 / sum(error)**2)
    
        print(f"SQNR: {SQNR:.3f}\
        S({butterfly_word_size - butterfly_fraction_size - 1},{butterfly_fraction_size})")
    # print(f"SQNR: {SQNR:.3f}\
    # S({twiddle_word_size - twiddle_fraction_size - 1},{twiddle_fraction_size})")
    # print(x)
    # printd(np.fft.fft(x_c))
        
f = open("output.txt", "w")
x *=2**butterfly_fraction_size
for i in x:
    f.write(str(np.real(i).astype(int)) + ' ' + str(np.imag(i).astype(int)) + '\n')
f.close()
