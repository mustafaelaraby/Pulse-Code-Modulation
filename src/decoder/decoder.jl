include("averages.jl")
include("rectify_manchester.jl")
include("rectify_ami.jl")
include("manchester_decoder.jl")
include("ami_decoder.jl")
include("binary_chunhs.jl")
include("bin2dec.jl")


function decoder(signal::Vector{T1}, Levels::Vector{T2}, ciriteria::String, A::T3=1) where {T1<:Real,T2<:Real,T3<:Real}
    A = 5
    num_bits = Int64(log2(length(Levels)))
    compacted = averages(signal, 10)
    if ciriteria == "Manchester"
        rectified = rectify_manchester(compacted, A)
        rectified = rectified ./ A
        decoded = manchester_decoder(rectified)

    elseif ciriteria == "AMI"
        rectified = rectify_ami(compacted, A)
        rectified = rectified ./ A
        decoded = ami_decoder(rectified)
    else
        throw(ArgumentError("Deocoding ciriteria should be either Manchester or AMI"))
    end
    chunks = binary_chunks(decoded, num_bits)
    indices = bin2dec(chunks)

    construcred = Float64[]
    for i in indices
        push!(construcred, Levels[i+1])
    end
    return construcred
end