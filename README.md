# 🥂 Stirred Souls

> *"Every cocktail tells a story — of spirits stirred, feelings infused, and moments remembered."*

**Stirred Souls** is a personal cocktail journaling app designed to record every drink, every note, and every gentle emotion behind the glass.

Built with 💛 by [CorneliaMo](https://github.com/CorneliaMo), this project is both a cozy digital diary and a tech playground, combining a Flutter front-end with a Spring Boot + SQLite back-end.

---

## 🍹 Features (MVP)

- Record cocktails with:
    - Name
    - Base spirits (multi-select)
    - Custom ingredients
    - Flavor notes
    - Mood / atmosphere
    - Optional photo
- Browse drink history
- Mark favorites
- Search by ingredients / spirit
- (Upcoming) Cocktail stats & charts

---

## 🏗️ Tech Stack

### 🌸 Frontend
- Flutter (Dart)
- Runs on both Android and iOS
- iOS built via GitHub Actions `macos-latest` runners

### 🌱 Backend
- Spring Boot (Java)
- SQLite for lightweight local storage
- RESTful APIs for the Flutter frontend to consume

---

## ⚙️ Getting Started

### 🔧 Backend (Spring Boot + SQLite)

```bash
# Clone repo
git clone https://github.com/CorneliaMo/stirred-souls.git

# Run with Maven
./gradlew spring-boot:run
