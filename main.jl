include("src/sampler/sampler.jl")
include("src/quantizer/quantizer.jl")
include("src/encoder/encoder.jl")
include("src/decoder/decoder.jl")

using WAV
using Plots
default(fontfamily="Computer Modern")

gr()

# Replace "your_audio_file.wav" with the path to your audio file
audio_file_path = "input/CantinaBand3.wav"

# Read the audio file
audio_data, sample_rate = wavread(audio_file_path)

time = length(audio_data)/sample_rate

fs = 30000;

x,t = sampler(audio_data, fs,time)

mp = maximum(x)

quantized_signal, bits_signal, Levels, err = quantizer(x, 256, mp, "mid-tread")
encoded = encoder(bits_signal, "Manchester")

decoded = decoder(encoded, Levels, "Manchester", 5)

plot(t, x, label="original")
plot!(t, decoded, label="construcred")
wavwrite(decoded, "output/mm.wav"; Fs=sample_rate)