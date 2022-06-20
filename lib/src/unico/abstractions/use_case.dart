abstract class UseCase<Out, In> {
  Out call(In param);
}

class NoParams {}
