# cria uma tree com os numeros de inicio ate fim
def range_tree(inicio, fim):
  bend from = inicio, to = fim:
    when from < to:
      numeros = ![fork(from, (from + to) / 2), fork((from + to) / 2 +1, to)]
    else:
      numeros = !from
  return numeros


def soma_divisores(num):
  numeros = range_tree(1, num -1)

  # consome a tree somando os que sao divisores
  fold numeros:
    case Tree/Node:
      return numeros.left + numeros.right
    case Tree/Leaf:
      if num % numeros.value == 0:
        return numeros.value
      else:
        return 0


def eh_perfeito(num):
  if num > 1:
    if soma_divisores(num) == num:
      return num
    # todo if precisa de um else
    else:
      return 0
  else:
    return 0


def soma_perfeitos(n):
  numeros = range_tree(1, n)

  # consome a tree somando os que sao perfeitos
  fold numeros:
    case Tree/Node:
      return numeros.left + numeros.right
    case Tree/Leaf:
      return eh_perfeito(numeros.value)


def main:
  return soma_perfeitos(500)
  # deve retornar 530
