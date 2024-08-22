# Compliance Companion App

This is a basic version of a Compliance Companion app created using Flutter. The app helps users track and manage their regulatory compliance tasks.

## Features

1. **Task List:** (Done)
    - Display a list of compliance tasks (hardcoded initially).
    - Each task has a title, due date, status (e.g., "Pending," "In Progress," "Completed").
    - Allow users to mark tasks as complete.
    
2. **Task Details:** (Done)
    - Tapping on a task opens a details screen.
    - Display task title, due date, description (optional), and any relevant notes.

3. **Notifications (Firebase Integration):**
    - Set up Firebase Cloud Messaging (FCM).
    - Send a reminder notification when a task is due soon (e.g., 1 day before).

4. **Authentication (AWS Cognito Integration):**
    - Basic user sign-up and sign-in using AWS Cognito.
    - Store user data (e.g., completed tasks) securely.

## Getting Started

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/Jaycii2808/compliance-companion.git    
    cd compliance-companion
    ```

2. Fetch dependencies:
    ```sh
    flutter pub get
    ```

3. Generate necessary files using build_runner:
    ```sh
    flutter packages pub run build_runner build
    ```
   
4. Init flash screen using flutter_native_splash:
   ```sh
    flutter pub run flutter_native_splash:create --flavor main
    ```

### Running the App

1. Ensure you have a device connected or an emulator running.

2. Run the app:
    ```sh
    flutter run
    ```
   
## Flutter Version

- **Flutter (Channel stable, 3.22.2, on macOS 14.5 23F79 darwin-x64, locale en-VN)**
   - Flutter version 3.22.2
   - Dart version 3.4.3

## Contributing

Contributions are welcome! Please fork this repository and submit pull requests.

## Download

You can download the latest version of the app from the link below:

[Download APK](https://github.com/Jaycii2808/compliance-companion-app/releases/download/v1.0.0/compliance_companion-app-release.apk)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Screenshoot

![App Screenshot](https://github.com/Jaycii2808/compliance-companion/blob/v1.0.0/app_screenshoot/img_screen_shoot_1.png)
![App Screenshot](https://github.com/Jaycii2808/compliance-companion/blob/v1.0.0/app_screenshoot/img_screen_shoot_2.png)
![App Screenshot](https://github.com/Jaycii2808/compliance-companion/blob/v1.0.0/app_screenshoot/img_screen_shoot_3.png)
![App Screenshot](https://github.com/Jaycii2808/compliance-companion/blob/v1.0.0/app_screenshoot/img_screen_shoot_4.png)
![App Screenshot](https://github.com/Jaycii2808/compliance-companion/blob/v1.0.0/app_screenshoot/img_screen_shoot_5.png)

