import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignaturePadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignaturePad(),
    );
  }
}

class SignaturePad extends StatefulWidget {
  @override
  _SignaturePadState createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Ground'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300],
              child: Signature(
                controller: _controller,
                height: double.infinity,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                onPressed: () {
                  _controller.clear();
                },
                label: 'Clear',
                backgroundColor: Colors.red,
              ),
              SizedBox(width: 16),
              _buildButton(
                onPressed: () {
                  _controller.isEmpty ? null : _controller.undo();
                },
                label: 'Undo',
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 16),
              _buildButton(
                onPressed: () {
                  _controller.isEmpty ? null : _saveSignature();
                },
                label: 'Save',
                backgroundColor: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required String label,
    required Color backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8), // Optional: for rounded corners
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return backgroundColor.withOpacity(0.5); // Adjust opacity for disabled state if needed
              }
              return backgroundColor;
            },
          ),
        ),
        child: Text(label),
      ),
    );
  }

  void _saveSignature() {
    _controller.toPngBytes().then((signatureData) {
      // Handle the signature data here
      print('Signature saved!');
      // You can save the signatureData to your desired location
    });
  }
}
