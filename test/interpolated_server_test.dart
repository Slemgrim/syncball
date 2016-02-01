import "package:test/test.dart";
import "dart:async";
import "package:syncball/sync_ball.dart";

void main() {

  InterpolatedServer iServer;

  setUp((){
    Clock clock = new Clock(3, new Duration(seconds: 0));
    iServer = new InterpolatedServer(clock);
    iServer.pushState(new State(0.0, null));
  });

  test('it implements server', (){
    expect(iServer is Server, true);
  });

  test('it implements screen', (){
    expect(iServer is Screen, true);
  });

  test('it accepts states', (){
    iServer.pushState(new State(0.0, null));
  });

  test('it provides a State stream', (){
    Stream<State> stream = iServer.onUpdate;
  });

  test('it streams updated based on clock', (){
//    iServer.onUpdate.listen(expectAsync((State state){
//      expect(state is State, true);
//    }, count: 3));
  });
}