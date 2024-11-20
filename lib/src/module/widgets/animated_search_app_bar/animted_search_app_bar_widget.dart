import 'package:flutter/material.dart';

class AnimatedSearchAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const AnimatedSearchAppBar({super.key});

  @override
  State<AnimatedSearchAppBar> createState() => _AnimatedSearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AnimatedSearchAppBarState extends State<AnimatedSearchAppBar> {
  bool toogle = true;

  void onToggle() {
    setState(() {
      toogle = !toogle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Search Bar'),
              SizedBox(
                height: kTextTabBarHeight * 0.8,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: onToggle,
                      icon: const Icon(
                        Icons.search,
                        size: 24.0,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: toogle ? 0 : MediaQuery.of(context).size.width,
            transform: Matrix4.translationValues(
                toogle ? MediaQuery.of(context).size.width : 0, 0, 0),
            height: kToolbarHeight * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                width: 1,
                color: Colors.grey[600]!,
              ),
            ),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                prefix: AnimatedOpacity(
                  opacity: toogle ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  child: IconButton(
                    onPressed: onToggle,
                    icon: const Icon(Icons.arrow_back_ios),
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
