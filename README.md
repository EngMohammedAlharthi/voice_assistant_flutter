```
# Voice Assistant Flutter App

This Flutter application implements a lightweight voice-based chatbot that allows real-time interaction between the user and the bot through speech recognition and text-to-speech technologies. The app captures voice input using `speech_to_text`, converts it into text, and then replies by repeating the same message using `flutter_tts` (Text-to-Speech).

## 🧠 Features & Libraries Used

- **speech_to_text** (^6.6.2): Captures user voice and transcribes it to text.
- **flutter_tts** (^3.6.5): Converts bot response text into spoken audio.
- **Flutter**: UI built with modern Material Design (Material 3).

## 🛠 How to Run the Project (From Scratch)

1. Clone or download the project folder.
2. Open the project using VS Code (or any editor).
3. Run this command to fetch dependencies:
   flutter pub get
4. Launch the app in a web browser using:
   flutter run -d web-server
5. After seeing the message:
   lib\main.dart is being served at http://localhost:xxxx
   Copy and paste the URL into your browser to use the app.

## 🔁 How to Run the App Again (After Restarting)

1. Open terminal and navigate to the project directory, for example:
   cd /d E:\FlutterProjects\voice_chatbot
2. Run:
   flutter pub get
3. Then:
   flutter run -d web-server
4. Open the given localhost link in your browser.

## 💬 Usage

Click the "Speak" button → Say something → The app will show what you said and repeat it back as audio using Text-to-Speech.

## 📦 Files to Include in GitHub

- `lib/` folder (especially `main.dart`)
- `pubspec.yaml` and `pubspec.lock`
- `.gitignore` (if available)
- `README.md` (this file)
- `web/` folder (auto-generated when using web-server)
- Any assets if used

This completes the task requirements: designing a Flutter voice chatbot, implementing required libraries, building the interaction logic, and documenting the full process and usage in a clear, professional format.
```
