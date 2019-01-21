# Bootcamp Concrete Team1 - SP

---

![Gif](assets/Logo-animado-1.gif)

## Desafio

---

Utilizando a [API](https://docs.magicthegathering.io/) do [Magic The Gathering](https://magicthegathering.io/) foi proposto em fazer um aplicativo onde se vê cards organizado em sets e tem controle dos seus favoritos (este persistido localmente). As definições DoD do projeto estão neste [mural](https://trello.com/b/wlg4Xifo/bootcamp-project) enquanto nosso Kanban está [neste mural](https://trello.com/b/wlg4Xifo/bootcamp-project), ambos no Trello.

Este projeto foi executado utilizando arquitetura Clean, dividindo as responsabilidades de Domínio, Plataforma e Aplicação, modularizados em frameworks. Nossa camada de aplicação foi desenvolvido utilizando VIP (ViewInteractorPresenter).

# Features 

---

- Tela de Splash;
- Layout em abas, contendo na primeira aba a tela de grid de cartas  e na segunda aba a tela de lista de cards favoritados no app; ambas abas devem ser vistas de maneira idêntica: set > subset cardtype > card;
- A grid de cartas aloca outros sets de acordo com uma regra de scroll.
- Tratamento de erros e apresentação dos fluxos de exceção: Busca vazia, Error generico, loading;
- Ao clicar em um card, deve navegar para a tela de Detalhe da carta;
- Tela de Detalhe do card deve conter ação para favoritar/defavoritar o card, e deve ser possível navegar pelo subset da mesma.
- Cards favoritos devem ser persistidos localmente;
- Testes unitários no domínio e nas plataformas.
- Testes funcionais na aplicação.

## App Preview

---

### Placeholder para 

![Image of Yaktocat]()

## Construído com

* [Realm](https://github.com/Quick) - Banco de Dados 
* [Quick/Nimble](https://github.com/Quick) - Testes unitários
* [Nimble Snapshots](https://github.com/Moya/Moya) - Extensão do Nimble para trabalhar com Snapshots
* [Kingfisher](https://github.com/onevcat/Kingfisher/) - Gerenciamento de image-set com cache-ing automático
* [Moya](https://github.com/Moya/Moya) - Camada de conexão abstrata baseada no Alamofire
* [Snapkit](https://github.com/Moya/Moya) - Syntaxsugar para Constraints


## Autores

* **Guilherme Guimarães** - [cs-g-guimaraes](https://github.com/cs-g-guimaraes)
* **Miguel Nery** - [cs-miguel-nery](https://github.com/cs-miguel-nery)
* **Nicholas Babo** - [cs-nicholas-babo](https://github.com/cs-nicholas-babo)
* **Ricardo Souza Rachaus** - [cs-ricardo-rachaus](https://github.com/cs-ricardo-rachaus)

## License

Este projeto é licenciado dentro da licença MIT - Para ver detalhes vá ao arquivo [LICENSE.md](https://github.com/angular/angular.js/blob/master/LICENSE).
