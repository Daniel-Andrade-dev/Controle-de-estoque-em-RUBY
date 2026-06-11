# Controle de estoque simples em RUBY


# Array para cadastrar os produtos
estoque = []

def cadastrar_produto(estoque, produto, preco, quantidade, ativo)
  if produto.strip.empty?
    puts "Não deixe campos vazios"
  elsif preco <= 0 || quantidade <= 0
    puts "Valores negativos não são permitidos"
  elsif ativo > 1 || ativo < 0
    puts "Apenas 0 e 1"
  else
    estoque << {
      nome_produto: produto,
      preco_produto: preco,
      quantidade_estoque: quantidade,
      produto_ativo: ativo
    }
    puts "Produto cadastrado"
  end
end

# Mostra os produtos que estão cadastrados no estoque
def mostrar_estoque(estoque)
  if estoque.empty?
    puts "Não a produtos cadastrados"
  end
  produtos_estoque = estoque.select do |produto|
    puts "Produto: #{produto[:nome_produto]}"
    puts "Preço: R$#{produto[:preco_produto]}"
    puts "Quantidade: #{produto[:quantidade_estoque]}"
    if produto[:produto_ativo] == 1
      puts "Ativo"
    else
      puts "Inativo"
    end
  end
end


# Busca no estoque o produto de acordo com o nome que o usuário digitou
def buscar_produto(estoque, nome)
  buscar_produto_nome = estoque.find do |produto|
    produto[:nome_produto] == nome # Verifica se o nome existe no estoque
  end
  if buscar_produto_nome
    puts "Produto: #{buscar_produto_nome[:nome_produto]}"
    puts "Preço: #{buscar_produto_nome[:preco_produto]}"
    puts "Quantidade: #{buscar_produto_nome[:quantidade_estoque]}"
    if buscar_produto_nome[:produto_ativo] == 1
      puts "Ativo"
    else
      puts "Inativo"
    end
  else
    puts "Produto não encontrado"
  end
end


# Metodo apenas para verificar se o produto existe
# Usado para verificar e atualizar no metodo atualizar produto
def verificar_produto(estoque, nome)
  buscar_produto_nome = estoque.find do |produto|
    produto[:nome_produto] == nome # Verifica se o nome existe no estoque
  end
end

def atualizar_produto(estoque, nome, novo_nome, novo_preco, nova_quantidade, ativo)
  if novo_nome.strip.empty?
    puts "Não deixe campos vazios"
  elsif novo_preco <= 0 || nova_quantidade <= 0
    puts "Valores negativos não são permitidos"
  elsif ativo > 1 || ativo < 0
    puts "Apenas 0 e 1"
  else
    buscar_produto = estoque.find do |produto|
      if produto[:nome_produto] == nome
        produto[:nome_produto] = novo_nome
        produto[:preco] = novo_preco
        produto[:quantidade_estoque] = nova_quantidade
        produto[:produto_ativo] = ativo 
        puts "Produto atualizado"
      end
    end
  end
end


def deletar_produto(estoque, nome)
  deletar = estoque.find do |produto|
    produto[:nome_produto] == nome
  end

  if deletar
    estoque.delete(deletar)
    puts "Produto deletado: #{nome}"
  else
    puts "Produto não encontrado"
  end
end

def faturamento_total_estoque(estoque)
  soma = 0 
  estoque.each do |produto|
    soma += produto[:preco_produto] * produto[:quantidade_estoque]
  end
  puts "Faturamento total do estoque: R$%.2f" %soma
end

def produtos_caros_cadastrados(estoque)
  if estoque.empty?
    puts "Não há produtos cadastrados"
  else
    produtos = estoque.max_by do |produto|
      produto[:preco_produto]
    end
  end
end

def produtos_baratos_cadastrados(estoque)
  if estoque.empty?
    puts "Não há produtos cadastrados"
  else
    produto = estoque.min_by do |produto|
      produto[:preco_produto]
    end
  end
end


def menu()
  puts "==== CONTROLE DE ESTOQUE ===="
  puts "1 - Cadastrar produto"
  puts "2 - Mostrar estoque"
  puts "3 - Buscar produto"
  puts "4 - Atualizar produto"
  puts "5 - Deletar produto"
  puts "6 - Ver produto mais baratos"
  puts "7 - Ver produtos mais caros"
  puts "8 - Ver faturamento total do estoque"
  puts "0 - Sair"
end



def main(estoque)
  loop do
    menu()

    print "Informe a opção que deseja: "
    opc = gets.chomp.to_i

    case opc
    when 1
      print "Digite o nome do produto: "
      produto = gets.chomp
      print "Digite o preço do produto: "
      preco = gets.chomp.to_f
      print "Digite a quantidade que deseja cadastra: "
      quantidade = gets.chomp.to_i
      print "Produto ativo = 1 inativo = 0: "
      ativo = gets.chomp.to_i
      cadastrar_produto(estoque, produto, preco, quantidade, ativo)
    when 2
      mostrar_estoque(estoque)
    when 3
      print "Digite o nome do produto que deseja buscar: "
      nome = gets.chomp
      buscar_produto(estoque, nome)
    when 4
      print "Digite o nome do produto que deseja atualizar: "
      nome = gets.chomp
      buscar = verificar_produto(estoque, nome)

      if buscar
        print "Digite o nome atualizado: "
        novo_nome = gets.chomp
        print "Digite o novo preço: "
        novo_preco = gets.chomp.to_f
        print "Digite a nova quantidade: "
        nova_quantidade = gets.chomp.to_i
        print "Produto ativo = 1 inativo = 0: "
        ativo = gets.chomp.to_i
        atualizar_produto(estoque, nome, novo_nome, novo_preco, nova_quantidade, ativo)
      else
        puts "Produto não encontrado"
      end
    when 5
      print "Digite o nome do produto que deseja deletar: "
      nome = gets.chomp
      deletar_produto(estoque, nome)
    when 6
      puts produtos_baratos_cadastrados(estoque)
    when 7
      puts produtos_caros_cadastrados(estoque)
    when 8
      faturamento_total_estoque(estoque)
    when 0
      puts "Encerrando sistema....."
      break
    else
      puts "Opção inválida"
    end
  end
end


main(estoque)