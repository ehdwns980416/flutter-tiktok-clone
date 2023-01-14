import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final Widget? targetScreen;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    this.targetScreen,
  });

  // 버튼 클릭 시, 네비게이션 이동
  void _onButtonTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => targetScreen!,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 타입이 Widget 일 경우에만 함수 실행
      onTap: () => targetScreen is Widget ? _onButtonTap(context) : null,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(Sizes.size14),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
