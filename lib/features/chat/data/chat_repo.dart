import 'package:dio/dio.dart';
import 'package:serophero/constants/app_urls.dart';
import 'package:serophero/features/chat/data/chat_model.dart';
import 'package:serophero/utils/shared_preferences.dart';

class ChatListRepo {
  final Dio dio = Dio();

  Future<List<ChatList>> getChatList() async {
    final token = await SharedUtils.getToken();

    final response = await dio.post(
      AppUrls.chatList,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    print(response.data);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      List<ChatList> chatlist_data = [];
      for (int i = 0; i < data.length; i++) {
        // print("chat object");
        // print(data[i]);
        ChatList item = ChatList.fromMap(data[i] as Map<String, dynamic>);
        chatlist_data.add(item);
      }

      return chatlist_data;
    } else {
      print("error");
      throw Exception('Failed to load chat list');
    }
  }
}
