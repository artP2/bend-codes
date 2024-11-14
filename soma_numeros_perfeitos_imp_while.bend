# meio que emulando um while
def soma_divisores(num):
  bend i = 1:
    when i < num -1 :
      if num % i == 0:
        soma = i + fork(i + 1) # fork meio q chama o bend recursivamente
      else:
        soma = 0 + fork(i + 1) 
    else:
      soma = 0

  return soma


def eh_perfeito(num):
  if num > 1:
    if soma_divisores(num) == num:
      return num
    # todo if precisa de um else
    else:
      return 0
  else:
    return 0


# meio que emulando um while
def soma_perfeitos(n):
  bend i = 0:
    when i < n:
      soma = eh_perfeito(i) + fork(i + 1) 
    else:
      soma = 0

  return soma


def main:
  return soma_perfeitos(500)
  # deve retornar 530
