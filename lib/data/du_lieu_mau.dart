import '../models/ghi_chu.dart';

final List<GhiChu> duLieuGhiChuMau = [
  GhiChu(
    cauHoi: 'Câu 1: Flutter là gì?',
    cauTraLoi:
        'Flutter là bộ SDK phát triển ứng dụng đa nền tảng của Google, dùng ngôn ngữ Dart để xây dựng UI native cho Android và iOS.',
  ),
  GhiChu(
    cauHoi: 'Câu 2: Widget trong Flutter là gì?',
    cauTraLoi:
        'Widget là đơn vị cơ bản để xây dựng giao diện. Mọi thứ hiển thị trên màn hình trong Flutter đều là widget.',
  ),
  GhiChu(
    cauHoi: 'Câu 3: Khác nhau giữa StatelessWidget và StatefulWidget?',
    cauTraLoi:
        'StatelessWidget không thay đổi trạng thái sau khi build. StatefulWidget có thể thay đổi state và dùng setState để cập nhật UI.',
  ),
  GhiChu(
    cauHoi: 'Câu 4: Hot reload là gì?',
    cauTraLoi:
        'Hot reload cho phép cập nhật code và UI nhanh mà không mất trạng thái hiện tại của ứng dụng.',
  ),
];
