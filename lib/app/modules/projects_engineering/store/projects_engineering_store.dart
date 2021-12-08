import 'package:mobx/mobx.dart';

import '../model/projects_eng_model.dart';
import '../service/projects_ engineering_service.dart';

part 'projects_engineering_store.g.dart';

class ProjectsEngineeringStore = _ProjectsEngineeringStore
    with _$ProjectsEngineeringStore;

abstract class _ProjectsEngineeringStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<ProjectsEngineeringModel>>? postsListFuture;

  @action
  Future fetchPosts() => postsListFuture = ObservableFuture(httpClient
      .getPosts('http://z650l.mocklab.io/json/projectsengineering')
      .then((posts) => posts));

  void getThePosts() {
    fetchPosts();
  }
}
