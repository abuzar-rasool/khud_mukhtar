
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FileUpload{
  final String fileType;
  final String fireBaseUserid;
  File file;

  FileUpload({this.fileType, this.fireBaseUserid,this.file});

  Future<String> uploadFile() async {
    String filename=file.path.split('/').last;
    StorageReference storageReference;
    if (fileType == 'profileimage') {
      storageReference =
          FirebaseStorage.instance.ref().child("images/$fireBaseUserid/profile/$filename");
    }
    if (fileType == 'productimage') {
      storageReference =
          FirebaseStorage.instance.ref().child("images//$filename");
    }
    if (fileType == 'cnicimage') {
      storageReference =
          FirebaseStorage.instance.ref().child("images/$fireBaseUserid/cnic/$filename");
    }
    final StorageUploadTask uploadTask = storageReference.putFile(file);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    return url;
  }


}