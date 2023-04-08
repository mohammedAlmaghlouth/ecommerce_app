import 'package:ecommerce_app/src/features/account/account_screen.dart';
import 'package:ecommerce_app/src/features/checkout/checkout_screen.dart';
import 'package:ecommerce_app/src/features/leave_review_page/leave_review_screen.dart';
import 'package:ecommerce_app/src/features/not_found/not_found_screen.dart';
import 'package:ecommerce_app/src/features/orders_list/orders_list_screen.dart';
import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/product_page/product_screen.dart';
import '../features/products_list/products_list_screen.dart';

enum AppRoute {
  home,
  cart,
  leaveReview,
  orders,
  account,
  signIn,
  checkout,
  product,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: ((context, state) => const ProductsListScreen()),
      routes: [
        GoRoute(
          path: 'product/:id',
          name: AppRoute.product.name,
          builder: (context, state) {
            // state.params['id'] is to create a key and paramas argument,
            // and the key will retrieved when the user enter the value inside call parameter
            // then it will be stored inside productId
            final productId = state.params['id']!;
            // pass the productId inside the return screen widget & Inside :id in url
            return ProductScreen(productId: productId);
          },
          routes: [
            GoRoute(
                path: 'review',
                name: AppRoute.leaveReview.name,
                pageBuilder: (context, state) {
                  final productId = state.params['id']!;
                  return MaterialPage(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: LeaveReviewScreen(productId: productId),
                  );
                }),
          ],
        ),
        GoRoute(
          path: 'cart',
          name: AppRoute.cart.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const ShoppingCartScreen(),
          ),
          routes: [
            GoRoute(
              path: 'checkout',
              name: AppRoute.checkout.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                fullscreenDialog: true,
                child: const CheckoutScreen(),
              ),
        ),
          ],
        ),
        GoRoute(
          path: 'orders',
          name: AppRoute.orders.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const OrdersListScreen(),
          ),
        ),
        GoRoute(
          path: 'account',
          name: AppRoute.account.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const AccountScreen(),
          ),
        ),
        GoRoute(
          path: 'signIn',
          name: AppRoute.signIn.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            fullscreenDialog: true,
            child: const EmailPasswordSignInScreen(
                formType: EmailPasswordSignInFormType.signIn),
          ),
        )
      ],
    )
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
