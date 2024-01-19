abstract class Mapper<Input, Output> {
  Output map(Input input);

  Input restore(Output output);

  Output call(Input input) {
    return map(input);
  }
}

extension Mappers<Input, Output> on Mapper<Input, Output> {
  List<Output> maps(List<Input> list) {
    return list.map(map).toList();
  }

  List<Input> restores(List<Output> list) {
    return list.map(restore).toList();
  }
}
