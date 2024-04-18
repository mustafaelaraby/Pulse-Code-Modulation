include("src/sampler/sampler.jl")
include("src/quantizer/quantizer.jl")


using WAV

# Replace "your_audio_file.wav" with the path to your audio file
audio_file_path = "input/CantinaBand3.wav"

# Read the audio file
audio_data, sample_rate = wavread(audio_file_path)

time = length(audio_data)/sample_rate

fs = 30000;

x,t = sampler(audio_data, fs,time)

mp = maximum(x)

quantized_signal,bits_signal,Levels, err = quantizer(x,256,mp,"mid-rise")

println("Mean Square Quantization Error:", err)











