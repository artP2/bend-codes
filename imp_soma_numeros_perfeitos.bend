# meio emulando um while
# TODO tentar do jeito mais "paralelo"
def soma_divisores(from, to, num):
  bend i = from:
    when i < to:
      if num % i == 0:
        soma = i + fork(i + 1) 
      else:
        soma = 0 + fork(i + 1) 
    else:
      soma = 0

  return soma

def eh_perfeito(num):
  if num > 1:
    if soma_divisores(1, num -1, num) == num:
      return num
    # todo if precisa de um else
    else:
      return 0
  else:
    return 0

# meio emulando um while
# TODO tentar do jeito mais "paralelo"
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
