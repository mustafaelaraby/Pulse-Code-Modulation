#=
    ! Copyright (c) 2024 Mustafa Elaraby, Cairo,
    ! Egypt. All rights reserved.
    ! Email: mustafaelaraby78@gmail.com

    * Decodes an AMI encoded signal to obtain the original binary data.

    * Arguments
        * `signal::Vector{T1}`: Input signal as an array of 1s, -1s, and 0s representing positive, negative, and null levels.
        * `A::T2`: A value of the same type as elements in the array.

    * Returns
        * `String`: Decoded binary data.

    * Errors
        * Throws an ArgumentError if the length of the input signal is not even.
=#


function ami_decoder(signal::Vector{T1}, A::T2=1) where {T1<:Real,T2<:Real}
    decoded_data = Bool[]
    for bit in signal
        if bit == A
            push!(decoded_data, 1)
        elseif bit == 0
            push!(decoded_data, 0)
        elseif bit == -A
            push!(decoded_data, 1)
        else
            throw("Invalid AMI signal sequence.")
        end
    end
    binary_string = join(string.(Int.(decoded_data)))
    return binary_string
end