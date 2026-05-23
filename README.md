# Cálculo Numérico 

Repositório dedicado à implementação e estudo de algoritmos de Cálculo Numérico. Este projeto reúne métodos matemáticos para resolução de problemas que não possuem solução analítica simples.

---

## Tecnologias e Ferramentas
* **Linguagens:** Scilab (`.sce`, `.sci`), Matlab (`.m`)
* **Livro Base:** *Tópicos de Métodos Numéricos com Scilab*


---

## Métodos Implementados

### 1- Zero de Funções (Raízes)
* **Iterativo Linear (Ponto Fixo):** Transforma $f(x) = 0$ em $x = g(x)$ para encontrar o ponto de convergência.
* **Bisseção:** Método intervalar robusto que divide o intervalo ao meio sucessivamente.
* **Newton-Raphson:** Método de convergência rápida que utiliza a derivada da função.
* **Secante:** Alternativa ao método de Newton que substitui a derivada por uma aproximação finita.

### 2- Sistemas 
* **Lineares:** Resolução de sistemas $Ax = b$ por métodos diretos (como Eliminação de Gauss)
* **Não Lineares:** Resolução de conjuntos de equações não lineares simultâneas
  
### 3- Regressão
* **Polinomial:** Ajuste de dados através de polinômios de grau $n$ usando sistemas lineares.
* **Logarítmica:** Linearização de dados que seguem um comportamento de crescimento atenuado.
* **Exponencial:** Modelo ideal para fenômenos de crescimento ou decaimento acelerado.
* **Senoidal:** Ajuste para dados periódicos ou cíclicos através de funções trigonométricas.
* **Racional:** Modelagem por razões de polinômios para capturar assíntotas.
  
### 4- Interpolação
* **Newton:** Usa diferenças divididas para construir o polinômio interpolador de forma eficiente.
* **Lagrange:** Construção direta do polinômio sem a necessidade de sistemas lineares intermédiarios.


### 5- Integração Numérica
* **Regra de Simpson (1/3 e 3/8):** Aproximação de áreas sob curvas.
* **Mínimos Quadrados:** Ajuste de curvas para dados experimentais.

---

## Como Usar

### 1. Clonar o projeto
Abra o seu terminal e execute:
```bash
git clone https://github.com
cd calculo-numerico
```

### 2. Executar no Scilab
1. Abra o **Scilab**.
2. No console ou no editor (SciNotes), navegue até a pasta do projeto.
3. Use o comando `exec` para carregar e rodar o script desejado:
   ```scilab
   exec('caminho/para/o/script.sce', -1)
   ```

### 3. Executar no Matlab
1. Abra o **Matlab**.
2. Defina a pasta deste repositório como a sua *Current Folder* (Pasta Atual).
3. Execute o script pelo terminal do Matlab digitando apenas o nome do arquivo (sem a extensão `.m`):
   ```matlab
   nome_do_metodo
   ```

---


## Autor
Desenvolvido por **Gabriel Silveira** 
* **E-mail:** ciscocarvalhoss@gmail.com
* **GitHub:** [@Fratis35](https://github.com)

---
*Este projeto foi criado para fins acadêmicos e de estudo pessoal.*
