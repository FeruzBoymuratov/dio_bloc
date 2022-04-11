import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio_bloc/blocs/list_post_cubit.dart';
import 'package:dio_bloc/blocs/list_post_state.dart';
import 'package:dio_bloc/model/post_model.dart';
import 'package:dio_bloc/pages/create_page.dart';
import 'package:dio_bloc/views/view_of_home.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];

  // _apiPostList || _apiPostDelete
  //
  // _apiPostList() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
  //
  //   setState(() {
  //     if (response != null) {
  //       items = Network.parsePostList(response);
  //     }
  //
  //     isLoading = false;
  //   });
  // }
  //
  // _apiPostDelete(Post post) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
  //
  //   setState(() {
  //     if (response != null) {
  //       _apiPostList();
  //     }
  //
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dio'" / "
            'bloC'),
      ),
      body: BlocBuilder<ListPostCubit, ListPostState> (
        builder: (BuildContext context, ListPostState state) {
          if(state is ListPostError) {
            return viewOfHome(items, true);
          }

          if (state is ListPostLoaded) {
            items = state.posts;
            return viewOfHome(items, false);
          }

          return viewOfHome(items, true);
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}