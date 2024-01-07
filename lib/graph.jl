"""
    bipartitep(n, adj)

Test if one graph is bipartite. p stands for "predicate".
Assume vertices are labeled from 1 to N, and ADJ 
is the adjacency list of the graph.
"""
function bipartitep(
    n::Ti,
    adj::Vector{Vector{Ti}},
) where {Ti <: Integer}
    color = zeros(Ti, n)
    flag = true
    for i = 1:n
        if !flag
            break
        end
        if color[i] == 0
            color[i] = 1
            que = Queue{Ti}()
            enqueue!(que, i)
            while flag && !isempty(que)
                v = dequeue!(que)
                for u in adj[v]
                    if color[u] == 0
                        color[u] = -color[v]
                        enqueue!(que, u)
                    elseif color[u] == color[v]
                        flag = false
                        break
                    end
                end
            end
        end
    end
    return flag
end