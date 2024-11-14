# soma em tree-like pra aumentar a paralizacao
soma_divisores from to num =
  if (< from to) {
    (+ 
      (soma_divisores from (/ (+ from to) 2) num)
      (soma_divisores (+ 1 (/ (+ from to) 2)) to num))
  } else {
    #{
    # pq nao funciona?
    match (% num from) {
      0: from
      _: 0
    }
    #}
    if (== 0 (% num from)){
      from
    } else {
      0
    }
  }

eh_perfeito 0 = 0
eh_perfeito 1 = 0
eh_perfeito num = 
  if (== num (soma_divisores 1 (- num 1) num)){
    num
  }else {
    0
  }

soma_perfeitos from to =
  if (< from to) {
    (+ 
      (soma_perfeitos from (/ (+ from to) 2))
      (soma_perfeitos (+ 1 (/ (+ from to) 2)) to))
  } else {
    (eh_perfeito from)
  }

def main:
  return soma_perfeitos(0,500)
  # deve retornar 530
