part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFood(
      {http.Client? client}) async {
    client ??= http.Client();
    var response;
    List<Food>? foodList;
    try{
      var url = baseUrl + 'food';
      response = await client.get(Uri.parse(url));
      var data = jsonDecode(response.body);
      foodList = (data['data']['data'] as Iterable)
          .map((e) => Food.fromJson(e))
          .toList();
    } catch (e) {
      if (response.statusCode != 200) {
        return ApiReturnValue(message: e.toString());
      }
    }
    return ApiReturnValue(value: foodList);
  }
}
