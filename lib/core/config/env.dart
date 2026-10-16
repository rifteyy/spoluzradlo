import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Env {
  static String get supabaseUrl => _require('SUPABASE_URL');
  static String get supabasePublishableKey => _require('SUPABASE_PUBLISHABLE_KEY');
  static String get deepLinkScheme => dotenv.get('DEEP_LINK_SCHEME', fallback: 'spoluzradlo');
  static String get authRedirectUrl =>
      dotenv.get('AUTH_REDIRECT_URL', fallback: 'spoluzradlo://login-callback');
  static String get productLookupUrl => dotenv.get('PRODUCT_LOOKUP_URL',
      fallback: 'https://world.openfoodfacts.org/api/v2/product');
  static int get freeMaxItems => int.parse(dotenv.get('FREE_MAX_ITEMS', fallback: '50'));
  static int get freeMaxHouseholds => int.parse(dotenv.get('FREE_MAX_HOUSEHOLDS', fallback: '1'));

  static String _require(String key) {
    final value = dotenv.maybeGet(key);
    if (value == null || value.isEmpty) {
      throw StateError('Chybí $key v .env – zkopírujte .env.example do .env.');
    }
    return value;
  }
}
