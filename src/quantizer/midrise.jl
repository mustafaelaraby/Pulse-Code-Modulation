include("nearest_value.jl")

using Statistics

function midrise(signal, L, mp)
    step = (2 * mp) / L
    Levels = collect(-L/2:1:(L/2-1))
    Levels = Levels .* step .+ 0.5 * step

    numBits = ceil(Int, log2(L))  # Convert the result to an integer
    binaryArray = [string(i, base=2, pad=numBits) for i in 0:L-1]

    quantized_signal, error, index_arr = nearest_value(Levels, signal)

    err = mean(error.^2)
    bits_string = Vector{String}(undef, length(signal))

    for i in eachindex(index_arr)
        bits_string[i] = binaryArray[index_arr[i]]
    end

    bits_string = join(bits_string)
    bits_signal = [parse(Int64, digit) for digit in bits_string]


    return quantized_signal,bits_signal,Levels,err
end