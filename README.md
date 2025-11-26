# GitHub Search App 

**GitHub Search App** is a simple mobile application built with Flutter that allows you to:  
- search repositories on GitHub via the GitHub API  
- display the search results in a clean, readable list  
- view detailed information about a selected repository  

This app is perfect as a demonstration of skills in Flutter, networking, state management, routing, and JSON handling.

---

## Features  

- Search for repositories by name  
- Display a list of search results  
- Tap on an item to view details (name, description, owner, GitHub link)  
- Well-structured code for easy extension — adding pagination, filtering, or additional API endpoints  

---

## Project Structure

lib/
api/ # GitHub API request logic
models/ # Data models
screens/ # App screens (lists, details)
widgets/ # Smaller UI widgets
pubspec.yaml # Flutter dependencies and configuration

---

## How to run the project  

1. Clone the repository  
2. In the project root, get dependencies:  

    flutter pub get

3. Run the app on an emulator or a physical device:

    flutter run

## Technologies

Flutter & Dart

HTTP for network requests

JSON - Dart models (using factory constructors)

Flutter routing / Named Routes

State management - Riverpod 