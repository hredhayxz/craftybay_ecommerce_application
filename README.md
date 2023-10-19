
# CraftyBay Ecommerce Application
A complete ecommerce application

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
- `http: ^1.1.0`: Perform HTTP requests and interact with APIs.
- `flutter_svg: ^2.0.7`: TO use svg format picture in project.
- `cached_network_image: ^3.3.0`: For network image caching and showing.
- `get: ^4.6.5`: Flutter GetX for state management.
- `pin_code_fields: ^8.0.1`: For design fin verification screen.
- `connectivity_plus: ^4.0.2`: Use this for checking network connectivity.
- `flutter_launcher_icons: ^0.13.1`: Simplify the generation of launcher icons on various platforms.
- `carousel_slider: ^4.2.1`: Use it for show image as slider.
- `shared_preferences: ^2.2.1`: Use this for store user token and current theme mode.


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

