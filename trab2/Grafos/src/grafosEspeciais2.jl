export kneser, bipartidoCompleto, grafoAleatório,
       bipartidoAleatório, grafoArestas



""""
    kneser(n, k)

Devolve o grafo de Kneser K(n,k).
Veja o exercício E 1.16 do livro do Paulo Feofiloff.
"""
kneser(n::Int, k::Int)::Grafo = nulo()
# function kneser(n::Int, k::Int)::Grafo
#    g::ListaAdjacência = nulo()
#    if n == 0 || k == 0 || k > div(n, 2)
#       return g
#    end

#    sets = Vector{Vector{Int}}()

# end

"""
   regular n k
 
Devolve um grafo `k`-regular com `n` vértices ou o erro `Grafo regular inexistente`,
caso isso não seja possível.
"""
function regular(n::Int, k::Int)::Grafo
   if true
      nulo()
   else
      error("Grafo regular inexistente")
   end
end

""""
    bipartidoCompleto(p, q)

Recebe dois naturais positivos e devolve um grafo bipartido completo K_{p,q}
com `p` vértices, 1, ...,p na primeira partição e  `q` vértices p+1, ..., p + q,
na segunda partição.
"""
# bipartidoCompleto(p::Int, q::Int)::Grafo = nulo()
function bipartidoCompleto(p::Int, q::Int)::Grafo
   g::ListaAdjacência = nulo()
   if p == 0 && q == 0
      return g
   end

   i::Int = 1

   while i <= p + q
      novo_vértice!(g)
      i = i + 1
   end

   j::Int = p+1
   i = 1

   while i <= p
      while j <= p + q
         nova_aresta!(g, i, j)
         j = j + 1
      end
      j = p + 1
      i = i + 1
   end

   return g
end


"""
   grafoAleatório(n, m)

Cria um grafo com `n` vértices 1, ..., n e com exatamente `m` arestas. As
extremidades das arestas devem ser escolhidas aleatoriamente e a função deve
evitar criar grafos que não sejam simples, ou seja, não pode haver laços nem
arestas paralelas. Se `m` ultrapassar o limite máximo de arestas para um grafo
simples com `n` vértices, a função deve gerar o grafo completo.
"""
# grafoAleatório(n::Int, m::Int)::Grafo = nulo()
function grafoAleatório(n::Int, m::Int)::Grafo
   g::Grafo = nulo()
   if n == 0 return g end
   if n == 1 
      novo_vértice!(g)
      return g
   end

   i::Int = 1

   while i <= n
      novo_vértice!(g)
      i = i + 1
   end

   if m > trunc((n*(n-1))/2)

      j::Int = 2

      i = 1
      while i <= n
         while j <= n
            nova_aresta!(g, i, j)
            j = j + 1
         end
         i = i + 1
         j = i + 1
      end

      return g
   end

   i = 1
   vertice1::Int = 0
   vertice2::Int = 0

   while i <= m

      vertice1 = rand(1:n)

      while grau(g, vertice1) == n-1
         vertice1 = rand(1:n)
      end
      
      vertice2 = rand(1:n)

      while adjacente(g, vertice1, vertice2) == true || vertice1 == vertice2
         vertice2 = rand(1:n)
      end

      nova_aresta!(g, vertice1, vertice2)
      i = i + 1

   end  

   return g
end


"""
   bipartidoAleatório(p, q, m)

Cria um grafo bipartido com `p` vértices 1, ..., p, na primeira partição,
`q` vértices p+1, ..., p+q, na segunda partição e exatamente `m` arestas. As
extremidades das arestas devem ser escolhidas aleatoriamente e a função deve
evitar criar grafos que não sejam simples, ou seja, não pode haver laços nem
arestas paralelas. Se `m` ultrapassar o limite máximo de arestas de um grafo
bipartido simples com p+q vértices, a função deve gerar o grafo bipartido
completo.
"""
# bipartidoAleatório(p::Int, q::Int, m::Int)::Grafo = nulo()
function bipartidoAleatório(p::Int, q::Int, m::Int)::Grafo
   g::Grafo = nulo()
   if p == 0 && q == 0 return g end

   i::Int = 1

   while i <= p+q
      novo_vértice!(g)
      i = i + 1
   end

   if m >= p*q

      j::Int = p+1
      i = 1
   
      while i <= p
         while j <= p + q
            nova_aresta!(g, i, j)
            j = j + 1
         end
         j = p + 1
         i = i + 1
      end
   
      return g
   end
   
   i = 1
   vertice1::Int = 0
   vertice2::Int = 0

   while i <= m

      vertice1 = rand(1:p)

      while grau(g, vertice1) == q
         vertice1 = rand(1:p)
      end
      
      vertice2 = rand((p+1):(p+q))

      while adjacente(g, vertice1, vertice2) == true
         vertice2 = rand((p+1):(p+q))
      end

      nova_aresta!(g, vertice1, vertice2)
      i = i + 1

   end  

   return g
end


"""
   grafoArestas(g)

Recebe um grafo `g` e devolve o grafo de arestas de g.
Veja o exercício E 1.24 do livro do Paulo Feofiloff.
"""
grafoArestas(g::Grafo)::Grafo = nulo()
function grafoArestas(g::Grafo)::Grafo
   v::Grafo = nulo()
   if g == nulo() || narestas(g) == 0 return v end

   if narestas(g) == 1
      novo_vértice!(v)
      return v
   end

   i::Int = 1
   while i <= narestas(g)
      novo_vértice!(v)
      i = i + 1
   end

   i = 1
   j::Int = 1

   while i <= n
      
end
