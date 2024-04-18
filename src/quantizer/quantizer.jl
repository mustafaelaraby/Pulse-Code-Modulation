include("midrise.jl")
include("midtread.jl")


function quantizer(input_signal,L,mp,type)
    if type == "mid-rise"
        quantized_signal, bits,levels,err = midrise(input_signal,L,mp)
    elseif type == "mid-tread"
        quantized_signal, bits,levels,err = midtread(input_signal,L,mp)
    else
        error("Invalid quantization type. Choose 'mid-rise' or 'mid-tread'.")
    end
    return quantized_signal, bits,levels,err
end





