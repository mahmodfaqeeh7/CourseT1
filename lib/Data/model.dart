class Champs {

  final String name;
 // final String country;
  final String path;

  //const Champs(this.name, this.img , this.title);

  Champs.fromJson(Map json)
      :name = json['name']['common'],
        path = json['flags']['png'];

  Map toJson() {
    return { 'name': name, 'path': path};
  }
}

class Apilist
{
  List<Champs> apilist;

 Apilist({required this.apilist});

factory Apilist.fromJson(List<dynamic> data)
{
  List<Champs> list = [];
  list = data.map((apiitem) => Champs.fromJson(apiitem)).toList();
  return Apilist(apilist: list);
}

}