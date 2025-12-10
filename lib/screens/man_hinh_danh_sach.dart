import 'package:flutter/material.dart';
import '../data/du_lieu_mau.dart';
import '../models/ghi_chu.dart';
import '../widgets/item_ghi_chu.dart';
import 'man_hinh_them_sua.dart';

class ManHinhDanhSach extends StatefulWidget {
  const ManHinhDanhSach({super.key});

  @override
  State<ManHinhDanhSach> createState() => _ManHinhDanhSachState();
}

class _ManHinhDanhSachState extends State<ManHinhDanhSach> {
  final List<GhiChu> _dsGhiChu = List.from(duLieuGhiChuMau);

  void _hienCauTraLoi(GhiChu ghiChu) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return DraggableScrollableSheet(
          initialChildSize: 0.45,
          maxChildSize: 0.85,
          minChildSize: 0.3,
          builder: (context, controller) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Text(
                    ghiChu.cauHoi,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: controller,
                      child: Text(
                        ghiChu.cauTraLoi,
                        style: const TextStyle(fontSize: 15, height: 1.4),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _moManHinhThemSua({GhiChu? ghiChu, int? index}) async {
    final ketQua = await Navigator.push<GhiChu>(
      context,
      MaterialPageRoute(
        builder: (_) => ManHinhThemSua(ghiChuBanDau: ghiChu),
      ),
    );

    if (ketQua != null) {
      setState(() {
        if (ghiChu == null) {
          _dsGhiChu.add(ketQua);
        } else if (index != null) {
          _dsGhiChu[index] = ketQua;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Ghi chú lý thuyết tuần 5'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D4ED8), Color(0xFF38BDF8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Danh sách câu hỏi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.menu_book_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF9FAFB),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  child: _dsGhiChu.isEmpty
                      ? const Center(
                          child: Text(
                            'Chưa có ghi chú nào.\nHãy nhấn dấu + để thêm.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.only(top: 12, bottom: 80),
                          itemCount: _dsGhiChu.length,
                          itemBuilder: (context, index) {
                            final ghiChu = _dsGhiChu[index];
                            return ItemGhiChu(
                              ghiChu: ghiChu,
                              onTap: () => _hienCauTraLoi(ghiChu),
                              onEdit: () => _moManHinhThemSua(
                                ghiChu: ghiChu,
                                index: index,
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _moManHinhThemSua(),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Thêm câu'),
      ),
    );
  }
}
