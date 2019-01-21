# Bootcamp Concrete Team1 - SP

---

![Gif](assets/Logo-animado-1.gif)

## Bem vindo

---

Agradeço por poder participar do Recruiting Day da Concrete. Foi uma honra conhecer várias pessoas talentosas nas suas várias áreas de atuação e conhecimento.

## Desafio

---

Utilizando a [API](https://docs.magicthegathering.io/) do [Magic The Gathering](https://magicthegathering.io/) foi proposto em fazer um aplicativo onde se vê cards organizado em sets e tem controle dos seus favoritos (este persistido localmente). As definições DoD do projeto estão neste [mural](https://trello.com/b/wlg4Xifo/bootcamp-project) enquanto nosso Kanban está [neste mural](https://trello.com/b/wlg4Xifo/bootcamp-project), ambos no Trello.

Este projeto foi executado utilizando arquitetura Clean, dividindo as responsabilidades de Domínio, Plataforma e Aplicação, modularizados em frameworks. Nossa camada de aplicação foi desenvolvido utilizando VIP (ViewInteractorPresenter).

** EM DESENVOLVIMENTO A PARTIR DESSE PONTO ** 

O projeto foi desenvolvido utilizando o Swift 4.2 no iOS 12.1. As APIs utilizadas foram:

- Kingfisher (gerenciamente de image-set com auto-cache)
- Quick & Nimble (testes)
- KIF (testes funcionais)

# Features incluídas ..

---

- Tela de Splash;
- [x] Layout em abas, contendo na primeira aba a tela de grid de filmes e na segunda aba a tela de lista de filmes favoritados no app;
- [x] Tela de grid de filmes trazendo a lista de filmes populares da [API](https://developers.themoviedb.org/3/movies/get-popular-movies).
- [x] Tratamento de erros e apresentação dos fluxos de exceção: Busca vazia, Error generico, loading;
- [x] Ao clicar em um filme do grid deve navegar para a tela de detalhe do filme;
- [x] Tela de Detalhe do filme deve conter ação para favoritar o filme;
- [x] Tela de Detalhe do filme deve conter gênero do filme por extenso (ex: Action, Horror, etc); Use esse [request](https://developers.themoviedb.org/3/genres/get-movie-list) da API para trazer a lista.
- [x] Tela de lista de favoritos persistido no app entre sessões;
- [x] Tela de favoritos deve permitir desfavoritar um filme.

### Ganhava mais pontos se tiver:

- [x] Tela de grid com busca local;
- [x] Scroll Infinito para fazer paginação da API de filmes populares;
- [x] Célula do Grid de filmes com informação se o filme foi favoritado no app ou não;
- [x] Tela de filtro com seleção de data de lançamento e gênero. A tela de filtro só é acessível a partir da tela de favoritos;
- [x] Ao Aplicar o filtro, retornar a tela de favoritos e fazer um filtro local usando as informações selecionadas referentes a data de lançamento e gênero;
- [x] Testes unitários no projeto;
- [ ] Testes funcionais.
- [x] Pipeline Automatizado. (Com testing, code-coderage, project cleaning e git push cycle)

### Detalhes:

- [x] Proteção de Request Spam.
- Optei por não utilizar o fastlane para CI por não ter confiança nos processos de autenticação.

# Exemplos e sugestões

---

### Fluxo com Slash e grid de filmes

![Image of Yaktocat](assets/flow/app-example-01.png)

### Fluxo com Splash, Tela de Detalhes e tela de lista da favoritos

![Image of Yaktocat](assets/flow/app-example-02.png)

### Fluxo Opcional de filtro

![Image of Yaktocat](assets/flow/app-example-03.png)

## **Submissão**

---

Sobre detalhes de instalação do aplicativo basta entrar na pasta do projeto, PhilmaXXX e seguir os passos do Readme.md. Agradeço pela atenção e tenha um bom dia.
