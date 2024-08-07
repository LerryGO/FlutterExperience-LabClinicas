import 'package:lab_clinicas_core/lab_clinicas_core.dart';

abstract interface class PainelRepository {
  Future<Either<RepositoryException, String>> callOnPanel(String password, int attendantDesk);
}
