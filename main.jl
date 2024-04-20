# Include necessary modules
include("src/sampler/sampler.jl")
include("src/quantizer/quantizer.jl")
include("src/encoder/encoder.jl")
include("src/Noise/awgn.jl")
include("src/rectifier/rectifier.jl")
include("src/decoder/decoder.jl")
include("src/generator/generator.jl")

# Import required libraries
using WAV
using Plots

# Set default plot font
default(fontfamily="Computer Modern")

# Set plot size
gr(size=(1200, 800))

# Define the path to the audio file
audio_file_path = "input/CantinaBand3.wav"

# Read the audio file
audio_data, rate = wavread(audio_file_path)
duration = length(audio_data) / rate
time_vector = 0:(1/rate):(duration-(1/rate))

# Define the sampling frequency
fs = rate

# Sample the audio signal
x, t = sampler(audio_data, fs, rate)

# Quantize the sampled signal
mp = maximum(x)
quantized_signal, bits_signal, Levels, err = quantizer(x, 512, mp, "mid-tread")

# Encode the quantized signal
encoded = encoder(bits_signal, "Manchester", 5)

# Add Gaussian white noise to the encoded signal
noisy = awgn(encoded, 25)

# Rectify the noisy signal
rectified = rectifier(noisy, "Manchester", 5)

# Decode the rectified signal
decoded = decoder(rectified, "Manchester", 5)

# Generate the final signal
generated = generator(decoded, Levels)

# Write the generated signal to an output WAV file
wavwrite(generated, "output/CantinaBand3_SNR_25_db.wav"; Fs=fs)

# Set the resolution (dpi) for the plot
layout = (7, 1)
p1 = plot(time_vector, audio_data, label="original")
p2 = plot(t, x, label="sampled", color="teal")
p3 = plot(t, quantized_signal, label="quantized", color="purple")
p4 = plot(t[1:400], encoded[1:400], label="encoded", color="orange")
p5 = plot(t[1:400], noisy[1:400], label="SNR:25 db", color="red")
p6 = plot(t[1:400], rectified[1:400], label="rectified", color="black")
p7 = plot(t, generated, label="generated", color="green")

# Plot all the signals
plot(p1, p2, p3, p4, p5, p6, p7, layout=layout, dpi=1000)

# Save the plot as an image file
savefig("figures/CantinaBand3_SNR_25_db.png")
