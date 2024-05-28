import 'package:flutter/material.dart';
import 'package:flutter_veli_bacik1/202/cache/shared_cache_learn.dart';
import 'package:flutter_veli_bacik1/202/cache/shared_manager.dart';
import 'package:flutter_veli_bacik1/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_veli_bacik1/202/cache/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager userCacheManager;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    InitializeAndSave();
  }

  Future<void> InitializeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();
    await manager.init();
    userCacheManager = UserCacheManager(manager);
    _users = userCacheManager.getItems() ?? [];
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isloading ? CircularProgressIndicator.adaptive() : SizedBox.shrink(),
        actions: isloading
            ? null
            : [
                //todo: LİSTEYİ CACHE ALIYORUZ
                IconButton(
                  onPressed: () async {
                    changeLoading();
                    await userCacheManager.saveItems(_users);
                    changeLoading();
                  },
                  icon: Icon(
                    Icons.download_outlined,
                    color: Colors.white,
                  ),
                ),

                //TODO :LİSTEYİ CACHEDEN SİLİYORUZ.
                IconButton(
                    onPressed: () {
                      changeLoading();
                      changeLoading();
                    },
                    icon: Icon(
                      Icons.remove_outlined,
                      color: Colors.white,
                    ))
              ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ""),
            subtitle: Text(users[index].description ?? ""),
            trailing: TextButton(
              child: Text(
                users[index].url ?? "",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
              ),
              onPressed: () {
                launchUrl(Uri.parse("https:///www.belek.edu.tr"));
              },
            ),
          ),
        );
      },
    );
  }
}
