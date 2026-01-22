# Lexity

**Discover the world of words.**

Lexity is a Flutter-based mobile application designed for vocabulary expansion and word discovery. Leveraging a tactile, swipe-based interface, Lexity presents users with a curated "Lexicon" of rare, beautiful, and interesting words, complete with definitions, etymologies, and usage examples.

Whether you are a logophile looking to expand your vernacular or a developer exploring Flutter architecture, this project serves as a robust example of a content-rich, visual, animation-heavy & interactive mobile experience.

---

## 📱 Features

* **Swipe to Discover:** An intuitive card-stack interface allowing users to swipe through a vast collection of words.
* **Rich Word Details:** Each card provides deep insights, including:
* **Definition & Usage:** Clear meanings and sentence examples.
* **Etymology:** The history and origin of the word.
* **Pronunciation:** Guides on how to speak the word correctly.
* **Rarity Score:** Learn how unique the word is.


* **Curated Collections:** Save your favorite words to a personal "Liked" library for quick reference.
* **Dynamic Theming:** The application background adapts dynamically to the color palette of the current word card.
* **Cross-Platform:** Built for Android, iOS, and Web.

---

## 🛠 Tech Stack

Lexity is built using **Flutter** and relies heavily on **Firebase** for its backend infrastructure.

* **Frontend:** Flutter (Dart)
* **Navigation:** GoRouter
* **State Management:** Provider & Local State (`FFAppState`)
* **Backend:** Firebase
* **Firestore:** NoSQL database for storing the `lexicon` (words) and user data.
* **Authentication:** Firebase Auth (Anonymous, Email, Social).
* **Cloud Functions:** Server-side logic.


* **UI/UX:**
* `flutter_card_swiper`: For the tinder-like swipe mechanic.
* `flutter_animate`: For fluid UI transitions.
* `google_fonts`: Custom typography.
* `auto_size_text`: Responsive text sizing.



---

## 🚀 Getting Started (For Developers)

Follow these steps to set up the project locally.

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) (Version >=3.0.0 <4.0.0)
* Dart SDK
* A Firebase Project (for backend connectivity)

### Installation

1. **Clone the Repository**
```bash
git clone https://github.com/your-username/lexity.git
cd lexity

```


2. **Install Dependencies**
```bash
flutter pub get

```


3. **Firebase Configuration**
This project requires a `firebase_options.dart` file or manual configuration files (`google-services.json` / `GoogleService-Info.plist`) to connect to your Firebase instance.
* Use the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) to configure your project:
```bash
flutterfire configure

```


* Ensure your Firestore database has a collection named `lexicon`.


4. **Run the App**
```bash
flutter run

```



---

## 📂 Project Structure

The project follows a modular structure, partially influenced by FlutterFlow patterns.

```text
lib/
├── auth/                  # Firebase Authentication logic
├── backend/               # Backend connectivity (Firestore, API calls)
│   ├── schema/            # Data models (LexiconRecord, UsersRecord)
│   └── firebase/          # Firebase initialization and config
├── components/            # Reusable UI widgets (CardFront, CardBack)
├── flutter_flow/          # Utility classes, themes, and animations
├── liked/                 # "Liked Words" screen logic
├── start/                 # Main Swipe/Home screen logic
├── main.dart              # Application entry point and routing
└── index.dart             # Barrel file for easy imports

```

### Key Components

* **`LexiconRecord` (`lib/backend/schema/`):** The primary data model representing a word. Contains fields for `term`, `definition`, `colours`, `audio`, etc.
* **`StartWidget` (`lib/start/`):** The home screen. Implements the `FlutterFlowSwipeableStack` to render the deck of word cards.
* **`LikedWidget` (`lib/liked/`):** A list view displaying words the user has saved.
* **`FrontWidget` & `CardBackWidget`:** Define the UI for the front (visuals/term) and back (details/definition) of the flashcards.

---

## 📄 License

This project is intended for private use. See `pubspec.yaml`:

```yaml
publish_to: 'none'

```

---

## 🤝 Contributing

Contributions are welcome! If you find a bug or want to add a new feature:

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.
