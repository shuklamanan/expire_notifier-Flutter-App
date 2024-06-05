# Expiry Date Reminder App

- This Flutter-based mobile application helps users keep track of the expiry dates of various items.
- It sends email notifications when an item's expiry date is approaching (within 10 days) and offers a user-friendly interface that categorizes items into five distinct types.

## Features
- Expiry Date Notifications: Receive email notifications 10 days before an item expires.
- Categorization: Items are categorized into five types:
1. Medicine
2. Documents
3. Recharge
4. Snacks & Drinks
5. Cosmetics
- User-Friendly Interface: Simple and intuitive UI to manage items.
- Swipe to Delete: Easily delete wrong entries by sliding the item to the left.
- Firebase Firestore Integration: Store user and item-specific information securely.
- Nodemailer Integration: Send email notifications using the Nodemailer package in Node.js.
- Automatic Removal: Items are automatically removed once their expiry date has passed.
- Date Validation: Ensures that users cannot enter past dates for expiry.

## Getting Started

If You want to run this app then 

1. Clone the repository:
git clone https://github.com/shuklamanan/expire_notifier-Flutter-App.git

2. Navigate to the project directory:
cd expire_notifier-Flutter-App

3. Install Flutter dependencies:
flutter pub get

# Usage
1. Adding Items
- Open the app and navigate to the appropriate category (Medicine, Documents, etc.).
- Tap on the 'Add Item' button.
- Enter the item details, including the name and expiry date. The app ensures that past dates cannot be entered.
- Save the item to see it listed under the chosen category.

2. Deleting Items
- Swipe left on the item you wish to delete.
- Confirm the deletion if prompted.

3. Notifications
- Ensure your email address is configured correctly in the app settings.
- The app will automatically send an email notification 10 days before the expiry date of an item using the Nodemailer package.

4. Firebase Firestore
- User and item-specific information is stored in Firebase Firestore, ensuring data is securely managed and easily retrievable.

5. Nodemailer
- Email notifications are handled by a Node.js server using the Nodemailer package to ensure timely reminders.

6. Automatic Removal
- Items are automatically removed from the list once their expiry date has passed, keeping your list up-to-date.

7. Date Validation
- The app ensures that users cannot enter past dates for expiry, preventing invalid entries.

- Contributions are welcome! Please fork the repository and create a pull request with your changes.

## Fork the repository.
1. Create a new branch (git checkout -b feature-branch).
2. Commit your changes (git commit -m 'Add some feature').
3. Push to the branch (git push origin feature-branch).
4. Open a pull request.

# Contact
For any questions or suggestions, please contact mananshukla15@gmail.com.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
