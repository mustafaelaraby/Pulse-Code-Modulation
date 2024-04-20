function repelem(arr::Array, counts::Int=2)
    return vcat(broadcast(x -> fill(x, counts), arr)...)
end