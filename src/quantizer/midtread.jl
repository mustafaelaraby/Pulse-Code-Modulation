include("nearest_value.jl")
include("dec2bin.jl")


using Statistics

function midtread(signal::Vector{T}, L::Int64, mp::T) where {T<:Real}
    step = (2 * mp) / L
    Levels = collect((-L/2 + 1):1:(L/2))
    Levels = Levels .* step

    numBits = ceil(Int, log2(L))  # Convert the result to an integer
    binaryArray = dec2bin(collect(0:L-1), numBits)

    quantized_signal, error, index_arr = nearest_value(Levels, signal)

    err = mean(error.^2)
    bits_string = Vector{String}(undef, length(signal))

    for i in eachindex(index_arr)
        bits_string[i] = binaryArray[index_arr[i]]
    end

    bits_string = join(bits_string)
    return quantized_signal, bits_string, Levels, err
end
