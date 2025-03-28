import 'package:flutter/cupertino.dart';
import '../business/file_content.dart';

class FileUploadButton extends StatelessWidget {
  final String label;
  final Function(FileContent) onFileSelected;

  const FileUploadButton({
    super.key,
    required this.label,
    required this.onFileSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFilePickerDialog(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.doc, color: CupertinoColors.systemGrey),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  void _showFilePickerDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text('Choose File'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              // Here you would implement platform-specific file picking
              // For iOS: Use UIDocumentPickerViewController
              // For Android: Use Intent.ACTION_GET_CONTENT
              Navigator.pop(context);
            },
            child: Text('Browse Files'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          isDestructiveAction: true,
          child: Text('Cancel'),
        ),
      ),
    );
  }
}
