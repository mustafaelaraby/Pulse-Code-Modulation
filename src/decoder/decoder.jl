#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Decodes a signal using Manchester or AMI decoding criteria.

    Arguments
        * `signal`: Vector{T1}
                ?? The input signal to be decoded.
        * `ciriteria`: String
                ?? The decoding criteria, should be either "Manchester" or "AMI".
        * `A`: T2 (optional)
                ?? The amplitude used in decoding. Default value is 1.

    Returns
        * `decoded`: Vector{T1}
                ?? The decoded signal.

    Example
        * Decode a signal using Manchester decoding criteria
            decoded_signal = decoder(signal, "Manchester")
        * Decode a signal using AMI decoding criteria with custom amplitude
            decoded_signal = decoder(signal, "AMI", 0.5)
=#

include("../rectifier/averages.jl")
include("../rectifier/rectify_manchester.jl")
include("../rectifier/rectify_ami.jl")
include("manchester_decoder.jl")
include("ami_decoder.jl")


function decoder(signal::Vector{T1}, ciriteria::String, A::T2=1) where {T1<:Real,T2<:Real}
    compacted = averages(signal, 10)
    if ciriteria == "Manchester"
        rectified = rectify_manchester(compacted, A)
        decoded = manchester_decoder(rectified, A)

    elseif ciriteria == "AMI"
        rectified = rectify_ami(compacted, A)
        decoded = ami_decoder(rectified, A)
    else
        throw(ArgumentError("Deocoding ciriteria should be either Manchester or AMI"))
    end
    return decoded
end