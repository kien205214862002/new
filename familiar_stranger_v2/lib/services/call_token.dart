import 'package:familiar_stranger_v2/config/utils/export_file.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TokenGenerator {
  Future<String> fetchToken(int uid, String channelName, int tokenRole) async {
    // Prepare the Url
    String url =
        'http://$serverUrl/rtc/$channelName/${tokenRole.toString()}/uid/${uid.toString()}?expiry=${tokenExpireTime.toString()}';

    // Send the request
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server returns an OK response, then parse the JSON.
      Map<String, dynamic> json = jsonDecode(response.body);
      String newToken = json['rtcToken'];
      print('Token Received: $newToken');
      token = newToken;
      // Use the token to join a channel or renew an expiring token
      return newToken;
    } else {
      // If the server did not return an OK response,
      // then throw an exception.
      throw Exception(
          'Failed to fetch a token. Make sure that your server URL is valid');
    }
  }
}
