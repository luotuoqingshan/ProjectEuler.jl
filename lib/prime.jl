"""
    linear_sieve(n::Integer)

Compute the primes in the range of 1 to n using the linear sieve algorithm.
The running time is O(n) and the space complexity is O(n).
"""
function linear_sieve(
    n::Ti
) where {Ti <: Integer}
    least_prime_factor = zeros(Ti, n) 
    primes = Ti[] 
    for i in 2:n
        # if least prime factor hasn't been set, then i is prime
        if least_prime_factor[i] == 0 
            least_prime_factor[i] = i
            push!(primes, i)
        end
        for j in eachindex(primes)
            if i * primes[j] > n
                break
            end
            # set the least prime factor of i * primes[j] to primes[j]
            least_prime_factor[i * primes[j]] = primes[j]
            # if i is divisible by primes[j], then break
            # because afterwards the least prime factor of i * primes[j] will not be primes[j]
            if i % primes[j] == 0
                break
            end
        end
    end
    return primes
end

#using BenchmarkTools
#
#@benchmark linear_sieve(10^8)