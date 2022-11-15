import 'package:chat_box/resources/colors.dart';
import 'package:chat_box/screens/personal_messages_screen.dart';
import 'package:chat_box/screens/school_messages_screen.dart';
import 'package:chat_box/screens/work_messages_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future showWarning() async {
    Future.delayed(
      const Duration(seconds: 20),
      () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Column(
              children: const [
                Text(
                  "You've spent more than five hours chatting today !!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            content: Column(
              children: [
                const Text(
                  "😒",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 75),
                ),
                const SizedBox(
                  height: 5 + 75,
                ),
                TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.orangeColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 75, right: 75),
                    child: Text('Play a game'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.orangeColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 75, right: 75),
                    child: Text('Read a book'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.orangeColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 75, right: 75),
                    child: Text('List to music'),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Close',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        isLoading = false;
      });
    });
    showWarning();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.orangeColor,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
              const IconButton(onPressed: null, icon: Icon(Icons.more_horiz))
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      const Text(
                        "Personal",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(250),
                        ),
                        child: const Center(
                          child: Text("52"),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      const Text(
                        "Work",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: AppColors.work,
                          borderRadius: BorderRadius.circular(250),
                        ),
                        child: const Center(
                          child: Text("34"),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      const Text(
                        "School",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(250),
                        ),
                        child: const Center(child: Text("87")),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            isLoading
                ? Expanded(
                    child: ListView.separated(
                    itemBuilder: (context, index) => const ShimmerSkelton(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemCount: 5,
                  ))
                : const PersonalMessages(),
            const WorkScreen(),
            const SchoolScreen()
          ]),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Wrap(
                        children: [
                          const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Add contact",
                                style: TextStyle(fontSize: 25),
                              )),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                                onPressed: null,
                                style: TextButton.styleFrom(
                                    backgroundColor: AppColors.orangeColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 6, bottom: 6, right: 50, left: 50),
                                  child: Text(
                                    "Add contact to personal chat",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                                onPressed: null,
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColors.orangeColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 6, bottom: 6, right: 50, left: 50),
                                  child: Text("Add contact to personal chat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15)),
                                )),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                                onPressed: null,
                                style: TextButton.styleFrom(
                                  backgroundColor: AppColors.orangeColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 6, bottom: 6, right: 50, left: 50),
                                  child: Text("Add contact to personal chat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15)),
                                )),
                          )
                        ],
                      ),
                    );
                  });
            },
            backgroundColor: AppColors.orangeColor,
            child: const Icon(Icons.add),
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        ));
  }
}

class ShimmerSkelton extends StatelessWidget {
  const ShimmerSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ShimmerContainer(
            height: 80,
            width: 80,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerContainer(
              width: 80,
            ),
            const SizedBox(
              height: 8,
            ),
            const ShimmerContainer(),
            const SizedBox(
              height: 8,
            ),
            const ShimmerContainer(),
            const SizedBox(
              height: 8,
            ),
            const ShimmerContainer(),
            const SizedBox(
              height: 8,
            ),
            const ShimmerContainer(),
            Row(
              children: const [
                Expanded(child: ShimmerContainer()),
                SizedBox(
                  width: 16,
                ),
                Expanded(child: ShimmerContainer()),
              ],
            )
          ],
        ))
      ],
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double? height, width, borderRadius;
  const ShimmerContainer({Key? key, this.height, this.width, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(85),
      ),
    );
  }
}
