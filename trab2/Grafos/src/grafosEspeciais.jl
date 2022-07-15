export caminho, grade, dama, bispo, cavalo,
       torre, rei, cubo, petersen,
       ciclo, completo, amigo, roda, estrela

""""
    caminho(n)

Devolve um grafo caminho com `n` vértices.
"""
#caminho(n::Int)::Grafo = nulo()
function caminho(n::Int)::Grafo
   g::ListaAdjacência = nulo()
   if n <= 0 return g end
   if n == 1 
      novo_vértice!(g)
      return g
   end
   
   i::Int = 1
   novo_vértice!(g)
   while i < n
      novo_vértice!(g)
      nova_aresta!(g, i, i+1)
      i = i + 1 
   end
   return g
end

""""
   grade(p, q)

Devolve uma grade `p`-por-`q`.
Veja o exercício E 1.6 do livro do Paulo Feofiloff.
"""
# grade(p::Int, q::Int)::Grafo = nulo()
function grade(p::Int, q::Int)::Grafo
   g::ListaAdjacência = nulo()
   if p == 0 || q == 0 return g end
   if p == 1 && q == 1
      novo_vértice!(g)
      return g
   end

   i::Int = 1

   while i <= p*q
      novo_vértice!(g)
      i = i + 1
   end

   i = 1

   while i < p*q
      nova_aresta!(g, i, i+q)
      if i % q != 0
         nova_aresta!(g, i, i+1)
      end
      i = i + 1
   end

   return g
end


"""
   dama(t)

Devolve o grafo da dama |t|-por-|t|.
Veja o exercício E 1.8 do livro do Paulo Feofiloff.
"""
# dama(t::Int)::Grafo = nulo()
function dama(t::Int)::Grafo
   g::ListaAdjacência = nulo()
   if t == 0 return g end
   if t == 1
      novo_vértice!(g)
      return g
   end

   i::Int = 1
   while i <= t*t
      novo_vértice!(g)
      i = i + 1
   end

   i = 1 # Vértice atual
   j::Int = 1 # Iteração atual
   k::Int = 1 # Linha atual

   while i < t*t
      while j < t
         if j+i <= k*t # Conecta com os vértices à direita
            nova_aresta!(g, i, j+i)
         end
         if (i-1) % t + j < t && i+(j*t)+j <= t*t # Conecta com os vérticas na diagonal para direita/baixo
            nova_aresta!(g, i, i+(j*t)+j)
         end
         if i+(j*t) <= t*t # Conecta com os vértices abaixo
            nova_aresta!(g, i, i+(j*t))
         end
         if (i-1) % t - j > -1 && i+(j*t)-j <= t*t # Conecta com os vértices na diagonal para esquerda/baixo
            nova_aresta!(g, i, i+(j*t)-j)
         end
         j = j + 1
      end
      j = 1
      i = i + 1
      if i % t == 1
         k = k + 1
      end
   end

   return g
end
"""
  cavalo(t)

Devolve o grafo do cavalo |t| por |t|. Os vértices, ou seja, as casas do
tabuleiro, devem ser numerados de 1 a t^2, de baixo para cima e da
esquerda para a direita. Veja o exercício E 1.9 do livro do Paulo Feofiloff.
Dica: para se inspirar, leia o documento em

    https://bradfieldcs.com/algos/graphs/knights-tour
"""
# cavalo(t::Int)::Grafo = nulo()
function cavalo(t::Int)::Grafo
   g::ListaAdjacência = nulo()
   if t == 0 return g end
   if t == 1
      novo_vértice!(g)
      return g
   end

   i::Int = 1 # Vértice atual

   while i <= t*t
      novo_vértice!(g)
      i = i + 1
   end
   if t == 2 return g end

   i = 1

   k::Int = 0

   while i <= t*t
      if (i-1) % t >= 2 && i+t-2 <= t*t
         nova_aresta!(g, i, i+t-2)
      end
      if (i-1) % t < t-2 && i+t+2 <= t*t
         nova_aresta!(g, i, i+t+2)
      end
      if (i-1) % t >= 1 && i+(2*t)-1 <= t*t
         nova_aresta!(g, i, i+(2*t)-1)
      end
      if (i-1) % t < t-1 && i+(2*t)+1 <= t*t
         nova_aresta!(g, i, i+(2*t)+1)
      end

      i = i + 1
   end

   return g
end

"""
   bispo(t)

Devolve o grafo do bispo |t|-por-|t|.
Veja o exercício E 1.10 do livro do Paulo Feofiloff.
"""
# bispo(t::Int)::Grafo = nulo()
function bispo(t::Int)::Grafo
   g::ListaAdjacência = nulo()
   if t == 0 return g end
   if t == 1
      novo_vértice!(g)
      return g
   end

   i::Int = 1
   while i <= t*t
      novo_vértice!(g)
      i = i + 1
   end

   i = 1 # Vértice atual
   j::Int = 1 # Iteração atual

   while i < t*t
      while j < t
         if (i-1) % t + j < t && i+(j*t)+j <= t*t # Conecta com os vérticas na diagonal para direita/baixo
            nova_aresta!(g, i, i+(j*t)+j)
         end
         if (i-1) % t - j > -1 && i+(j*t)-j <= t*t # Conecta com os vértices na diagonal para esquerda/baixo
            nova_aresta!(g, i, i+(j*t)-j)
         end
         j = j + 1
      end
      j = 1
      i = i + 1
   end

   return g
end


"""
   torre(t)

Devolve o grafo da torre |t|-por-|t|.
Veja o exercício E 1.11 do livro do Paulo Feofiloff.
"""
# torre(t::Int)::Grafo = nulo()
function torre(t::Int)::Grafo
   g::ListaAdjacência = nulo()
   if t == 0 return g end
   if t == 1
      novo_vértice!(g)
      return g
   end

   i::Int = 1
   while i <= t*t
      novo_vértice!(g)
      i = i + 1
   end

   i = 1 # Vértice atual
   j::Int = 1 # Iteração atual
   k::Int = 1 # Linha atual

   while i < t*t
      while j < t
         if j+i <= k*t # Conecta com os vértices à direita
            nova_aresta!(g, i, j+i)
         end
         if i+(j*t) <= t*t # Conecta com os vértices abaixo
            nova_aresta!(g, i, i+(j*t))
         end
         j = j + 1
      end
      j = 1
      i = i + 1
      if i % t == 1
         k = k + 1
      end
   end

   return g
end


"""
   rei(t)

Devolve o grafo do rei |t|-por-|t|.
Veja o exercício E 1.12 do livro do Paulo Feofiloff.
"""
# rei(t::Int)::Grafo = nulo()
function rei(t::Int)::Grafo
   g::ListaAdjacência = nulo()
   if t == 0 return g end
   if t == 1
      novo_vértice!(g)
      return g
   end

   i::Int = 1
   while i <= t*t
      novo_vértice!(g)
      i = i + 1
   end

   i = 1 # Vértice atual

   while i < t*t
      if i % t != 0 && i+1 <= t*t # Conecta com o vértice à direita
         nova_aresta!(g, i, i+1)
      end
      if i % t != 0 && i+t+1 <= t*t # Conecta com o vértice na diagonal para direita/baixo
         nova_aresta!(g, i, i+t+1)
      end
      if i+t <= t*t # Conecta com o vértice abaixo
         nova_aresta!(g, i, i+t)
      end
      if i % t != 1 && i+t-1 <= t*t # Conecta com o vértice na diagonal para esquerda/baixo
         nova_aresta!(g, i, i+t-1)
      end

      i = i + 1
   end

   return g
end

"""
   cubo(k)

Devolve o grafo do cubo de dimensão |k|.
Veja o exercício E 1.14 do livro do Paulo Feofiloff.
"""
# cubo(k)::Grafo = nulo()
function cubo(k)::Grafo
   g::ListaAdjacência = nulo()
   if k == 0 return g end
   if k == 1
      novo_vértice!(g)
      return g
   end

   i::Int = 1
   while i <= 2^k
      novo_vértice!(g)
      i = i + 1
   end

   i = 1
   j::Int = 1

   bitsI::String = ""
   bitsJ::String = ""

   resto::Int = -1
   quociente::Int = i

   diferencas::Int = 0
   iterador::Int = 1

   while i < 2^k

      quociente = i-1
      while quociente != 0 # Converte o número do vértice - 1 para binário
         resto = quociente % 2
         quociente = div(quociente, 2)
         bitsI = "$resto" * bitsI
      end

      while length(bitsI) < k # Preenche com zeros para que todas as strings tenham o mesmo tamanho
         bitsI = "0" * bitsI
      end

      j = i
      while j < 2^k
         quociente = j
         while quociente != 0 # Converte o número do vértice - 1 para binário
            resto = quociente % 2
            quociente = div(quociente,2)
            bitsJ = "$resto" * bitsJ
         end

         while length(bitsJ) < k # Preenche com zeros para que todas as strings tenham o mesmo tamanho
            bitsJ = "0" * bitsJ
         end

         while iterador <= k # Compara as strings e soma o número de diferenças
            if bitsI[iterador] != bitsJ[iterador]
               diferencas = diferencas + 1
            end
            iterador = iterador + 1
         end

         if diferencas == 1 # Cria uma aresta entre os dois vértices comparados se a diferença entre eles é de uma casa
            nova_aresta!(g, i, j+1)
         end

         diferencas = 0
         iterador = 1
         j = j + 1
         bitsJ = ""
      end

      i = i + 1
      bitsI = ""
   end

   return g
end

"""
   petersen()

Devolve o grafo de Petersen.
Veja o exercício E 1.15 do livro do Paulo Feofiloff.
"""
# petersen()::Grafo = nulo()
function petersen()::Grafo
   g::ListaAdjacência = nulo()

   sets = Vector{Vector{Int}}(undef, 10)

   i::Int = 1
   j::Int = 2
   k::Int = 1

   while i <= 5
      while j <= 5
         sets[k] = [i,j]
         novo_vértice!(g)
         j = j + 1
         k = k + 1
      end
      i = i + 1
      j = i + 1
   end

   i = 1
   j = 2
   k = 1
   aux::Int = 1
   diferencas::Int = 0

   while i <= 10
      while j <= 10
         while k <= 2
            while aux <= 2
               if sets[i][k] != sets[j][aux]
                  diferencas = diferencas + 1
               end
               aux = aux + 1
            end
            k = k + 1
            aux = 1
         end
         k = 1
         if diferencas == 4
            nova_aresta!(g, i, j)
         end
         diferencas = 0
         j = j + 1
      end
      i = i + 1
      j = i + 1
   end

   return g
end


"""
   ciclo(n)

Devolve um grafo ciclo com |n| vértices.
"""
# ciclo(n::Int)::Grafo = nulo()
function ciclo(n::Int)::Grafo
   g::ListaAdjacência = nulo()
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

   i = 1

   while i < n
      nova_aresta!(g, i, i+1)
      i = i + 1
   end
   nova_aresta!(g, n, 1)

   return g
end

"""
  completo(n)

Devolve um grafo completo com |n| vértices (K_n).
"""
# completo(n::Int)::Grafo = nulo()
function completo(n::Int)::Grafo
   g::ListaAdjacência = nulo()
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

   i = 1
   j::Int = 1

   while i < n
      while j < n
         nova_aresta!(g, i, j+1)
         j = j + 1
      end
      i = i + 1
      j = i
   end

   return g
end

"""
   amigo(n)

Devolve um grafo amigo com |2n+1| vértices e |3n| arestas.
Ver
   https://en.wikipedia.org/wiki/Friendship_graph
"""
# amigo(n::Int)::Grafo = nulo()
function amigo(n::Int)::Grafo

   n = 2*n + 1

   g::ListaAdjacência = nulo()
   if n == 1
      novo_vértice!(g)
      return g
   end

   i::Int = 1

   while i <= n
      novo_vértice!(g)
      i = i + 1
   end

   i = 2
   while i < n
      nova_aresta!(g, i, i+1)
      nova_aresta!(g, 1, i)
      nova_aresta!(g, 1, i+1)

      i = i + 2
   end

   return g
end


"""
   roda(n)

Devolve um grafo roda com |n| vértices.
Ver
  https://en.wikipedia.org/wiki/Wheel_graph
"""
# roda(n::Int)::Grafo = nulo()
function roda(n::Int)::Grafo
   g::ListaAdjacência = nulo()
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

   i = 2
   
   nova_aresta!(g, 1, i)
   while i < n
      nova_aresta!(g, i, i+1)
      nova_aresta!(g, 1, i+1)
      i = i + 1
   end
   nova_aresta!(g, n, 2)

   return g
end


"""
   estrela(n)

Devolve um grafo estrela com |n+1| vértices.
Ver
   https://pt.wikipedia.org/wiki/Estrela_(teoria_dos_grafos)
"""
# estrela(n::Int)::Grafo = nulo()
function estrela(n::Int)::Grafo

   n = n+1

   g::ListaAdjacência = nulo()
   if n == 1
      novo_vértice!(g)
      return g
   end

   i::Int = 1

   while i <= n
      novo_vértice!(g)
      i = i + 1
   end

   i = 1

   while i < n
      nova_aresta!(g, 1, i+1)
      i = i + 1
   end

   return g
end