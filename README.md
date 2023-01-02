# Boas vindas ao repositório Flutter Movie!

- Nesse projeto foi desenvolvido uma aplicação mobile que é responsável por listar os filmes em exibição, exibir seus detalhes e permitir salvar filmes favoritos.

---

## 🛠 Tecnologias

Esse projeto foi desenvolvido utilizando:

* [Flutter](https://flutter.dev/)
* [Provider](https://pub.dev/packages/provider/)
* [sqflite](https://pub.dev/packages/sqflite/)
* [Nock](https://pub.dev/packages/nock)

Versões utilizadas no desenvolvimento:

* Flutter 3.3.10 • channel stable
* Dart 2.18.6 • DevTools 2.15.0

---

## 📋 Execução

ATENÇÃO: Se você ainda não possui o flutter instalado e configurado, acesse o [site oficial](https://docs.flutter.dev/get-started/install), e siga as instruções da documentação.

Antes de executar o projeto, você precisa ter instalado a seguinte ferramenta:

* O sistema de controle de versões [Git](https://git-scm.com).

Com o sistema configurado, siga as instruções abaixo:

```bash
# Clonar o repositório
git clone https://github.com/pimentajr/flutter_movies.git

# Entrar no diretório
cd flutter_movies

# Baixar as dependências
flutter pub get

# Executar testes
flutter test

Observação: Para rodar os testes antes do build no emulador, é necessário rodar o comando 'flutter build apk', caso contrário, poderá apresentar erros ao encontrar os arquivos do AppLocalizations.

# Executar projeto
Execute o projeto em um emulador Android ou iOS.
```