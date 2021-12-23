abstract class UseCase<TResult, TParam> {
  Future<TResult> call(TParam param);
}
