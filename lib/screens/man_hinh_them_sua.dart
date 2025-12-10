import 'package:flutter/material.dart';
import '../models/ghi_chu.dart';

class ManHinhThemSua extends StatefulWidget {
  final GhiChu? ghiChuBanDau;

  const ManHinhThemSua({super.key, this.ghiChuBanDau});

  @override
  State<ManHinhThemSua> createState() => _ManHinhThemSuaState();
}

class _ManHinhThemSuaState extends State<ManHinhThemSua> {
  late TextEditingController _cauHoiController;
  late TextEditingController _cauTraLoiController;

  @override
  void initState() {
    super.initState();
    _cauHoiController = TextEditingController(
      text: widget.ghiChuBanDau?.cauHoi ?? '',
    );
    _cauTraLoiController = TextEditingController(
      text: widget.ghiChuBanDau?.cauTraLoi ?? '',
    );
  }

  @override
  void dispose() {
    _cauHoiController.dispose();
    _cauTraLoiController.dispose();
    super.dispose();
  }

  void _luu() {
    final cauHoi = _cauHoiController.text.trim();
    final cauTraLoi = _cauTraLoiController.text.trim();

    if (cauHoi.isEmpty || cauTraLoi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đủ câu hỏi và câu trả lời'),
        ),
      );
      return;
    }

    final ghiChuMoi = GhiChu(
      cauHoi: cauHoi,
      cauTraLoi: cauTraLoi,
    );

    Navigator.pop(context, ghiChuMoi);
  }

  @override
  Widget build(BuildContext context) {
    final dangSua = widget.ghiChuBanDau != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(dangSua ? 'Sửa ghi chú' : 'Thêm ghi chú'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEEF2FF), Color(0xFFE0F2FE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _cauHoiController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Câu hỏi',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: TextField(
                  controller: _cauTraLoiController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    labelText: 'Câu trả lời (tiếng Việt)',
                    alignLabelWithHint: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _luu,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    dangSua ? 'Cập nhật' : 'Lưu',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
