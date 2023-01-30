# Resumo da aplicação 

 A biblioteca desenvolvida auxilia desenvolvedores a explorar os dados com funções essenciais para a identificação de outliers e anomalias e uma interface que auxilia a visualizar as informações de acordo com o arquivo de configuração.

 A biblioteca recebe um arquivo yaml com as configurações de cada etapa do pipeline de dados, e do endereço do banco de dados.
 Após a execução do banco de dados, o banco de dados de dados é atualizado com os resultados da análise e os resultados podem ser visualizados por meio de dashboards no metabase.

## Links gerais:

[Pacote PyPI](https://pypi.org/project/170051277-trab-final-gces/)

[Metabase](http://localhost:3000/)


## Como Executar:

Execute o seguinte comando na pasta raiz do projeto:

```docker-compose up --build -d```

Ao subir com sucesso, vá até o [link](http://localhost:3000/) do Metabase e insira os dados presentes do ```docker-compose.yml``` (usuário: admin e senha: password) para entrar.

Prossiga fazendo a configuração com seus dados até chegar à seguinte tela:

![assaas](/assets_readme/tutorial_metabase_4.png)

Aqui, selecione PostgeSQL, o que levará para a tela de credenciais.

Ao executar a sequência de comandos abaixo, colete o número do host na chave "Gateway":

![assaas](/assets_readme/tutorial_metabase_5.png)

Faça a configuração final somente alterando o campo "host" com o dado coletado anteriormente:

![assaas](/assets_readme/tutorial_metabase_6.png)

## Conteinerização do Banco

O SGBD PostgreSQL foi dockerizado como um serviço de nome ``db`` utilizando o arquivo ```docker-compose.yml```. 

Para permitir o acesso externo via IDE e o armazenamento dos arquivos, a porta 3000 foi exposta e um volume que mapeia a pasta ```dbdata``` padrão 
para ```gces_170051277/postgresql/data:``` foi criado. 
O mapemanento objetivou evitar conflitos com outos contêineres e, para tal, utilizou a matrícula do aluno como espécie de "hash".

## Conteinerização da aplicação

A aplicação em python foi dockerizada utilizando o arquivo ```Dockerfile```.

Dentro do contêiner o projeto está armazenado na pasta ```py_gces``` e, para trabalhar com ela 
de maneira apropriada, foi necessário incluí-la na variável de ambiente ```PYTHONPATH```.

Após isso, todas as pastas e pacotes necessários foram copiados para dentro do contêiner e, em seguida, o gerenciador de dependências
"poetry" e as dependências do projeto foram instalados.

Por fim, visando testar se não há problemas no arquivo, a compilação foi executada.

## Gestão de dependências e pacotes python

O poetry é a ferramenta utilizada para manejar as dependências do projeto e a sua configuração, junto com a lista de dependências, consta no arquivo ```pyproject.toml```.

##  Integração Contínua (CI)

Aqui, o objetivo é validar o código enviado para as branchs do repositório, realizando testes e o processo de build.
Ambas as operações constam nos passos "Installation (Poetry/Dependencies)" e "Tests (Pytest)" presentes no arquivo ```/.github/build.yml```

##  Entrega Contínua (CI)

Uma vez que o teste e a compilação do código tenham sido bem-sucedidos, o envio é feito para o PyPI através do passo "Build and publish to PyPI",
as informações presentes no ```pyproject.toml``` (nome do pacote, responsável, repositório etc) são dispostas e por fim há a publicação do pacote.



