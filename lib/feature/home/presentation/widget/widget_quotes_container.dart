import 'package:flutter/material.dart';
import 'package:healthy_mind/feature/home/presentation/quotes_screen.dart';
import 'package:healthy_mind/helpers/app_colors.dart';
import 'package:healthy_mind/helpers/app_images.dart';
import 'package:healthy_mind/helpers/app_text_styles.dart';

class WidgetQuotesContainer extends StatefulWidget {
  const WidgetQuotesContainer(
      {super.key,
      required this.quotes,
      required this.isActive,
      required this.onTap});
  final String quotes;
  final bool isActive;
  final Function() onTap;

  @override
  State<WidgetQuotesContainer> createState() => _WidgetQuotesContainerState();
}

class _WidgetQuotesContainerState extends State<WidgetQuotesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(AppImages.containBgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(
            widget.quotes,
            style: AppTextStyles.s16W300(color: Colors.black),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QuotesScreen(),
                ),
              );
              setState(() {});
            },
            child: InkWell(
              onTap: widget.onTap,
              child: Container(
                height: 30,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chosen',
                        style: AppTextStyles.s12W400(
                          color: AppColors.color38B6FFBLue,
                        ),
                      ),
                      widget.isActive
                          ? Image.asset(
                              AppImages.checkIcon,
                              width: 10,
                              color: AppColors.color38B6FFBLue,
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  
  }
}
