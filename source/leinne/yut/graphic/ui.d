module leinne.yut.graphic.ui;

import std.stdio;
import leinne.yut.system.yut;
import org.eclipse.swt.all;

class GameUI{

    private Display display;
    private Shell shell;

    private Composite yutBoard;
    private Composite playerBoard;

    this(){
        display = new Display;
        shell = new Shell(display);
        shell.setLayout(makeGridLayout());
    }

    private auto makeGridLayout(){
        auto layout = new GridLayout;
        layout.marginWidth = layout.marginHeight = layout.verticalSpacing = layout.horizontalSpacing = 0;
        return layout;
    }

    public auto getDisplay(){
        return display;
    }

    public auto getShell(){
        return shell;
    }

    public void initial(){
        //nickname text
        auto nick1 = new Text(shell, SWT.BORDER);
        auto nick2 = new Text(shell, SWT.BORDER);

        //start button
        auto btn = new Button(shell, SWT.NONE);
        btn.setText("게임 시작");
        btn.addListener(SWT.Selection, new class(this) Listener{
            private GameUI ui;
            this(GameUI gameUi){
                ui = gameUi;
            }
            public void handleEvent(Event e){
                auto names = [nick1.getText(), nick2.getText()];
                foreach(control; shell.getChildren) control.dispose();
                ui.makeYutnoriBoard(names[0], names[1]);
            }
        });

        shell.pack();
        shell.open();
    }

    public void makeYutnoriBoard(string nickname, string nickname2){
        shell.setText("윷놀이");
        auto layout = new RowLayout;
        layout.marginLeft = layout.marginRight = layout.marginTop = layout.marginBottom = layout.spacing = 0;
        shell.setLayout(layout);

        yutBoard = new Composite(shell, SWT.NONE);
        yutBoard.setLayout(makeGridLayout());

        playerBoard = new Composite(shell, SWT.NONE);
        playerBoard.setLayout(makeGridLayout());

        makeYutGameBoard();
        makeYutResultAndThrowButton();
        makePlayerBoard(nickname, nickname2);
        shell.pack();
    }

    private void makeYutGameBoard(){
        //윷놀이 게임보드
        auto yutBoard = new Canvas(this.yutBoard, SWT.NONE);
        yutBoard.addPaintListener(new class PaintListener{
            public void paintControl(PaintEvent e) {
                auto image = new Image(display, "resources/YutGameBoard.png");
                e.gc.drawImage(image, 0, 0);
                image.dispose();
            }
        });
        yutBoard.setLayoutData(new GridData(600, 600));
    }

    public void makeYutResultAndThrowButton(){
        auto comp = new Composite(yutBoard, SWT.NONE);
        comp.setLayout(shell.getLayout);
        comp.setLayoutData(new GridData(600, 100));

        //윷 결과창
        auto label = new Label(comp, SWT.WRAP);
        label.setText("");
        label.setLayoutData(new RowData(400, 100));

        //윷 던지기 버튼
        auto button = new Canvas(comp, SWT.NONE);
        button.setLayoutData(new RowData(200, 100));
        button.addPaintListener(new class PaintListener{
            public void paintControl(PaintEvent e) {
                auto image = new Image(display, "resources/ThrowYutButton.png");
                e.gc.drawImage(image, 0, 0);
                image.dispose();
            }
        });
        button.addListener(SWT.MouseDown, new class Listener{
            public void handleEvent(Event e){
                label.setText((label.getText == "" ? "" : label.getText ~ ", ") ~ YutBase.convertKorean(YutBase.result()));
            }
        });
        button.setCursor(new Cursor(display, SWT.CURSOR_HAND));
        button.addDisposeListener(new class DisposeListener{
            public void widgetDisposed(DisposeEvent e){
                button.getCursor().dispose();
            }
        });
    }

    private void makePlayerBoard(string nickname, string nickname2){
        auto playerBoard = new Canvas(this.playerBoard, SWT.NONE);
        playerBoard.addPaintListener(new class PaintListener{
            public void paintControl(PaintEvent e){
                auto image = new Image(display, "resources/PlayerBoard.png");
                e.gc.drawImage(image, 0, 0);
                image.dispose();
            }
        });
        playerBoard.setLayoutData(new GridData(320, 700));
    }

}