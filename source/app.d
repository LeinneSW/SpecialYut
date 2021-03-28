import org.eclipse.swt.all;
import leinne.yut.graphic.ui;
import leinne.yut.system.yut;

void main(){
    auto gameUi = new GameUI();
    gameUi.initial();

    auto display = gameUi.getDisplay();
    while(!gameUi.getShell().isDisposed) if(!display.readAndDispatch) display.sleep();
    display.dispose();
}
