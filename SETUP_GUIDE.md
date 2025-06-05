# RemoteArmz Flutter Application - Firebase Setup Guide

## 1. Introduction

This guide provides instructions for setting up the necessary Firebase project and configurations required to run the RemoteArmz Flutter application.

## 2. Prerequisites

*   A Google Account.
*   Flutter SDK installed (refer to Flutter documentation if needed).
*   `firebase_cli` installed (`npm install -g firebase-tools`). Log in using `firebase login`.

## 3. Create Firebase Project

1.  Go to the [Firebase Console](https://console.firebase.google.com/).
2.  Click "Add project".
3.  Enter a project name (e.g., "RemoteArmzApp").
4.  Follow the setup steps. You can choose whether to enable Google Analytics (optional but recommended for usage insights).
5.  Once the project is created, you will be redirected to the project dashboard.

## 4. Set Up Android App in Firebase

1.  From the project dashboard, click the Android icon (</>) to add an Android app.
2.  **Android package name:** Enter `com.example.remote_armz` (as specified during project creation). You can find this in `android/app/build.gradle` under `applicationId`).
3.  **App nickname:** (Optional) Enter a name like "RemoteArmz Android".
4.  **Debug signing certificate SHA-1:** (Optional but recommended for Google Sign-In and other services during development). You can get this by running the following command in your project directory (`remote_armz_app/android`):
    ```bash
    ./gradlew signingReport
    ```
    Copy the SHA-1 value for the `debugAndroidTest` variant.
5.  Click "Register app".
6.  **Download `google-services.json`:** Download the configuration file and place it in the `remote_armz_app/android/app/` directory.
7.  **Add Firebase SDK:** The console provides instructions for modifying your `build.gradle` files. Ensure these dependencies are correctly added (they might already be present if you used `flutterfire configure`):
    *   Project-level `build.gradle` (`android/build.gradle`):
        ```gradle
        buildscript {
            repositories {
                google()
                mavenCentral()
            }
            dependencies {
                // ... other dependencies
                classpath 'com.google.gms:google-services:4.4.1' // Use latest version
            }
        }
        // ...
        allprojects {
            repositories {
                google()
                mavenCentral()
            }
        }
        ```
    *   App-level `build.gradle` (`android/app/build.gradle`):
        ```gradle
        // Add at the top
        apply plugin: 'com.android.application'
        apply plugin: 'com.google.gms.google-services'
        // ... other plugins

        dependencies {
            // ... other dependencies
            implementation platform('com.google.firebase:firebase-bom:33.1.1') // Use latest BOM
            implementation 'com.google.firebase:firebase-analytics'
            implementation 'com.google.firebase:firebase-auth'
            implementation 'com.google.firebase:firebase-firestore'
            implementation 'com.google.firebase:firebase-storage'
            implementation 'com.google.firebase:firebase-messaging'
            implementation 'com.google.firebase:firebase-functions'
        }
        ```
8.  Click "Next" and then "Continue to console".

*(Alternatively, you can use `flutterfire configure` command from the FlutterFire CLI to automate app registration and configuration file download.)*

## 5. Enable Firebase Services

Navigate to the relevant sections in the Firebase console (using the left-hand menu under "Build") and enable the following services:

1.  **Authentication:**
    *   Go to Authentication -> Sign-in method.
    *   Enable "Email/Password".
    *   Enable "Google". Provide the necessary support email.
    *   (Optional) Configure Multi-Factor Authentication if required by the Founder role setup.
2.  **Firestore Database:**
    *   Go to Firestore Database -> Create database.
    *   Choose "Start in **production mode**" (recommended for security). You will configure rules later.
    *   Select a location for your database (choose one close to your users).
    *   Click "Enable".
3.  **Storage:**
    *   Go to Storage -> Get started.
    *   Follow the prompts to set up Cloud Storage.
    *   Choose "Start in **production mode**".
    *   Select the same location as your Firestore database.
4.  **Cloud Functions:**
    *   No specific enablement needed in the console initially, but you will need to deploy functions later (see Section 7).

## 6. Configure Firestore Security Rules

1.  Go to Firestore Database -> Rules.
2.  Replace the default rules with rules that enforce Role-Based Access Control (RBAC) as per the application requirements. **This is crucial for security.**

    *Example (Simplified - Needs detailed implementation based on schema and roles):*
    ```firestore
    rules_version = '2';
    service cloud.firestore {
      match /databases/{database}/documents {
        // Users can read their own user document
        match /users/{userId} {
          allow read: if request.auth != null && request.auth.uid == userId;
          // Allow creation during signup, potentially allow updates by user
          allow write: if request.auth != null && request.auth.uid == userId;
        }

        // Example: Client data accessible by owner or assigned team members
        match /clients/{clientId} {
          allow read, write: if request.auth != null && (
                                request.auth.token.role == 'founder' || 
                                resource.data.assignedTeam.hasAny([request.auth.uid]) // Example field
                              );
        }

        // Add rules for all other collections (outreach, crm, tasks, etc.)
        // based on roles (founder/employee) and data ownership/assignment.

        // Default deny all other access
        match /{document=**} {
          allow read, write: if false;
        }
      }
    }
    ```
3.  **Publish** the rules.

## 7. Configure Storage Security Rules

1.  Go to Storage -> Rules.
2.  Replace the default rules to allow authenticated users to read/write files based on permissions (e.g., only users associated with a client can access client deliverables).

    *Example (Simplified):*
    ```storage
    rules_version = '2';
    service firebase.storage {
      match /b/{bucket}/o {
        // Example: Allow authenticated users to write to a 'user_uploads' path
        match /user_uploads/{userId}/{fileName} {
          allow write: if request.auth != null && request.auth.uid == userId;
          allow read: if request.auth != null && request.auth.uid == userId; // Or based on roles/permissions
        }
        // Add rules for client deliverables, team documents etc.
      }
    }
    ```
3.  **Publish** the rules.

## 8. Deploy Cloud Functions (If Applicable)

If the application uses Cloud Functions for backend logic (e.g., notifications, complex calculations):

1.  Set up a Firebase project locally using `firebase init functions`.
2.  Write your functions in TypeScript or JavaScript.
3.  Deploy using `firebase deploy --only functions`.

*(Refer to Firebase Cloud Functions documentation for details)*

## 9. Running the App

1.  Ensure you have placed the `google-services.json` file correctly.
2.  Ensure your device/emulator is connected.
3.  Navigate to the `remote_armz_app` directory in your terminal.
4.  Run `flutter pub get`.
5.  Run `flutter run`.

## 10. Important Notes

*   **Security Rules:** The example security rules are basic. You **must** implement detailed and robust rules based on the specific data schema and access requirements of the RemoteArmz application to ensure data security and privacy.
*   **Roles:** The setup for assigning the 'founder' role (potentially involving custom claims setup via Cloud Functions or manually in the console) needs to be defined and implemented.
*   **API Keys:** Keep your Firebase project credentials and API keys secure. Do not commit them directly into version control if the repository is public.
*   **Billing:** Firebase operates on a usage-based pricing model (Spark plan is free with generous limits). Be aware of potential costs as your application scales. Enable billing on your project if you need to use paid features or exceed free tier limits.

