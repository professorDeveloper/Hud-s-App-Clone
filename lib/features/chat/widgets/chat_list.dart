import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:watsapp_clone/common/widgets/loader.dart';
import 'package:watsapp_clone/features/chat/controller/chat_controller.dart';
import 'package:watsapp_clone/models/message.dart';
import 'package:watsapp_clone/widgets/sender_message_card.dart';

import '../../../info.dart';
import '../../../widgets/my_message_card.dart';

class ChatList extends ConsumerStatefulWidget {
  final String recieverUserId;
  const ChatList({
    Key? key,
    required this.recieverUserId,
  }) : super(key: key);

  @override
  ConsumerState<ChatList> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController messageController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
      stream: ref.read(chatControllerProvider).chatStream(widget.recieverUserId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loader();
        }     SchedulerBinding.instance.addPostFrameCallback((_) {
          messageController
              .jumpTo(messageController.position.maxScrollExtent);
        });

        return ListView.builder(
          controller: messageController,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final messageData = snapshot.data![index];
            var toTimeFormat = DateFormat.Hm().format(messageData.timeSent);
            if (messageData.senderId ==
                FirebaseAuth.instance.currentUser!.uid) {
              return SizedBox(
                height: 60,
                width: 300,
                child: MyMessageCard(
                  message: messageData.text,
                  date: toTimeFormat,
                ),
              );
            }
            return SenderMessageCard(
              message: messageData.text,
              date: toTimeFormat,
            );
          },
        );
      },
    );
  }
}

