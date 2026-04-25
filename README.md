<div align="center">

```
 ████████╗██╗ ██████╗    ████████╗ █████╗  ██████╗    ████████╗ ██████╗ ███████╗
    ██╔══╝██║██╔════╝       ██╔══╝██╔══██╗██╔════╝       ██╔══╝██╔═══██╗██╔════╝
    ██║   ██║██║            ██║   ███████║██║            ██║   ██║   ██║█████╗
    ██║   ██║██║            ██║   ██╔══██║██║            ██║   ██║   ██║██╔══╝
    ██║   ██║╚██████╗       ██║   ██║  ██║╚██████╗       ██║   ╚██████╔╝███████╗
    ╚═╝   ╚═╝ ╚═════╝       ╚═╝   ╚═╝  ╚═╝ ╚═════╝       ╚═╝    ╚═════╝ ╚══════╝

              Tic Tac Toe — Flutter · BLoC · Clean Architecture · AI Opponent
```

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=flat-square&logo=dart&logoColor=white)](https://dart.dev/)
[![BLoC](https://img.shields.io/badge/Pattern-BLoC-6C4DE6?style=flat-square)](https://bloclibrary.dev/)
[![Architecture](https://img.shields.io/badge/Architecture-Clean-brightgreen?style=flat-square)]()
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-lightgrey?style=flat-square)]()
[![Status](https://img.shields.io/badge/Status-In_Progress-orange?style=flat-square)]()

**A cross-platform Tic Tac Toe game where you go up against an AI opponent — built on Flutter with BLoC state management and Clean Architecture.**

</div>

---

## What it is

This is a **mobile-first Tic Tac Toe app** where the player faces off against an automated opponent. The game logic is fully deterministic, the UI is reactive and decoupled, and the codebase is structured to scale — not just to ship.

The project is **functional and in active development**. Core gameplay works end-to-end: moves, win detection, AI response, and game reset. More features are being layered on top of a solid architectural foundation.

---

## Game Flow

```
        Player Taps Cell
               │
               ▼
     ┌─────────────────────┐
     │   Cell Already      │
     │   Occupied?         │
     └─────────────────────┘
               │
         ┌─────┴─────┐
        YES           NO
         │             │
         ▼             ▼
      IGNORE     Register Move (X)
                       │
                       ▼
              ┌──────────────────┐
              │  Win / Draw      │
              │  Condition Met?  │
              └──────────────────┘
                       │
                ┌──────┴──────┐
               YES             NO
                │               │
                ▼               ▼
          GAME OVER        AI Calculates
          🏆 / 🤝          Best Move (O)
                                │
                                ▼
                         Register Move
                                │
                                ▼
                       ┌─────────────────┐
                       │ Win / Draw Check │
                       └─────────────────┘
                                │
                         ┌──────┴──────┐
                        YES             NO
                         │               │
                         ▼               ▼
                    GAME OVER      Back to Player ↩
```

---

## Tech Stack

| Layer | Technology | Why |
|---|---|---|
| **Language** | Dart 3.x | Strong typing, null safety, async-first — built for reactive UIs |
| **Framework** | Flutter 3.x | Single codebase → Android, iOS, Web, Desktop |
| **State Management** | flutter_bloc | Predictable, testable, event-driven state — no setState spaghetti |
| **Architecture** | Clean Architecture | Domain, Data, Presentation layers fully decoupled |

---

## Architecture

This project enforces **Clean Architecture** from the ground up — the same structure used in production-grade Flutter apps at scale.

```
lib/
├── core/                     # Shared utils, constants, error types
├── features/
│   └── game/
│       ├── domain/           # Entities, Use Cases, Repository contracts
│       │   ├── entities/     # GameBoard, Player, Move — pure Dart, zero deps
│       │   ├── usecases/     # MakeMove, CheckWinner, ResetGame
│       │   └── repositories/ # Abstract contracts (interfaces)
│       ├── data/             # Concrete implementations
│       │   ├── models/       # Data models (JSON-ready for future persistence)
│       │   └── repositories/ # GameRepository impl — AI logic lives here
│       └── presentation/     # BLoC + UI
│           ├── bloc/         # GameBloc, GameEvent, GameState
│           └── pages/        # GamePage, widgets
└── main.dart
```

**Three hard rules:**
- `domain/` has **zero Flutter imports** — it's pure Dart
- `presentation/` never touches raw data — only talks to Use Cases
- BLoC never knows what the UI looks like — it only emits state

---

## BLoC State Machine

```
          ┌─────────────────────────────────────┐
          │            GameBloc                 │
          │                                     │
  Events  │  GameStarted  ──→  GameInitial      │
  ──────▶ │  CellTapped   ──→  GameInProgress   │  ──▶  State emitted to UI
          │  GameReset    ──→  GameInitial       │
          │  (AI move)    ──→  GameInProgress    │
          │               ──→  GameOver          │
          └─────────────────────────────────────┘
```

Every state transition is **explicit, traceable, and reproducible** — no hidden mutations, no ambient state.

---

## AI Opponent

The AI opponent evaluates the board and responds to every player move. The decision logic is fully encapsulated in the data layer, keeping the domain and presentation layers completely AI-agnostic.

> More sophisticated AI strategies (Minimax, alpha-beta pruning) are planned for upcoming iterations.

---

## Getting Started

**Prerequisites**

- Flutter SDK 3.x+
- Dart 3.x+
- Android Studio / VS Code with Flutter extension

**Run**

```bash
git clone https://github.com/Andrius-Anselmi/tictactoe_app.git
cd tictactoe_app
flutter pub get
flutter run
```

**Supported platforms**

```
✅ Android
✅ iOS
✅ Web
✅ Linux / macOS / Windows
```

---

## Key Engineering Decisions

**Why BLoC over Provider or Riverpod?**
BLoC enforces a strict separation between business logic and UI. Events are explicit, states are immutable, and the entire flow is traceable — which matters more than convenience when the codebase grows.

**Why Clean Architecture for a game?**
The point isn't complexity for its own sake — it's about building the habit. Decoupled layers mean the AI logic, game rules, and UI can evolve independently. Swapping from a simple AI to Minimax shouldn't touch a single widget.

**Why Dart entities with zero Flutter imports in domain?**
The domain layer represents what the app *is* — not how it renders. Keeping it Flutter-free makes it universally testable and theoretically portable to any Dart-based runtime.

---

## Roadmap

- [x] Core gameplay — player vs AI
- [x] Win and draw detection
- [x] Game reset
- [ ] Minimax AI (optimal play)
- [ ] Difficulty levels (Easy / Medium / Hard)
- [ ] Score tracking across sessions
- [ ] Animations & sound effects
- [ ] Unit tests for Use Cases and BLoC

---

## License

MIT — see [LICENSE](LICENSE).

---

<div align="center">

Work in progress. Architecture-first. Shipped when it's right.

</div>
