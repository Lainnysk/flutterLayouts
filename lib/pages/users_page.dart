import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fstore/models/image_file.dart';
import 'package:fstore/utils/file_utils.dart';
import 'package:fstore/utils/firestore_utils.dart';
import 'package:fstore/utils/image_file_utils.dart';
import 'package:fstore/utils/user_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_android/url_launcher_android.dart';
import '../models/user.dart';
import '../utils/firestorage_utils.dart';
import 'package:path/path.dart' as p;

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  late Stream<List<ImageFile?>> images;

  @override
  void initState() {
    images =
        ImageFileUtils.instanse.get(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  TextEditingController filenameController = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  void showImageDialog(String filenameBase, filenameEdit, path) {
    filenameController.text = filenameEdit;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                      key: key,
                      child: TextFormField(
                        controller: filenameController,
                        validator: (value) {
                          if (value == "" || value == null) {
                            return "Имя файла не должно быть пустым";
                          }
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                    255, 212, 92, 92), // Background color
                              ),
                              onPressed: () {
                                filenameController.text = "";
                                Navigator.of(context).pop();
                              },
                              child: Text("Отмена")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                    255, 41, 123, 60), // Background color
                              ),
                              onPressed: () async {
                                if (!key.currentState!.validate()) return;
                                File file =
                                    await FileUtils.fileFromImageUrl(path);
                                final size = file.lengthSync();
                                final fileExtension = p.extension(file.path);
                                final imagefile = ImageFile(
                                    size: size,
                                    file: file,
                                    fileExtension: fileExtension);
                                String newFileName =
                                    FireStorageUtils.getFileNameByName(
                                        FirebaseAuth.instance.currentUser!.uid,
                                        filenameController.text +
                                            fileExtension);
                                await FileUtils.updateFile(
                                    filenameBase, newFileName, imagefile);
                                Navigator.of(context).pop();
                              },
                              child: Text("Сохранить")),
                        ],
                      )),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FileUtils.uploadImage();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: StreamBuilder(
          stream: images,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return ListView(
              children: snapshot.data!.map((image) {
                if (image != null) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                  width: 350, height: 250),
                              child: Image(image: NetworkImage(image.path!)),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 5),
                            child: Row(children: [
                              Text(
                                "Наименование: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              Text(FileUtils.getFileNameWExtension(
                                  image.filename!))
                            ]),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 5),
                            child: Row(children: [
                              Text(
                                "Размер: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                              Text(FileUtils.restructSize(image.size))
                            ]),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: GestureDetector(
                              onTap: () async {
                                Uri uri = Uri(path: image.path!);
                                await UrlLauncherAndroid().launch(
                                  image.path!,
                                  useSafariVC: true,
                                  useWebView: false,
                                  enableJavaScript: false,
                                  enableDomStorage: true,
                                  universalLinksOnly: false,
                                  headers: <String, String>{
                                    'my_header_key': 'my_header_value'
                                  },
                                );
                              },
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ignore: prefer_const_constructors
                                    Text(
                                      "Ссылка: ",
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                    Flexible(
                                        child: Text(image.path!,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 6, 70, 173),
                                                decoration:
                                                    TextDecoration.underline)))
                                  ]),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                        255, 39, 55, 162), // Background color
                                  ),
                                  onPressed: () {
                                    showImageDialog(
                                        image.filename!,
                                        FileUtils.getFileName(image.filename!),
                                        image.path!);
                                  },
                                  child: Text("Изменить")),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                        255, 212, 92, 92), // Background color
                                  ),
                                  onPressed: () async {
                                    String filename = image.filename!;
                                    FileUtils.deleteImage(filename);
                                  },
                                  child: Text("Удалить"))
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10))
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
