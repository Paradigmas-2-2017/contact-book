# Sobre o projeto

O presente projeto é um "command line system" que implementa uma agenda de contatos através da linguagem de programação puramente funcional Haskell. Para a implementação do sistema, utilizou-se da árvore binária como estrutura de dados principal, tornando-se possível fazer de forma eficiente, por exemplo, a exibição de todos os contatos em ordem alfabética.

## Dependências

- GHC, The Glorious Glasgow Haskell Compilation System, version 8.0.2
- cabal-install (Cabal é um sistema para "building" e "packaging" de bibliotecas e programas Haskell, e, nesse caso específico, foi utilizado para instalar o pacote que será citado logo em seguida), version 1.24.0.2
- ansi-terminal (ANSI terminal inclui alguns recursos adicionais para o Haskell, tais qual: permite a movimentação do cursor, limpeza de tela, saída de cores, mostrar ou esconder o cursor, alterar o título do terminal etc), version 0.7

## Iniciando o sistema

Para rodar o sistema localmente, levando em consideração a utilização de sistemas operacionais baseados em UNIX, com Git e com as demais dependências instaladas, deve-se realizar o seguinte procedimento:

1. Clonar o repositório:

username ~/workspace $ git clone https://github.com/Paradigmas-2-2017/contact-book.git

Cloning into 'contact-book'...

2. Entrar no diretório:

username ~/workspace $ cd contact-book/

username ~/workspace/contact-book $ 

3. Criar o diretório "database":

username ~/workspace/contact-book $ mkdir database

username ~/workspace/contact-book $ ls

database  LICENSE  README.md  system

4. Entrar no diretório "/system":

username ~/workspace/contact-book $ cd system/

username ~/workspace/contact-book/system $ 

5. Iniciar o GHCi, ambiente interativo do GHC:

username ~/workspace/contact-book/system $ ghci

GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help

Prelude> 

6. Carregar o módulo principal do sistema:

Prelude> :load Main.hs

[1 of 5] Compiling ModelData        ( ModelData.hs, interpreted )

[2 of 5] Compiling File             ( File.hs, interpreted )

[3 of 5] Compiling Crud             ( Crud.hs, interpreted )

[4 of 5] Compiling Menu             ( Menu.hs, interpreted )

[5 of 5] Compiling Main             ( Main.hs, interpreted )

Ok, modules loaded: Crud, File, Main, Menu, ModelData.

*Main> 

7. Iniciar o sistema executando a função principal:

*Main> main
