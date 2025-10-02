import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:elegant_hopo_technical_assessment/core/error/failures.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/entities/user.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/repositories/user_repository.dart';
import 'package:elegant_hopo_technical_assessment/features/user/domain/usecases/get_user.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetUser usecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = GetUser(mockUserRepository);
  });

  const testUserId = '1';
  const testUser = User(
    id: testUserId,
    name: 'John Doe',
    email: 'john.doe@example.com',
  );

  group('GetUser', () {
    test('should get a user from the repository', () async {
      // Arrange
      when(
        () => mockUserRepository.getUser(testUserId),
      ).thenAnswer((_) async => const Right(testUser));

      // Act
      final result = await usecase(testUserId);

      // Assert
      expect(result, const Right(testUser));
      verify(() => mockUserRepository.getUser(testUserId));
      verifyNoMoreInteractions(mockUserRepository);
    });

    test('should return a failure when the repository fails', () async {
      // Arrange
      when(
        () => mockUserRepository.getUser(testUserId),
      ).thenAnswer((_) async => const Left(ServerFailure()));

      // Act
      final result = await usecase(testUserId);

      // Assert
      expect(result, const Left(ServerFailure()));
      verify(() => mockUserRepository.getUser(testUserId));
      verifyNoMoreInteractions(mockUserRepository);
    });
  });
}
