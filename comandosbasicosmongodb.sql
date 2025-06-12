// Lista todos os bancos de dados
show dbs

// Muda o contexto para o banco de dados "ifsp"
use ifsp

// Mostra o nome do banco de dados atual
db

// Declara uma variável "contato" com um objeto JSON
var contato = {"nome" : "LAIS GABRIELE", "email" : "g.lais@aluno.ifsp.edu.br"}

// Insere o objeto da variável "contato" na coleção "contatos"
db.contatos.insertOne(contato)

// Mostra novamente os bancos de dados (agora com o "ifsp" maior)
show dbs

// Lista as coleções dentro do banco de dados "ifsp"
show collections

// Busca e exibe todos os documentos da coleção "contatos"
db.contatos.find()

// Busca e exibe apenas o primeiro documento da coleção
db.contatos.findOne()

// Cria uma variável "criterio" para usar como filtro de busca
var criterio = {"email" : "fabiano.teixeira@ifsp.edu.br"}

// Busca documentos usando o filtro da variável (retorna um cursor)
var contato = db.contatos.find(criterio)

// Exibe o conteúdo da variável (neste caso, o cursor da busca)
contato

// Cria um critério de busca por nome que não diferencia maiúsculas/minúsculas
var criterio = {"nome" : /fab/i}

// Conta e retorna o número total de documentos na coleção
db.contatos.countDocuments()

// Conta quantos documentos atendem ao critério de busca
db.contatos.countDocuments(criterio)

// Busca documentos que atendam a uma de duas condições (operador OU)
db.contatos.find({"$or" : [{"email" : "fabiano.teixeira@ifsp.edu.br"},{"nome" : "Melissa Teixeira"}]})

// Busca todos os documentos, mas exibe apenas o campo "nome"
db.contatos.find({}, {"nome" : 1})

// Busca todos, exibe o campo "nome" e oculta o campo "_id"
db.contatos.find({}, {"nome" : 1, _id : 0})

// Remove o documento que corresponde ao email fornecido (método antigo)
db.contatos.remove({"email" : "fabiano.teixeira@ifsp.edu.br"})

// Busca e armazena o documento 'lais gabriele" na variável "contato"
var contato = db.contatos.findOne({"nome" : "LAIS GABRIELE"})

// Altera o valor do campo "nome" apenas na variável "contato" (em memória)
contato.nome = "Lais Gabriele Silva"

// Atualiza o documento de "LAIS GABRIELE", alterando seu nome para "LAIS SILVA"
db.contatos.update({"nome": "LAIS GABRIELE"}, {"$set":{"nome": "LAIS SILVA"}})

// Busca e exibe o documento recém-alterado para confirmar a mudança
db.contatos.findOne({"nome" : "LAIS SILVA"})
