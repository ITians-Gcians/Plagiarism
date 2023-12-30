import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:read_pdf_text/read_pdf_text.dart';

// import 'package:syncfusion_flutter_pdf/pdf.dart';

// bool isFilePickerActive = false;

// Future pickFile(String expectedFileType, BuildContext context,
//     TextEditingController controller, Function(String) updateCharCount) async {
//   if (isFilePickerActive) {
//     // File picker is already active, do nothing
//     return;
//   }

//   try {
//     isFilePickerActive = true;
//     List<String> allowedExtensions = [expectedFileType];
//     FilePickerResult? result = await FilePicker.platform
//         .pickFiles(type: FileType.custom, allowedExtensions: allowedExtensions);

//     if (result != null) {
//       File file = File(result.files.single.path!);

//       if (expectedFileType == 'pdf' && result.files.single.extension == 'pdf') {
//         String content = await _extractText(file);
//         controller.text = content;
//         updateCharCount(content);
//       } else if ((expectedFileType == 'doc' || expectedFileType == 'docx') &&
//           (result.files.single.extension == 'doc' ||
//               result.files.single.extension == 'docx')) {
//         Uint8List bytes = await file.readAsBytes();
//         String content = base64Encode(bytes);
//         controller.text = content;
//         updateCharCount(content);
//       } else if ((expectedFileType == 'txt') &&
//           (result.files.single.extension == 'txt')) {
//         Uint8List bytes = await file.readAsBytes();
//         String content = base64Encode(bytes);
//         controller.text = content;
//         updateCharCount(content);
//       } else {
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Invalid File Type'),
//               content:
//                   Text('Please select a valid file type: $expectedFileType'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } else {
//       // User canceled the picker
//     }
//   } catch (e) {
//     print("File picker exception: $e");
//   } finally {
//     isFilePickerActive = false;
//   }
// }

// Future<Uint8List> _readDocumentData(String path) async {
//   final ByteData data = await rootBundle.load(Images.pad_file);
//   return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
// }

// Future<String> _extractText(File file) async {
//   if (file.path.endsWith('.pdf')) {
//     // Load an existing PDF document.
//     PdfDocument document = PdfDocument(inputBytes: await file.readAsBytes());

//     // Create a new instance of the PdfTextExtractor.
//     PdfTextExtractor extractor = PdfTextExtractor(document);

//     // Extract all the text from the document.
//     String text = extractor.extractText();
//     // _showResult(text);

//     return text;
//   } else {
//     // Handle other file types if needed
//     return ''; // Return an empty string for non-PDF files
//   }
// }

bool isFilePickerActive = false;

Future<void> pickFile(
  List<String> expectedFileType,
  BuildContext context,
  TextEditingController controller,
  Function(String) updateCharCount,
  Function(bool) setLoading,
) async {
  if (isFilePickerActive) {
    // File picker is already active, do nothing
    return;
  }

  try {
    setLoading(true);
    isFilePickerActive = true;
    List<String> allowedExtensions = expectedFileType;
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: allowedExtensions);

    if (result != null) {
      File file = File(result.files.single.path!);
      //  setState(() {});
      if (expectedFileType.contains('pdf') &&
          result.files.single.extension == 'pdf') {
        String content = await getPDFTextAndUpdateState(file.path);
        // String content = await _extractText(file);
        controller.text = content;
        updateCharCount(content);
      } else if ((expectedFileType.contains('doc') ||
              expectedFileType.contains('docx')) &&
          (result.files.single.extension == 'doc' ||
              result.files.single.extension == 'docx')) {
        Uint8List bytes = await file.readAsBytes();
        String content = base64Encode(bytes);
        controller.text = content;
        updateCharCount(content);
      } else if ((expectedFileType.contains('txt')) &&
          (result.files.single.extension == 'txt')) {
        Uint8List bytes = await file.readAsBytes();
        String content = base64Encode(bytes);
        controller.text = content;
        updateCharCount(content);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid File Type'),
              content:
                  Text('Please select a valid file type: $expectedFileType'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      // User canceled the picker
    }
  } catch (e) {
    print("File picker exception: $e");
  } finally {
    isFilePickerActive = false;
  }
}

Future<String> getPDFTextAndUpdateState(String path) async {
  try {
    String text = await getPDFtext(path);
    return text.replaceAll("\n", " ");
  } catch (e) {
    print("Error fetching PDF text: $e");
    return ''; // Handle the error case by returning an empty string or another default value
  }
}

Future<String> getPDFtext(String path) async {
  String text = "";
  try {
    text = await ReadPdfText.getPDFtext(path);
  } on PlatformException {
    print("Failed to get PDF text.");
  }
  return text;
}
