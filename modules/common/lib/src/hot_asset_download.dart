import 'package:archive/archive_io.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:archive/archive.dart';

class HotAssetDownload {
  final String moduleName;
  final String url;

  const HotAssetDownload({required this.moduleName, required this.url});

  download() async {
    final documentDir = await getApplicationDocumentsDirectory();
    final zipPath = join(documentDir.path, '$moduleName.zip');
    print('download url: $url');
    await Dio().download(
      url,
      zipPath,
      onReceiveProgress: (count, total) {
        print(count / total);
      },
    );
    final outputPath = join(documentDir.path, moduleName);
    await extractFileToDisk(zipPath, outputPath, asyncWrite: true);
  }
}
