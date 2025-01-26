# UserListApp

UserListApp is an iOS application built with Swift and UIKit that displays a list of users retrieved from a remote API. This project was developed as an **iOS Developer Test Case** for **SevenApps**.

## Features

- Fetches user data from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/).
- Displays user information in a structured list view.
- Built with an MVVM (Model-View-ViewModel) architecture for better separation of concerns.
- Unit tested for robust and reliable functionality.

## Architecture

This project follows the MVVM architecture to ensure clean separation of business logic and UI code. The app uses the following components:

- **ViewModel**: Handles the business logic and communicates with the repository to fetch user data.
- **Repository**: Abstracts the data source, providing a clean interface for fetching data.
- **Model**: Defines the structure of the data fetched from the API.
- **View**: Displays data and handles user interactions.
