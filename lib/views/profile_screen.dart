import 'package:first_app/providers/list_provider.dart';
import 'package:first_app/widgets/profile_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CircleAvatar(
                  foregroundImage: NetworkImage(
                      "https://media.istockphoto.com/id/1226886130/photo/3d-illustration-of-smiling-happy-man-with-laptop-sitting-in-armchair-cartoon-businessman.jpg?s=612x612&w=is&k=20&c=yQPWrl5UNJA8paYoKTmcJyESzgeKvgBOHso1UzdfEcM=")),
              const SizedBox(
                height: 10,
              ),
              const Text("Nesrine Halouani"),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    ProfileItem(title: "Posts", value: 5),
                    ProfileItem(title: "Likes", value: 0),
                    ProfileItem(title: "Followers", value: 200),
                  ]),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Consumer<ListProvider>(
                  builder: (context, value, child) {
                    return value.isLoading
                        ? const CupertinoActivityIndicator()
                        : GridView.builder(
                            itemCount: value.list.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 170
                                    //childAspectRatio: 0.4
                                    ),
                            itemBuilder: (context, index) {
                              return Stack(children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Image.network(
                                    value.list[index].image!,
                                    fit: BoxFit.cover,
                                    // width: 100,
                                    // height: 100,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                      onPressed: () {
                                        Provider.of<ListProvider>(context,
                                                listen: false)
                                            .onPressLike(index);
                                      },
                                      icon: Icon(
                                          value.list[index].isLiked!
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: Colors.red)),
                                )
                              ]);
                            },
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
