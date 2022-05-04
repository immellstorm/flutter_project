import 'package:flutter/material.dart';
import 'package:flutter_project/app/model/film_card_model.dart';
import 'package:flutter_project/app/widgets/buttons/primary_button.dart';
import 'package:flutter_project/app/widgets/film_card.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<FilmCardModel> movies = [];
  bool isChecked = false;

  Future<List<FilmCardModel>> _getFilms() async {
    await Future.delayed(const Duration(seconds: 1));
    List<FilmCardModel> filmsList = [
      const FilmCardModel(
          id: 0,
          title: 'Batmen',
          picture:
              'https://img1.akspic.ru/originals/8/2/9/5/6/165928-the_batman_2022_poster-2560x1440.jpg',
          voteAverage: 1.5,
          releaseDate: '20.06.1997',
          description: 'Богатый псих ловит психов победнее'),
      const FilmCardModel(
          id: 1,
          title: 'Superman',
          picture:
              'https://static2.srcdn.com/wordpress/wp-content/uploads/2018/01/Superman-Red-Son-Gotham-by-Gaslight-Animation.jpg',
          voteAverage: 4.5,
          releaseDate: '14.06.2013',
          description: 'Destroyed my planet, help destroy someone else'),
      const FilmCardModel(
          id: 2,
          title: 'Aquaman',
          picture:
              'https://cdn.fishki.net/upload/post/2019/03/27/2925512/bf388f6238417a1ee4b748f6c50da272.jpg',
          voteAverage: 5.5,
          releaseDate: '13.12.2018',
          description:
              'Вот что бывает, когда простой моряк начинает спать с русалками'),
      const FilmCardModel(
          id: 3,
          title: 'Catwoman',
          picture: 'https://gamebomb.ru/files/galleries/001/d/df/340189.jpg',
          voteAverage: 6.5,
          releaseDate: '20.06.1997',
          description: 'Женщина сошла с ума и решила что ей пора ловить мышей'),
      const FilmCardModel(
          id: 4,
          title: 'Antman',
          picture:
              'https://www.animatedtimes.com/wp-content/uploads/2021/01/peyton-reed-ant-man-3.jpg',
          voteAverage: 7.5,
          releaseDate: '14.06.2013',
          description:
              'Мощеник выпивает элексир и начинает бухать с муровьями'),
      const FilmCardModel(
          id: 5,
          title: 'Ironman',
          picture: 'https://i.artfile.ru/2880x1800_807289_[www.ArtFile.ru].jpg',
          voteAverage: 8.5,
          releaseDate: '13.12.2018',
          description:
              'Вот что бывает, когда простой моряк начинает спать с русалками'),
    ];

    return filmsList;
  }

  @override
  void initState() {
    _getFilms().then((value) {
      setState(() {
        movies = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/settings',
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: isChecked,
                        onChanged: (bool? changeValue) {
                          setState(() {
                            isChecked = changeValue ?? false;
                          });
                        }),
                    const Text(
                      'Рейтинг больше 5',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'ChakraPetch-Medium',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  child: PrimaryButton(
                    'Search',
                    onPressed: filterFilms,
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 8,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilmCard.fromModel(model: movies[index]),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> filterFilms() async {
    await _getFilms().then((valueFilms) {
      setState(() {
        if (isChecked) {
          movies =
              valueFilms.where((element) => element.voteAverage > 5).toList();
        } else {
          movies = valueFilms;
        }
      });
    });
  }
}
