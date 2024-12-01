import 'package:flutter/widgets.dart';
import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/helper/spacing.dart';
import 'package:fruit_hub/core/widgets/search_text_filed.dart';
import 'package:fruit_hub/features/home/presentation/view/widgets/home_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical:16 ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const HomeAppBar(),
                verticalSpacing(16),
                const Padding(
                  padding: EdgeInsets.symmetric(  
                      horizontal: kHorizontalPadding),
                  child: SearchTextField(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
