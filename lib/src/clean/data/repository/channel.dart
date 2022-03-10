abstract class Channel {
  Future<Map<String, dynamic>> callMethod({required String method, required String request});
}