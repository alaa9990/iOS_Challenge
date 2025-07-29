# 📱 iOS Challenge

A Swift-based iOS movie app that displays **Now Playing**, **Popular**, and **Upcoming** movies fetched from a remote API. The app is built with **Combine**, follows the **MVVM architecture**, and includes **unit testing** for ViewModels.

---

## 🚀 Features

- ✅ Fetch and display movies from three categories:
  - **Now Playing**
  - **Popular**
  - **Upcoming**
- ✅ Paginated API loading
- ✅ In-memory and persistent caching via `UserDefaults`
- ✅ Modern Combine-based reactive state handling
- ✅ Unit-tested ViewModels using mocked network responses

---

## 🛠 Architecture

- **MVVM** (Model-View-ViewModel)
- **Combine** for reactive state (`PassthroughSubject`, `CurrentValueSubject`)
- **UserDefaults** for lightweight caching
- **Async/Await** for modern API calls
- **Protocol-oriented networking** using `Endpoint` and `ResponseHandler`

---

## 🧪 Unit Testing

Each ViewModel:
- `NowPlayingMoviesViewModel`
- `PopularMoviesViewModel`
- `UpcomingMoviesViewModel`

Is tested to verify:

- 📡 API request behavior
- 🔄 State transitions (`isLoading`, `errorPublisher`)
- 📦 Data updates to `CurrentValueSubject`
- ↕️ Pagination handling
- 💾 Cache handling

Mock responses override `requestGeneralResponse` to isolate logic from real network calls.

Each ViewModel (NowPlayingMoviesViewModel, PopularMoviesViewModel, UpcomingMoviesViewModel) has unit tests that verify:

API request behavior
State transitions (isLoading, errorPublisher)
Data updates to CurrentValueSubject
Pagination and cache handling
Mocks override requestGeneralResponse to isolate tests from real network calls.

📦 Dependencies
No external libraries — purely native Swift, Combine, and XCTest.
```
📁 Project Structure
├── Models/
│   ├── NowPlayingModel.swift
│   ├── PopularMoviesModel.swift
│   └── UpcomingMoviesModel.swift
│
├── ViewModels/
│   ├── BaseViewModel.swift
│   ├── NowPlayingMoviesViewModel.swift
│   ├── PopularMoviesViewModel.swift
│   └── UpcomingMoviesViewModel.swift
│
├── Networking/
│   ├── Endpoint.swift
│   └── ResponseHandler.swift
│
├── Tests/
│   ├── NowPlayingMoviesViewModelTests.swift
│   ├── PopularMoviesViewModelTests.swift
│   └── UpcomingMoviesViewModelTests.swift
│
└── Resources/
    └── Assets.xcassets
```
✅ Requirements
iOS 15+
Xcode 14+
Swift 5.7+
🧑‍💻 Author
Alaa Hassan
LinkedIn | GitHub

📄 License
This project is open-sourced under the MIT License.
