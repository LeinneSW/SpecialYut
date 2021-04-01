module leinne.yut.game.player;

class Player{

    private string name;
    private Marker[] markers = [
        new Marker(),
        new Marker(),
        new Marker(),
        new Marker()
    ];

    this(string name){
        this.name = name;
    }

    public auto getName(){
        return name;
    }

    public auto getMarkers(){
        return markers;
    }

    public auto getMarker(int index){
        return markers[index];
    }

}

/**
  * Markers are the core objects of yutnori.
  * You can move the marker as much as the result of yut, and if all 4 markers reach the finish line, that player wins.
  *
  * 말이란 윷놀이의 핵심 물건입니다. 영어로는 Marker라고 합니다.
  * 윷의 결과만큼 말을 움직일 수 있으며, 마커 4개가 모두 결승 지점에 도달했을 경우 도달한 플레이어가 승리하게 됩니다.
  */
class Marker{

    this(){

    }
}