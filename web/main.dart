library client;

import "dart:html" hide Screen;

import "package:syncball/sync_ball.dart";
import "package:syncball/client.dart";

void main(){
  CanvasElement serverCanvas = querySelector("#server") as CanvasElement;
  CanvasElement clientCanvas = querySelector("#client") as CanvasElement;

  Server server = new PointServer(new InfiniteClock(new Duration(milliseconds: 300)));

  Clock renderClock = new FrameClock();
  Screen serverScreen = new CanvasScreen(serverCanvas, renderClock);
  Screen clientScreen = new CanvasScreen(clientCanvas, renderClock);

  server.onUpdate.listen(serverScreen.pushState);

  InterpolatedServer iServer = new InterpolatedServer(
      new InfiniteClock(new Duration(milliseconds: 16)), 1.0);

  server.onUpdate.listen(iServer.pushState);
  iServer.onUpdate.listen(clientScreen.pushState);
}