import org.eclipse.swt.all;
import leinne.yut.game.yut;
import leinne.yut.graphic.ui;

void main(){
    auto game = YutGame.getInstance();
    auto gameUi = GameUI.getInstance();
    gameUi.initial();

    auto display = gameUi.getDisplay();
    while(!gameUi.getShell().isDisposed()) if(!display.readAndDispatch()) display.sleep();
    display.dispose();
}
