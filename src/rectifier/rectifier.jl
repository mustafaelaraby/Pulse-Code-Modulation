#= 
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Rectifies a signal using either Manchester or AMI rectification criteria.

    * Arguments
        * `signal`: Vector{T1}
                ?? The input signal to be rectified.
        * `ciriteria`: String
                ?? The rectification criteria to be used, should be either "Manchester" or "AMI".
        * `A`: T2
                ?? Amplitude of the rectified signal.
        * `bit_length`: Int64 (optional)
                ?? The length of each bit in the compacted signal. Default is 10.

    * Returns
        * `final_rectified`: Vector{T1}
                ?? The rectified signal.

    * Example
        * Rectify a signal using Manchester rectification criteria
            rectified_signal = rectifier(signal, "Manchester", A)
=#

include("../encoder/repelem.jl")



function rectifier(signal::Vector{T1}, ciriteria::String, A::T2=1, bit_length::Int64=10) where {T1<:Real,T2<:Real}
    compacted = averages(signal, bit_length)
    if ciriteria == "Manchester"
        rectified = rectify_manchester(compacted, A)
    elseif ciriteria == "AMI"
        rectified = rectify_ami(compacted, A)
    else
        throw(ArgumentError("Deocoding ciriteria should be either Manchester or AMI"))
    end
    final_rectified = repelem(rectified, bit_length)
    return final_rectified
end