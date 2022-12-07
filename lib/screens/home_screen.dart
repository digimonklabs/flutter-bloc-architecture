import 'package:bloc_demo/core/image_utils.dart';
import 'package:bloc_demo/model/news_model.dart';
import 'package:bloc_demo/news_bloc/news_bloc.dart';
import 'package:bloc_demo/repos/repositories.dart';
import 'package:bloc_demo/widgets/widget_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Bloc Demo", style: TextStyle(color: Colors.black),),
        ),
        body: BlocProvider(
          create: (context) => NewsBloc(RepositoryProvider.of<NewsRepositories>(context))..add(LoadNewsEvent()),
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state){
              if(state is NewsLoadingState) {
                return const Center(child: CircularProgressIndicator(),);
              }

              if(state is NewsLoadedState) {
                List<ArticlesItem> newsModelList = state.newsModelList;
                return Container(
                  margin: const EdgeInsets.only(left: 10,right: 10, top: 20),
                  child: ListView.builder(
                      itemCount: newsModelList.length,
                      itemBuilder: (context, index){
                    return Card(
                      color: Colors.white60,
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white60,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Stack(
                              children:[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    newsModelList[index].urlToImage.toString(),
                                    fit: BoxFit.fill,
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    loadingBuilder:
                                        (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent?
                                        loadingProgress) {
                                      if (loadingProgress == null)
                                        return child;
                                      return Center(
                                        child:
                                        CircularProgressIndicator(
                                          color: Colors.blue,
                                          value: loadingProgress
                                              .expectedTotalBytes !=
                                              null
                                              ? loadingProgress
                                              .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                        IC_NO_IMG,
                                        fit: BoxFit.fill,
                                        height: 120,
                                        width: MediaQuery.of(context).size.width,
                                      );
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: <Widget>[
                                        WidgetText
                                            .widgetPoppinsMaxLineOverflowText(
                                            newsModelList[index].source.name,
                                            Colors.white,
                                            20,
                                            align: TextAlign.right,
                                            maxline: 1),
                                        newsModelList[index].author.isEmpty ? Container() :
                                        WidgetText
                                            .widgetRegularOverflowText(
                                            newsModelList[index].author,
                                            Colors.white,
                                            16,
                                            align: TextAlign.right,
                                            maxline: 1),
                                      ],
                                    ),
                                  ),
                                ),
                                ]
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: WidgetText
                                  .widgetPoppinsMaxLineOverflowText(
                                  newsModelList[index].title,
                                  Colors.black,
                                  16,
                                  align: TextAlign.left,
                                  maxline: 2),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: WidgetText
                                  .widgetRegularOverflowText(
                                  newsModelList[index].description,
                                  Colors.black,
                                  16,
                                  align: TextAlign.left,
                                  maxline: 3),
                            ),
                          ]

                        ),
                      ),
                    );
                  }),
                );
              }

              if(state is NewsErrorState){
                return Center(child: WidgetText.widgetRobotoRegularText(
                    "Error",
                    Colors.red,
                    16,
                    align: TextAlign.left, ),);
              }

              return Container();
            },
          ),
        ));
  }
}
