import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:my_heroes/heroes_module/data/hero_repository.dart';
import 'package:my_heroes/heroes_module/data/remote_datasource/entity/dto.dart';
import 'package:my_heroes/heroes_module/data/remote_datasource/hero_service_rest.dart';
import 'package:my_heroes/heroes_module/data/remote_datasource/remote_datasource.dart';
import 'package:my_heroes/heroes_module/domain/hero.dart';
import 'package:my_heroes/heroes_module/domain/usecase/hero_use_case.dart';

class HeroServiceTest implements HeroService {

  var value = StatusResponse(
      200,
      "OK",
      DataResponse<List<HeroResponse>>(
          20,
          20,
          3,
          3,
          [
            HeroResponse(1, 'Name 1', 'Description 1', Thumbnail("image1", 'jpg')),
            HeroResponse(2, 'Name 2', 'Description 2', Thumbnail("image2", 'jpg')),
            HeroResponse(4, 'Name 3', 'Description 3', Thumbnail("image3", 'jpg')),
          ]
      )
  );

  @override
  Future<StatusResponse> fetchHeroes({int length = 0}) {
      return Future.value(value);
  }
}

@GenerateMocks([HeroServiceTest])
Future<void> main() async {
  late HeroService heroServiceMock;
  late GetHeroUseCase useCase;

  setUpAll(() => {
    heroServiceMock = HeroServiceTest(),
    useCase = GetHeroUseCase(
        repository: HeroRepositoryImpl(
            remoteDataSource: RemoteDataSourceImpl(service: heroServiceMock)
        )
    )
  });

  group('Fetch heroes', () {
    test('successfully request', () async {

      var expected = [
        Hero(image: 'image1.jpg',  name: 'Name 1'),
        Hero(image: 'image2.jpg',  name: 'Name 2'),
        Hero(image: 'image3.jpg',  name: 'Name 3'),
      ];

      var result = await useCase.execute(0);

      expect(result, expected);
    });

  });
}