# Arquiteturas

O objetivo desse repositório é a compreensão e entendimento de multiplas arquiteturas no desevolvimento de aplicações iOS.

### Arquiteturas usadas

- MVVM 
- MVC 
- MVP 

### Links

- https://medium.com/flawless-app-stories/the-best-architecture-for-ios-app-does-it-even-exist-3af357ac62e7

## MVVM

### Links
- https://medium.com/flawless-app-stories/mvvm-in-ios-swift-aa1448a66fb4
- https://www.toptal.com/ios/swift-tutorial-introduction-to-mvvm

### Como funciona?

É divido em 3 partes:
- Model
- View (ViewController + View)
- ViewModel

#### Model

- Responsável pelos dados

#### ViewModel

- Responsável por injetar e modificar a View, contem as regras de negócio, e pode ser responsável também pelas requests, mas é opcional.

#### View

- Responsável pelos elementos de ui. A ViewController pode ser responsável pelas requests, mas é opcional.


### Estrutura no projeto

![imagem](./Sources/mvvm.png)

## MVC

### Links
- https://www.raywenderlich.com/1000705-model-view-controller-mvc-in-ios-a-modern-approach

### Como funciona?

É divido em 3 partes:
- Model
- View
- ViewController

#### Model

- Responsável pelos dados

#### ViewController

- Responsável por injetar e modificar a View, contem as regras de negócio, e é responsável também pelas requests.

#### View

- Responsável pelos elementos de ui


### Estrutura no projeto

![imagem](./Sources/mvc.png)

## MVP

### Links
- https://movile.blog/swiftui-e-arquiteturas-mvp/
- https://saad-eloulladi.medium.com/ios-swift-mvp-architecture-pattern-a2b0c2d310a3

### Como funciona?

É divido em 3 partes:
- Model
- View (ViewController + View)
- Presenter

#### Model

- Responsável pelos dados

#### Presenter

- Responsável por injetar e modificar a View, contem as regras de negócio, e é responsável também pelas requests.

#### View

- Responsável pelos elementos de ui


### Estrutura no projeto

![imagem](./Sources/mvp.png)

