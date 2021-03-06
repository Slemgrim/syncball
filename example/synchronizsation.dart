import "dart:html" hide Screen;
import "package:syncball/sync_ball.dart";
import "package:syncball/client.dart";

void main(){
  Server server = createServer();

  createClient(server);
}

Server createServer() {
  Screen screen = new CanvasScreen(
      querySelector("#server"),
      new FrameClock()
  );

  Server server = new DummyServer(new InfiniteClock(new Duration(milliseconds: 70)));
  server.onUpdate.listen(screen.pushState);
  return server;
}

void createClient(Server server) {
  Screen screen = new CanvasScreen(
      querySelector("#client"),
      new FrameClock()
  );

  DummyGame game = new DummyGame.fromState(server.state);
  game.onUpdate.listen(screen.pushState);
  server.onUpdate.listen(game.pushState);
}