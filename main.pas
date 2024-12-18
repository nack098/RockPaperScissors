program RockPaperScissors;
uses crt;
type
    (* 
        In here I changed Result state for Finish becuase of
       Result is a reserve word in Pascal
    *)

    TGameState = (GMain = 0, GGameplay, GWin, GDraw, GLose);


procedure UI_Main(var index: Integer);
var
    menu_list: Array of String;
    i: Integer;

begin
    menu_list := ['Start', 'End'];
    WriteLn('---------------------------------');
    WriteLn('| Rock Paper Scissors in Pascal |');
    WriteLn('---------------------------------');
    for i := 0 to 1 do
    begin
        if i = index then Write('[x] ')
        else Write('[ ] ');
        WriteLn(menu_list[i]);
    end;
end;

function PPI_Main(var inKey: Char; var index: Integer): TGameState;
begin
    case inKey of
        #72:
        begin
            index := (index - 1) mod 2;
            if index < 0 then index += 2;
        end;
        #80:
        begin
            index := (index + 1) mod 2;
        end;
        #13:
        begin
            case index of
            0:
            begin
                index := 0;
                Exit(GGameplay);
            end;
            1:  Halt(0);
            Otherwise Halt(1);
            end;
        end;
    end;
    Exit(GMain);
end;

procedure UI_Game(var index: Integer);
var
    menu_list: Array of String;
    i: Integer;

begin
    menu_list := ['Rock', 'Paper', 'Scissor'];
    WriteLn('----------------------');
    WriteLn('| Select Your Choice |');
    WriteLn('----------------------');
    for i := 0 to 2 do
    begin
        if i = index then Write('[x] ')
        else Write('[ ] ');
        WriteLn(menu_list[i]);
    end;
end;

function PPI_Game(var inKey: Char; var index: Integer): TGameState;
var
    computer_choice: Integer;
begin
    case inKey of
        #72:
        begin
            index := (index - 1) mod 3;
            if index < 0 then index += 3;
        end;
        #80:
        begin
            index := (index + 1) mod 3;
        end;
        #13:
        begin
            computer_choice := Random(3);
            index := 0;
            case index of
            0: { Rock }
            begin
                case computer_choice of
                    0: Exit(GDraw);
                    1: Exit(GLose);
                    2: Exit(GWin);
                end;
            end;
            1: { Paper }
            begin
                case computer_choice of
                    0: Exit(GWin);
                    1: Exit(GDraw);
                    2: Exit(GLose);
                end;
            end;
            2: { Scissor }
            begin
                case computer_choice of
                    0: Exit(GLose);
                    1: Exit(GWin);
                    2: Exit(GDraw);
                end;
            end;
            end;
        end;
    end;
    Exit(GGameplay);
end;

procedure UI_Win(var index: Integer);
var
    menu_list: Array of String;
    i: Integer;

begin
    menu_list := ['Try Again', 'Exit'];
    WriteLn('-----------');
    WriteLn('| You Win |');
    WriteLn('-----------');
    for i := 0 to 1 do
    begin
        if i = index then Write('[x] ')
        else Write('[ ] ');
        WriteLn(menu_list[i]);
    end;
end;

function PPI_Win(var inKey: Char; var index: Integer): TGameState;
begin
    case inKey of
        #72:
        begin
            index := (index - 1) mod 2;
            if index < 0 then index += 2;
        end;
        #80:
        begin
            index := (index + 1) mod 2;
        end;
        #13:
        begin
            case index of
            0:
            begin
                index := 0;
                Exit(GGameplay);
            end;
            1:  Exit(GMain);
            Otherwise Halt(1);
            end;
        end;
    end;
    Exit(GWin);
end;

procedure UI_Draw(var index: Integer);
var
    menu_list: Array of String;
    i: Integer;

begin
    menu_list := ['Try Again', 'Exit'];
    WriteLn('--------');
    WriteLn('| Draw |');
    WriteLn('--------');
    for i := 0 to 1 do
    begin
        if i = index then Write('[x] ')
        else Write('[ ] ');
        WriteLn(menu_list[i]);
    end;
end;

function PPI_Draw(var inKey: Char; var index: Integer): TGameState;
begin
    case inKey of
        #72:
        begin
            index := (index - 1) mod 2;
            if index < 0 then index += 2;
        end;
        #80:
        begin
            index := (index + 1) mod 2;
        end;
        #13:
        begin
            case index of
            0:
            begin
                index := 0;
                Exit(GGameplay);
            end;
            1:  Exit(GMain);
            Otherwise Halt(1);
            end;
        end;
    end;
    Exit(GDraw);
end;

procedure UI_Lose(var index: Integer);
var
    menu_list: Array of String;
    i: Integer;

begin
    menu_list := ['Try Again', 'Exit'];
    WriteLn('------------');
    WriteLn('| You Lose |');
    WriteLn('------------');
    for i := 0 to 1 do
    begin
        if i = index then Write('[x] ')
        else Write('[ ] ');
        WriteLn(menu_list[i]);
    end;
end;

function PPI_Lose(var inKey: Char; var index: Integer): TGameState;
begin
    case inKey of
        #72:
        begin
            index := (index - 1) mod 2;
            if index < 0 then index += 2;
        end;
        #80:
        begin
            index := (index + 1) mod 2;
        end;
        #13:
        begin
            case index of
            0:
            begin
                index := 0;
                Exit(GGameplay);
            end;
            1:  Exit(GMain);
            Otherwise Halt(1);
            end;
        end;
    end;
    Exit(GLose);
end;

var
    running     :   Boolean     =   True;
    Update      :   Boolean     =   False;
    inKey       :   Char        =   chr(0);
    state       :   TGameState  =   GMain;
    index       :   Integer     =   0;
begin
    index  := 0;
    Update := True;
    running:= True;

    while running do
    begin
        (* Input Processing (Non Blocking) *)
        if KeyPressed then
        begin
            inKey := ReadKey;
            if inKey = 'q' then running := False;
            case state of
                GMain:       state := PPI_Main(inKey, index);
                GGameplay:   state := PPI_Game(inKey, index);
                GWin:        state := PPI_Win(inKey, index);
                GDraw:       state := PPI_Draw(inKey, index);
                GLose:       state := PPI_Lose(inKey, index);
            end;
            Update  := True;
        end;

        (* Render *)
        if Update then
        begin
            ClrScr;
            case state of
                GMain:       UI_Main(index);
                GGameplay:   UI_Game(index);
                GWin:        UI_Win(index);
                GDraw:       UI_Draw(index);
                GLose:       UI_Lose(index);
            end;
            Update := False;
        end;

        Delay(1);
    end;
end.
