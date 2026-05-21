import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Observable user data — all widgets reading this auto-update
  Rx<UserModel> user = UserModel.empty().obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Load user data from Firestore
  Future<void> fetchUserRecord() async {
    try {
      isLoading.value = true;
      final fetchedUser = await userRepository.fetchUserDetails();
      user.value = fetchedUser;
    } catch (e) {
      user.value = UserModel.empty();
    } finally {
      isLoading.value = false;
    }
  }

  /// Save user record after signup/social login
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First refresh — user might already exist (Google sign-in re-login)
      await fetchUserRecord();

      // Only save if missing key fields
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          final newUser = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          await userRepository.saveUserRecord(newUser);
          user.value = newUser;
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information.',
      );
    }
  }

  /// Helpers
  String get fullName => user.value.fullName.trim().isNotEmpty
      ? user.value.fullName
      : 'User';

  String get email => user.value.email.isNotEmpty
      ? user.value.email
      : '';

  String get profilePicture => user.value.profilePicture;
}
