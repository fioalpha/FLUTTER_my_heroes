import '../../data/hero_repository.dart';
import '../hero.dart';

class GetHeroUseCase {

  final HeroRepository repository;

  GetHeroUseCase({required this.repository});

  Future<List<Hero>> execute(int length){
    return repository.fetchListHero(length);
  }
}