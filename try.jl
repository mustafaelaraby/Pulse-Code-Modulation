using WAV

# Assume your audio data is stored in a Vector{Float64} called `data`
data = randn(66150)  # Example data (random noise)

# Specify the filename where you want to save the WAV file
# filename = "output.wav"

# # Specify the sampling frequency (Fs) in Hz
# Fs = 44100  # Example: 44.1 kHz

# # Call the wavwrite function with audio data, filename, and optional parameters
# wavwrite(data, filename; Fs=Fs)
