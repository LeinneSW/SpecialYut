module leinne.yut.system.player;

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

    public string getName(){
        return name;
    }

}

class Marker{

    this(){

    }
}
