// ignore_for_file: avoid_print
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../../main.dart';
String bearerToken = "";
class NetworkCall{
  static Future<ApiResponse> getApiCall(String url) async {
    print(url);
    try {
      var response = await http.get(Uri.parse(url));
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }
  static ApiResponse _checkResponse(http.Response response) {
    switch (response.statusCode) {
      case 201:
        return ApiResponse(
            done: true, errorMsg: null, responseString: response.body);
      case 200:
        return ApiResponse(
            done: true, errorMsg: null, responseString: response.body);
      case 400:
        return ApiResponse(
            done: true, errorMsg: "Bad Request", responseString: response.body);
      case 401:
        return ApiResponse(
            done: false, errorMsg: null, responseString: response.body);
      case 403:
        return ApiResponse(
            done: false, errorMsg: "Unauthorized Request", responseString: null);
      case 404:
        return ApiResponse(
            done: true, errorMsg: "Page not Found", responseString: response.body);
      case 500:
        return ApiResponse(
            done: false, errorMsg: "Server Error", responseString: null);
      default:
        return ApiResponse(
            done: false,
            errorMsg: "Error occurred while Communication with or timeout",
            responseString: null);
    }
  }
  static Future<ApiResponse> checkStreamResponse(http.StreamedResponse response) async{
    print(await response.stream.bytesToString());
    switch (response.statusCode) {
      case 200:
        return ApiResponse(
            done: true, errorMsg: null, responseString: await response.stream.bytesToString());
      case 400:
        return ApiResponse(
            done: true, errorMsg: "Bad Request", responseString: await response.stream.bytesToString());
      case 401:
        return ApiResponse(
            done: false, errorMsg: "Session Expired", responseString: null);
      case 403:
        return ApiResponse(
            done: false, errorMsg: "Unauthorized Request", responseString: null);
      case 404:
        return ApiResponse(
            done: true, errorMsg: "Page not Found", responseString: await response.stream.bytesToString());
      case 500:
        return ApiResponse(
            done: false, errorMsg: "Server Error", responseString: null);
      default:
        return ApiResponse(
            done: false,
            errorMsg: "Error occurred while Communication with or timeout",
            responseString: null);
    }
  }
  static Future<ApiResponse> getApiCallWithToken(String url) async {
    print(url);
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      };

      var response = await http.get(Uri.parse(url), headers: headers);
      print(response.statusCode);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }

  static Future postApiCall(String url, Map map) async {
    print("Api Url: $url");
    print("Body $map");
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(map),
      );
      debugPrint("StatusCode ${response.statusCode.toString()}");
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }
  static Future<ApiResponse> postFormData(String url, Map map) async {
    print("API URL: $url");
    print("Form Data: $map");
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      map.forEach((key, value) {
        request.fields[key] = value;
      });

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      debugPrint("StatusCode ${response.statusCode}");
      debugPrint("Response: ${response.body}");
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
        done: false,
        errorMsg: "Please check your connection",
        responseString: null,
      );
    }
  }
  static Future postApiWithTokenCall(String url, Map map) async {
    print(url);
    print("***Body: $map");

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
        body: jsonEncode(map),
      );
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }
  static Future postFormUrlEncodedWithTokenCall(String url, Map<String, String> map) async {
    print(url);
    print("***Form Data: $map");

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
        body: map, // don't encode it, http handles encoding
      );
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
        done: false,
        errorMsg: "Please check your connection",
        responseString: null,
      );
    }
  }

  static Future deleteApiWithTokenCall(String url) async {
    print(url);
    // print("***Body: $map");

    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
        // body: jsonEncode(map), // Optional: Remove if not needed by the API
      );
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }
  static Future postMultipartCall(String url, Map map) async {
    print(url);
    print(map);
    try{
      final request = http.MultipartRequest('POST', Uri.parse(url));
      map.forEach((key, value) {
        request.fields[key] = value;
      });
      request.headers["Content-Type"] = "multipart/form-data; boundary=<calculated when request is sent>";
      request.headers["Accept"] = "*/*";

      final response = await request.send();
      return checkStreamResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }
  static Future<ApiResponse> uploadFile(
      {String? url, Map? map, String? imagePath}) async {
    try {
      var postUri = Uri.parse(url!);
      var request = http.MultipartRequest("POST", postUri);

      map!.forEach((key, value) {
        request.fields[key] = value;
      });
      var multipartFile = await http.MultipartFile.fromPath("image", imagePath!,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }
  static Future<ApiResponse> multipartUploadFile(String url, Map? map, String imagePath) async{
    print(url);
    print(map);
        try {
          Map<String, String> headers = {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
          };

          var postUri = Uri.parse(url);
          var request = http.MultipartRequest("POST", postUri);

          map?.forEach((key, value) {
            request.fields[key] = value;
          });

          print("SelectedPath: $imagePath");
          if(imagePath != ""){
            String fileName = imagePath.split('/').last;
            String fileExtension = fileName.split('.').last.toLowerCase();

            MediaType? mediaType;
            if (['jpg', 'jpeg', 'png'].contains(fileExtension)) {
              mediaType = MediaType('image', fileExtension);
            } else if (['mp4', 'mov', 'avi'].contains(fileExtension)) {
              mediaType = MediaType('video', fileExtension);
            } else {
              // throw Exception('Unsupported media type');
            }

            var multipartFile = await http.MultipartFile.fromPath(
              "issue_media",
              imagePath,
              contentType: mediaType,
            );
            request.files.add(multipartFile);
          }
          else{
            request.fields["issue_media"] = "";
          }

          request.headers.addAll(headers);

          var streamedResponse = await request.send();
          var response = await http.Response.fromStream(streamedResponse);
          print(response.body);
          return _checkResponse(response);
        } on SocketException {
          return ApiResponse(
              done: false,
              errorMsg: "Please check your connection",
              responseString: null);
        }

  }
  static Future<ApiResponse> uploadFileWithToken(
      String url, Map map, String imagePath) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $bearerToken',
      };

      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);
      map.forEach((key, value) {
        request.fields[key] = value;
      });
      var multipartFile = await http.MultipartFile.fromPath("image", imagePath,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }
  static Future<ApiResponse> uploadProfileFileWithToken(
      String url, Map map, String imagePath) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      };

      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);
      map.forEach((key, value) {
        request.fields[key] = value;
      });
      var multipartFile = await http.MultipartFile.fromPath(
          "avatar", imagePath,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }
  static Future<ApiResponse> uploadProfileFileWithTokenPath(
      String url, Map map, String imagePath) async {
    print("Api Url: $url");
    print("Body $map");
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      };

      // Check if imagePath is an asset
      File file;
      if (imagePath.startsWith("assets/")) {
        // Load asset as ByteData
        ByteData byteData = await rootBundle.load(imagePath);

        // Write asset to a temporary file
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = '${tempDir.path}/temp_avatar.jpg';
        file = File(tempPath);
        await file.writeAsBytes(byteData.buffer.asUint8List());
      } else {
        // It's a real file path
        file = File(imagePath);
      }
      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);
      map.forEach((key, value) {
        request.fields[key] = value;
      });

      // Attach file
      var multipartFile = await http.MultipartFile.fromPath(
        "avatar",
        file.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      debugPrint("StatusCode ${response.statusCode.toString()}");
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
        done: false,
        errorMsg: "Please check your connection",
        responseString: null,
      );
    } catch (e) {
      return ApiResponse(
        done: false,
        errorMsg: e.toString(),
        responseString: null,
      );
    }
  }
  static Future<ApiResponse> uploadProfileFileWithTokenPathOptional(
      String url, Map map, String imagePath) async {
    print("Api Url: $url");
    print("Body $map");
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      };

      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);
      map.forEach((key, value) {
        request.fields[key] = value;
      });

      // If imagePath is not empty, attach the file
      if (imagePath.isNotEmpty) {
        File file;

        if (imagePath.startsWith("assets/")) {
          // Load asset as ByteData
          ByteData byteData = await rootBundle.load(imagePath);

          // Write asset to a temporary file
          Directory tempDir = await getTemporaryDirectory();
          String tempPath = '${tempDir.path}/temp_avatar.jpg';
          file = File(tempPath);
          await file.writeAsBytes(byteData.buffer.asUint8List());
        } else {
          // It's a real file path
          file = File(imagePath);
        }

        // Attach file
        var multipartFile = await http.MultipartFile.fromPath(
          "avatar",
          file.path,
          contentType: MediaType('image', 'jpeg'),
        );
        request.files.add(multipartFile);
      }

      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      debugPrint("StatusCode ${response.statusCode.toString()}");
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
        done: false,
        errorMsg: "Please check your connection",
        responseString: null,
      );
    } catch (e) {
      return ApiResponse(
        done: false,
        errorMsg: e.toString(),
        responseString: null,
      );
    }
  }
  static Future<ApiResponse> uploadWarrantyFileWithTokenPath(
      String url, Map map, String imagePath) async {
    print("Api Url: $url");
    print("Body $map");
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      };

      // Check if imagePath is an asset
      File file;
      if (imagePath.startsWith("assets/")) {
        // Load asset as ByteData
        ByteData byteData = await rootBundle.load(imagePath);

        // Write asset to a temporary file
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = '${tempDir.path}/temp_avatar.jpg';
        file = File(tempPath);
        await file.writeAsBytes(byteData.buffer.asUint8List());
      } else {
        // It's a real file path
        file = File(imagePath);
      }

      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);

      map.forEach((key, value) {
        request.fields[key] = value;
      });

      // Attach file
      var multipartFile = await http.MultipartFile.fromPath(
        "warranty_card_image",
        file.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      debugPrint("StatusCode ${response.statusCode.toString()}");
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
        done: false,
        errorMsg: "Please check your connection",
        responseString: null,
      );
    } catch (e) {
      return ApiResponse(
        done: false,
        errorMsg: e.toString(),
        responseString: null,
      );
    }
  }
  static Future<ApiResponse> uploadFiles(
      {required String url,
        required Map<dynamic, dynamic> map,
        String keyName =  'image',
        required List<XFile> images,
        bool token = true}) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      if (token) {
        headers['Authorization'] = 'Bearer $bearerToken';
      }
      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);
      map.forEach((key, value) {
        request.fields[key] = '$value';
      });
      if (images.isNotEmpty) {
        keyName = '$keyName[]';
      }
      for (var element in images){
        var multipartFile = await http.MultipartFile.fromPath(
            keyName, element.path,
            contentType: MediaType('image', 'jpeg'));
        request.files.add(multipartFile);
            }
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Please check your connection",
          responseString: null);
    }
  }
  static Future<File> downloadAndSaveVideo(String videoUrl, String videoId) async {
    String url = videoUrl.replaceAll(" ", "%20");
    print(url);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final videoFile = File('${myAppDir.path}/$videoId.mp4');
      await videoFile.writeAsBytes(response.bodyBytes);
      return videoFile;
    } else {
      throw Exception('Failed to download video. Status code: ${response.statusCode}');
    }
  }
  static Future<File> downloadAndSavePdf(String pdfUrl, String pdfId) async {
    final pdfFile = File('${myAppDir.path}/$pdfId.pdf');
    final url = pdfUrl.replaceAll(" ", "%20");

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      await pdfFile.writeAsBytes(response.bodyBytes);
      return pdfFile;
    }
    else {
      throw Exception("***Failed to download PDF: ${response.statusCode}***");
    }
  }
}
class ApiResponse {
  String? responseString;
  String? errorMsg;
  bool? done;

  ApiResponse({this.done, this.errorMsg, this.responseString});
}