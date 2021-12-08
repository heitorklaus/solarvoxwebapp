// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:solarvox/app/modules/projects_engineering/store/projects_engineering_store.dart';
import 'package:solarvox/app/modules/projects_engineering/view/web/widgets.dart';
import 'package:solarvox/app/shared/utils/mobile_app_bar.dart';
import 'package:solarvox/app/shared/utils/theme_selector.dart';
import 'package:solarvox/app/shared/utils/view_wrapper.dart';
import 'package:solarvox/app/shared/utils/web_app_bar.dart';
import 'package:solarvox/app/shared/widgets/navigation_arrow.dart';
import 'package:flutter/material.dart';

import '../model/projects_eng_model.dart';
import 'widgets/item_produto.dart';

class ProjectsEngineeringPage extends StatefulWidget {
  final String title;
  const ProjectsEngineeringPage(
      {Key? key, this.title = 'ProjectsEngineeringPage'})
      : super(key: key);
  @override
  ProjectsEngineeringPageState createState() => ProjectsEngineeringPageState();
}

class ProjectsEngineeringPageState extends State<ProjectsEngineeringPage> {
  ProjectsEngineeringStore store = ProjectsEngineeringStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.getThePosts();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

// Metodos de tela

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Widgets Desktop

  Widget searchTextFieldDesktop() {
    return TextField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        hintText: 'Digite sua busca',
        alignLabelWithHint: true,
        hintStyle: const TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
        fillColor: Colors.white,
      ),
    );
  }

  _ajustarVisualizacao(double larguraTela) {
    int colunas = 2;
    if (larguraTela <= 600) {
      colunas = 2;
    } else if (larguraTela <= 960) {
      colunas = 4;
    } else {
      colunas = 6;
    }
    return colunas;
  }

  Widget desktopView() {
    return LayoutBuilder(builder: (context, constraint) {
      var largura = constraint.maxWidth;
      var alturaBarra = AppBar().preferredSize.height;

      return Scaffold(
        appBar: largura < 600
            ? PreferredSize(
                child: MobileAppBar(),
                preferredSize: Size(largura, alturaBarra))
            : PreferredSize(
                child: WebAppBar(), preferredSize: Size(largura, alturaBarra)),
        body: Padding(padding: EdgeInsets.all(16), child: retornaGrid(largura)),
      );
    });
  }

  Widget mobileView() {
    return LayoutBuilder(builder: (context, constraint) {
      var largura = constraint.maxWidth;
      var alturaBarra = AppBar().preferredSize.height;

      return Scaffold(
        appBar: largura < 600
            ? PreferredSize(
                child: MobileAppBar(),
                preferredSize: Size(largura, alturaBarra))
            : PreferredSize(
                child: WebAppBar(), preferredSize: Size(largura, alturaBarra)),
        body: Padding(padding: EdgeInsets.all(16), child: retornaGrid(largura)),
      );
    });
  }

  widgetLayoutLastProjects() {
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.02, right: screenWidth * 0.02),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.02),
          Container(
              alignment: Alignment.topLeft,
              child: header('Últimos projetos', getFontSize(false), context)),
          const Divider(
            color: Colors.black38,
          ),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }

  retornaGrid(largura) {
    final future = store.postsListFuture;

    return Observer(
      builder: (_) {
        switch (future!.status) {
          case FutureStatus.pending:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case FutureStatus.rejected:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Failed to load items.',
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: const Text('Tap to retry'),
                    onPressed: _refresh,
                  )
                ],
              ),
            );
          case FutureStatus.fulfilled:
            final List<ProjectsEngineeringModel> posts = future.result;
            //print(posts);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: GridView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ItemProduto("Kit Multimídia", "2.200,00", "p1.jpg");
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _ajustarVisualizacao(largura),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
              ),

              // child: ListView.builder(
              //   physics: const AlwaysScrollableScrollPhysics(),
              //   itemCount: posts.length,
              //   itemBuilder: (context, index) {
              //     final post = posts[index];
              //     return ExpansionTile(
              //       title: Text(
              //         post.nome_equipamento_gerador,
              //         style: const TextStyle(fontWeight: FontWeight.w600),
              //       ),
              //       children: <Widget>[Text(post.imagem_equipamento)],
              //     );
              //   },
              // ),
            );
            break;
        }
      },
    );
  }

  Future _refresh() => store.fetchPosts();
}
