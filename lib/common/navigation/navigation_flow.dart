import 'package:mobileshop/router/router.dart';

class NavigationFlow {
  static Future<void> toSignUpPage() {
    return router.push('/sign_up');
  }

  static Future<void> toLoginPage() {
    return router.push('/login');
  }

  static Future<void> toProductDetails() {
    return router.push('/product-details');
  }

  static Future<void> toWelcomePage() {
    return router.replace('/welcome');
  }

  static Future<void> toProductList() {
    //remove all page and push
    while (router.canPop()) {
      router.pop();
    }
    return router.replace('/product-list');
  }

  static Future<void> popAllToWelcomePage() {
    while (router.canPop()) {
      router.pop();
    }
    return router.replace('/welcome');
  }
}
