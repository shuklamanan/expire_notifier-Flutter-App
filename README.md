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

# Output
- The first picture shows the interface for creating a new user account.
- ![1](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/e1e37382-e785-47d5-b61c-ba89a8e8569e)
- The second picture displays the login screen for existing users.
- ![2](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/f6d2b727-b6e0-4666-bb73-e420df59dcd1)
- In the third picture, the user has entered their email and password on the login page.
- ![third](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/278b583b-378e-4860-ad71-f7bcbd97f811)
- The fourth picture features the home screen of the application with five categories and an "Add Items" button at the bottom right.
- ![fourth](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/5a3c88cf-b45b-46f1-809a-a3d24084628e)
- The fifth picture shows a dialog box that appears when the "Add Item" button is clicked.
- ![fifth](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/1b99ba1c-f178-4e53-96ca-50771b8eecde)
- The sixth picture displays a default category screen showing "No Notes" when there are no items.
- ![sixth](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/47d156d4-8ece-441c-81ec-45653f4f7469)
- The seventh picture shows another category screen with the message "No Notes" indicating no items are present.
- ![seventh](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/e306466f-1c33-40fc-b9b4-2ee01f4b7fea)
- In the eighth picture, details about an item, including its expiry time and category, are being added.
- ![eigthth](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/b6c7ae5e-235b-4b5f-8f9c-beacf86ec985)
- The ninth picture shows the item added to a specific category.
- ![ninth](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/17de35d2-54aa-423a-98cb-e7c77bcda009)
- The tenth picture confirms the item has been added to its category.
- ![3](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/5f48f9e8-09ef-46ff-9a3e-d6be31b829b7)
- The eleventh picture demonstrates the right swipe action for deleting a particular item.
- ![eleventh](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/c6ef3442-247a-41f1-954f-024fcd477361)
- The twelfth picture shows an item entered in a category that is about to expire within 10 days.
- ![twelveth](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/f21c10e3-bb04-4d3f-b4d9-177f2e551e68)
- The thirteenth picture confirms the item is added to a particular category.
- ![thirteenth](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/6f5aa6f0-19b0-41f4-b1cd-a9631cf1d77a)
- The fourteenth picture shows an email being sent automatically for an item expiring within 10 days using Node.js (Nodemailer) package.
- ![fourteenth](https://github.com/shuklamanan/expire_notifier-Flutter-App/assets/102906369/07d81b33-da9e-4855-9f87-19dcf72b6e9d)

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
