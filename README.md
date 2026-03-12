# 🎮 Tic Tac Toe App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![BLoC](https://img.shields.io/badge/BLoC-Pattern-blueviolet?style=for-the-badge)
![Clean Architecture](https://img.shields.io/badge/Clean-Architecture-green?style=for-the-badge)
![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-lightgrey?style=for-the-badge)

> Um app de Jogo da Velha multiplataforma construído com Flutter, seguindo os princípios de BLoC e Clean Architecture.

---

## 📋 Sobre o Projeto

Este projeto é um **Jogo da Velha (Tic Tac Toe)** desenvolvido com Flutter, utilizando boas práticas de arquitetura de software. O objetivo é demonstrar a aplicação do padrão **BLoC** para gerenciamento de estado e os princípios de **Clean Architecture** para organização do código.

---

## 🏗️ Arquitetura

O projeto segue a **Clean Architecture**, dividida em três camadas principais:

```
lib/
├── data/          # Fontes de dados, repositórios e modelos
├── domain/        # Entidades, casos de uso e interfaces
└── presentation/  # UI, widgets e BLoCs
```

- **BLoC (Business Logic Component)** — gerenciamento de estado reativo e separado da UI
- **Clean Architecture** — separação de responsabilidades em camadas bem definidas

---

## 📱 Plataformas Suportadas

| Plataforma | Suporte |
|------------|---------|
| Android    | ✅       |
| iOS        | ✅       |
| Web        | ✅       |
| Windows    | ✅       |
| Linux      | ✅       |
| macOS      | ✅       |

---

## 🚀 Como Rodar o Projeto

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
- Dart SDK (já incluso no Flutter)
- Um emulador ou dispositivo físico conectado

### Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/Andrius-Anselmi/tictactoe_app.git
   cd tictactoe_app
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Rode o aplicativo:
   ```bash
   flutter run
   ```

### Rodando para uma plataforma específica

```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome

# Windows
flutter run -d windows

# Linux
flutter run -d linux

# macOS
flutter run -d macos
```

---

## 🧪 Testes

Para rodar os testes:

```bash
flutter test
```

---

## 🛠️ Tecnologias Utilizadas

- **Flutter** — framework de UI multiplataforma
- **Dart** — linguagem de programação
- **flutter_bloc** — gerenciamento de estado com o padrão BLoC
- **Clean Architecture** — separação em camadas (data, domain, presentation)

---

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 👤 Autor

**Andrius Anselmi**

- GitHub: [@Andrius-Anselmi](https://github.com/Andrius-Anselmi)
