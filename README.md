
# CraftyBay Ecommerce Application

## Description
CraftyBay is a feature-rich ecommerce app designed to provide users with a seamless and enjoyable shopping experience. With a focus on user-friendliness and a wide range of products, CraftyBay allows users to explore, purchase, and review products with ease.

## Responsibilities
As the creator of CraftyBay, my responsibilities included:

 - App Development: Developing and designing the CraftyBay ecommerce app, ensuring a user-friendly interface and smooth navigation.

 - Product Management: Organizing products into categories. Implementing a dynamic product carousel slider for an engaging shopping experience.

 - User Profiles: Enabling users to create and manage their profiles, making it convenient for them to track their orders and preferences.

 - Product Customization: Implementing the ability for users to select products by color and size, ensuring they can find items that suit their preferences.

 - Wishlist Functionality: Allowing users to add products to their wishlist, making it easy for them to save items they are interested in for future purchases.

 - Product Reviews: Incorporating a review system, enabling users to share their thoughts and experiences with purchased products.

## Challenges Faced
During the development of CraftyBay, several challenges were encountered, including:

 - User Authentication: Overcoming the challenge of securely saving and managing user tokens to ensure data privacy and user account protection.

 - Navigation Design: Creating an intuitive and user-friendly navigation system that helps users easily access their cart, wishlist, and additional options.

 - State Management and API Optimization: Ensuring efficient state management within the app and minimizing unnecessary API calls to enhance performance and reduce data usage.

## How Challenges Were Overcome
To address these challenges, several strategies and solutions were implemented:

 - User Authentication: Rigorous security measures were put in place to safeguard user tokens, ensuring that user accounts and data are protected from unauthorized access.

 - Navigation Design: Extensive user testing and feedback collection were conducted to refine the app's navigation, making it as intuitive as possible for users to access their cart, wishlist, and other options.

 - State Management: We implemented a robust state management system, utilizing tools and libraries such as GetX or the built-in setState mechanism, depending on the app's architecture. This allowed us to efficiently manage the app's state, ensuring data consistency and responsiveness.

 - Reducing API calls: To optimize app performance, we've reduced the number of API calls where data is fetched and updated only when needed, reducing app data consumption and enhancing user experience.

CraftyBay is continuously evolving to enhance the shopping experience for users, and your feedback and contributions are welcome. Thank you for considering CraftyBay for your ecommerce needs!


## CraftyBay UI
![all (1)](https://github.com/hredhayxz/craftybay_ecommerce_application/assets/60058949/88d4de63-ec05-4cae-a817-c17c440321ef)

## Getting Started

### Prerequisites

Ensure Flutter is installed on your machine. For installation instructions, refer to the official [Flutter website](https://flutter.dev/docs/get-started/install).

### Installation

Follow these steps to run the News Read Application:

1. Clone this repository to your local machine:

```bash
git clone https://github.com/hredhayxz/craftybay_ecommerce_application.git
```

2. Navigate to the project folder:

```bash
cd craftybay_ecommerce_application
```

3. Install dependencies:

```bash
flutter pub get
```

### How to Run

Connect your device or emulator and run the app using the following command:

```bash
flutter run
```

## Used Packages

CraftyBay integrates the following packages to enhance functionality:
- `http: ^1.1.0`: The HTTP package provides a straightforward way to make HTTP requests in your Flutter app. It's essential for fetching data from APIs and working with web services.
- `flutter_svg: ^2.0.7`: A Flutter package for rendering SVG (Scalable Vector Graphics) images. It allows you to easily display and manipulate SVG files in your Flutter application.
- `cached_network_image: ^3.3.0`: For network image caching and showing.
- `get: ^4.6.5`: Get is a state management library for Flutter that simplifies the process of managing application state. It provides a clean and efficient way to handle state and dependencies in your app.
- `pin_code_fields: ^8.0.1`: Pin Code Fields is a Flutter package that helps you implement PIN or OTP input fields in your app. It's highly customizable and easy to use for user authentication and verification.
- `connectivity_plus: ^5.0.1`: Connectivity Plus is a Flutter package for monitoring network connectivity. It helps you check the status of the device's network connection and react to changes in connectivity.
- `flutter_launcher_icons: ^0.13.1`: This package simplifies the process of generating and setting app icons for your Flutter application. It allows you to customize app icons with ease.
- `carousel_slider: ^4.2.1`: Carousel Slider is a package for creating image carousels and sliders in your Flutter app. It's useful for creating interactive and dynamic image galleries.
- `shared_preferences: ^2.2.1`: Shared Preferences is a Flutter package for persisting simple key-value data in a platform-agnostic manner. It's commonly used for storing app settings and small amounts of data.
- `flutter_rating_bar: ^4.0.1`: Use this package for give rating.
- `webview_flutter: ^4.4.1`: A Flutter plugin that provides a WebView widget.


## Project Directory Structure

The CraftyBay directory structure is organized as follows:

```

craftybay_ecommerce_application/
├── assets/
│   └── images/
│       ├── logo.svg
│       ├── logo_icon.png
│       └── logo_nav.svg
└── lib/
    ├── application/
    │   ├── utility/
    │   │   └── app_colors.dart
    │   ├── app.dart
    │   └── state_holder_binder.dart
    ├── data/
    │   ├── models/
    │   │   ├── cart_list_model.dart
    │   │   ├── category_model.dart
    │   │   ├── network_response.dart
    │   │   ├── product_details_model.dart
    │   │   ├── product_model.dart
    │   │   ├── product_review_model.dart
    │   │   ├── read_profile_model.dart
    │   │   ├── slider_model.dart
    │   │   └── wishlist_product_model.dart
    │   ├── services/
    │   │   └── network_caller.dart
    │   └── utility/
    │       └── urls.dart
    ├── presentation/
    │   ├── state_holders/
    │   │   ├── auth/
    │   │   │   ├── auth_controller.dart
    │   │   │   ├── create_profile_screen_controller.dart
    │   │   │   ├── email_verification_screen_controller.dart
    │   │   │   ├── otp_verification_screen_controller.dart
    │   │   │   └── read_profile_controller.dart
    │   │   ├── add_to_cart_controller.dart
    │   │   ├── cart_screen_controller.dart
    │   │   ├── category_controller.dart
    │   │   ├── category_product_list_controller.dart
    │   │   ├── create_review_screen_controller.dart
    │   │   ├── create_wishlist_controller.dart
    │   │   ├── delete_cart_list_product_controller.dart
    │   │   ├── home_slider_controller.dart
    │   │   ├── main_bottom_nav_screen_controller.dart
    │   │   ├── new_product_controller.dart
    │   │   ├── popular_product_controller.dart
    │   │   ├── product_details_screen_controller.dart
    │   │   ├── product_review_screen_controller.dart
    │   │   ├── special_product_controller.dart
    │   │   ├── theme_manager_controller.dart
    │   │   └── wishlist_screen_controller.dart
    │   └── ui/
    │       ├── screens/
    │       │   ├── auth/
    │       │   │   ├── create_profile_screen.dart
    │       │   │   ├── email_verification_screen.dart
    │       │   │   ├── otp_verification_screen.dart
    │       │   │   ├── read_profile_screen.dart
    │       │   │   └── update_profile_screen.dart
    │       │   ├── cart_screen.dart
    │       │   ├── category_list_screen.dart
    │       │   ├── category_product_list_screen.dart
    │       │   ├── create_review_screen.dart
    │       │   ├── home_screen.dart
    │       │   ├── main_bottom_nav_screen.dart
    │       │   ├── product_details_screen.dart
    │       │   ├── product_list_screen.dart
    │       │   ├── product_review_screen.dart
    │       │   ├── splash_screen.dart
    │       │   └── wishlist_screen.dart
    │       ├── utility/
    │       │   └── assets_path.dart
    │       └── widgets/
    │           ├── home/
    │           │   ├── home_screen_appbar_title.dart
    │           │   ├── home_slider.dart
    │           │   └── section_header.dart
    │           ├── product_details/
    │           │   ├── bottom_nav_card.dart
    │           │   ├── custom_stepper.dart
    │           │   ├── product_image_slider.dart
    │           │   ├── product_name_with_stepper.dart
    │           │   ├── product_rating_review_wishlist.dart
    │           │   ├── select_product_color.dart
    │           │   └── select_product_size.dart
    │           ├── cart_product_card.dart
    │           ├── category_card.dart
    │           ├── circular_icon_button.dart
    │           ├── craftyBay_logo.dart
    │           ├── custom_appbar.dart
    │           ├── product_card.dart
    │           ├── product_listview.dart
    │           ├── review_card.dart
    │           ├── section_title.dart
    │           └── wishlist_product_card.dart
    └── main.dart

```

## Contributors

- [Md Alhaz Mondal Hredhay](https://github.com/hredhayxz)

## Special Thanks

### A heartfelt thanks to my mentors:

[Rabbil Hasan](https://github.com/rupomsoft) for his enlightening prerecorded classes and [Rafat Jamader Meraz](https://github.com/RafatMeraz) or teaching me how to make UI like this and the API integration seamless.

### A heartfelt thanks to my classmate:

[Moniruzzaman](https://github.com/moniruzzaman76) & [Mujahedul Islam](https://github.com/muj-i) to share their knowledges with me & help me complete the project.

