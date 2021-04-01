module leinne.yut.game.yut;

import std.random;
import leinne.yut.graphic.ui;

class Yut{

    public static const FRONT = 0;
    public static const BACK = 1;

    public static const NAK = -2;
    public static const BACKDO = -1;
    public static const MO = 0;
    public static const DO = 1;
    public static const GAE = 2;
    public static const GEOL = 3;
    public static const YUT = 4;

    private static int throwOneYut(){
        return uniform!"[]"(1, 100) <= 38 ? FRONT : BACK;
    }

    public static int result(){
        if(uniform!"[]"(1, 150) == 1)
            return NAK;

        int back = throwOneYut();
        auto backDo = back == BACK;
        foreach(a; [0, 1, 2]) back += throwOneYut();
        return (backDo && back == 1 ? BACKDO : back);
    }

    public static string convertKorean(int result){
        switch(result){
            case NAK:
                return "낙";
            case BACKDO:
                return "뒷도";
            case MO: //모
                return "모";
            case DO: //도
                return "도";
            case GAE: //개
                return "개";
            case GEOL: //걸
                return "걸";
            case YUT: //윷
                return "윷";
            default:
                return "";
        }
    }
}

/**
  * 구현해야할 것
  * 턴제
  * 턴 남은시간 타이머
  *
  *
  */
class YutGame{

    private static YutGame instance = null;

    this(){
    }

    public static YutGame getInstance(){
        if(instance is null){
            instance = new YutGame();
        }
        return instance;
    }

}