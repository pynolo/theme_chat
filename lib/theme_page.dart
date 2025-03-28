import 'package:flutter/cupertino.dart';
import 'widgets/file_upload_button.dart';
import 'business/file_content.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key, required this.title});

  final String title;

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  final List<FileContent> _files = [];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Theme Chat')),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FileUploadButton(
              label: 'Document 1',
              onFileSelected: (file) => setState(() => _files.add(file)),
            ),
            const SizedBox(height: 8),
            FileUploadButton(
              label: 'Document 2',
              onFileSelected: (file) => setState(() => _files.add(file)),
            ),
            const SizedBox(height: 8),
            FileUploadButton(
              label: 'Document 3',
              onFileSelected: (file) => setState(() => _files.add(file)),
            ),
            const SizedBox(height: 8),
            FileUploadButton(
              label: 'Document 4',
              onFileSelected: (file) => setState(() => _files.add(file)),
            ),
            const SizedBox(height: 8),
            FileUploadButton(
              label: 'Document 5',
              onFileSelected: (file) => setState(() => _files.add(file)),
            ),
          ],
        ),
      ),
    );
  }
}
