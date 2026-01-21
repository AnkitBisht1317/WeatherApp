#  Weather App (Flutter + BLoC)

A **professional Flutter Weather Application** built using **BLoC state management**, **Clean Architecture principles**, and **OpenWeather API**. The app fetches real-time weather data and displays current conditions along with an hourly forecast.

---

##  Features

* Fetch real-time weather data by city
* Hourly weather forecast
* BLoC state management (Event → State)
* Clean Architecture (Data Provider → Repository → BLoC → UI)
* Secure API key handling using `.env`
* Modern Material UI
* Pull-to-refresh weather data

---

##  Tech Stack

* **Flutter** (UI)
* **flutter_bloc** (State Management)
* **HTTP** (API calls)
* **OpenWeather API** (Weather data)
* **flutter_dotenv** (Environment variables)

---

## Project Structure

```
lib/
├── bloc/
│   ├── weather_bloc.dart
│   ├── weather_event.dart
│   └── weather_state.dart
│
├── data/
│   ├── data_provider/
│   │   └── weather_data_provider.dart
│   ├── models/
│   │   └── weather_model.dart
│   └── repository/
│       └── weather_repository.dart
│
├── presentation/
│   ├── screen/
│   │   └── weather_screen.dart
│   └── widgets/
│       ├── additional_information.dart
│       └── hourly_forecast_item.dart
│
├── main.dart
└── .env (NOT pushed to GitHub)
```

---

## Environment Variables (.env)

> **Important:** The `.env` file is **NOT included in GitHub** for security reasons.

### Create a `.env` file in the root directory
```
OPEN_WEATHER_API_KEY=your_api_key_here
BASE_URL=https://api.openweathermap.org/data/2.5
```

### Add `.env` to `.gitignore`

```
.env
```

---

## How to Get OpenWeather API Key

1. Visit  [https://openweathermap.org/api](https://openweathermap.org/api)
2. Create a free account or log in
3. Go to **API Keys** section
4. Copy your API key
5. Paste it inside the `.env` file


---

## 🧠 Architecture Overview

```
UI → Bloc → Repository → Data Provider → API
```

* **UI** sends events to Bloc
* **Bloc** handles business logic
* **Repository** processes data
* **Data Provider** communicates with API

---

## Developer

**Ankit Bisht**
Flutter Developer | Clean Architecture | BLoC

---

## 📄 License

This project is licensed under the **MIT License**.

---

This project is created for **learning, practice, and portfolio purposes**.
