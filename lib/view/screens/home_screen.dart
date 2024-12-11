import 'package:flutter/material.dart';
import 'package:movienest/data/models/movies_model.dart';
import 'package:movienest/data/services/get_top_movies_service.dart';
import 'package:movienest/view/widgets/movies_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  MoviesModel moviesModel = MoviesModel();
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Movies Nest",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<MoviesModel>(
              future: GetTopMoviesService().getTopMovies(currentPage),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final movie = snapshot.data!;
                  return GridView.builder(
                      controller: _controller,
                      itemCount: movie.results?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return MoviesCard(movie: movie.results![index]);
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    if (currentPage > 1) {
                      _controller.animateTo(0,
                          duration: Duration(milliseconds: 50),
                          curve: Curves.easeIn);
                      setState(() {
                        currentPage--;
                      });
                    }
                  },
                  child: Text("Previews")),
              Text(
                '< Page $currentPage >',
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  _controller.animateTo(0,
                      duration: Duration(milliseconds: 50),
                      curve: Curves.easeIn);
                  setState(() {
                    currentPage++;
                  });
                },
                child: Text('Next'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
