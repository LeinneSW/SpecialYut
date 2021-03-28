import std.stdio;
import std.conv;
import std.uni : isWhite;
import std.array;
import std.string;
import std.datetime;
import std.math;
import core.thread;
import org.eclipse.swt.all;

import leinne.yut.graphic.ui;
import leinne.yut.system.yut;

string manyGame(long count){
	auto arr = [
        "낙": 0.0,
        "모": 0.0,
        "뒷도": 0.0,
        "도": 0.0,
        "개": 0.0,
        "걸": 0.0,
        "윷": 0.0
    ];
    for(long i = 0; i < count; ++i){
		++arr[YutBase.convertKorean(YutBase.result())];
    }
    auto sum = 0.0;
    auto str = count.to!string ~ "회 결과: ";
    foreach(key; ["낙", "모", "뒷도", "도", "개", "걸", "윷"]){
        auto val = arr[key];
        sum += val * 100 / count;
        if(val > 0)
            str ~= "%s: %.5f%% ".format(key, val * 100 / count);
    }
    return str ~ "\n확률의 총 계: %.5f".format(sum);
}

/*class ConsoleIO : Thread{

	this(){
		super(&run);
	}

	private void run() {
		try{
			auto n = stdin.readln.strip.to!long;
			if(n == 0)
				return;
			auto now = Clock.currTime();
			n.manyGame.writeln;
			(Clock.currTime() - now).writeln;
		}catch(Throwable e){}
	}

}*/

void main(){
    auto gameUi = new GameUI();
    gameUi.initial();
    auto shell = gameUi.getShell();
    auto display = gameUi.getDisplay();
    while(!shell.isDisposed) if(!display.readAndDispatch) display.sleep();
    display.dispose();

    /*while(true){
        try{
            writeln("윷을 던지고 싶은 개수를 입력해 주세요");
            stdout.flush();
            auto n = stdin.readln.strip.to!long;
            if(n == 0)
                return;
            auto now = Clock.currStdTime();
            n.manyGame.writeln;
            "걸린 시간: %.10f초".writefln((Clock.currStdTime() - now) / 10000000.0);
        }catch(Throwable e){
            writeln("올바른 값을 입력해 주세요");
        }
    }*/
}
