include("manchester_encode.jl")
include("ami_encode.jl")
include("repelem.jl")

function encoder(bitstream::String, signaling_type::String)
    bits_signal = [parse(Int64, digit) for digit in bitstream]
    if signaling_type == "Manchester"
        encoded = manchester_encode(bits_signal)
    elseif signaling_type == "AMI"
        encoded = ami_encode(bits_signal)
    else
        error("Unknown signaling type!")
    end

    stream_encoded = repelem(encoded, 10)
    stream_encoded = stream_encoded .* 5

    return stream_encoded
end

x = encoder("10001001101010111100110111101111", "AMI")