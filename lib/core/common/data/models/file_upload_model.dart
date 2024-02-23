import 'dart:io';

class FileUploadEntity{
  final String folderName;
  final File file;

  FileUploadEntity({required this.file,required this.folderName});
}