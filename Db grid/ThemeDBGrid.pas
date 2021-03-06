unit ThemeDBGrid;

interface

{
    TThemeGrid
    Grid that paints themed when run under WinXP with a manifest

    Jeremy North ( http://www.jed-software.com )
    May, 2006

    Direct descendant of TDBGrid. If you already have a TDBGrid
    descendant you can easily descend from TThemeGrid.

    Known Issues
    - will not draw multi select indicator
    - caption draws left to right only

    License Terms
    - there are none

    Comments and improvements welcome.
}

uses
    Windows
  , DBGrids
  , Types
  , Grids
  , Controls
  , Classes
  , Messages
  ;

type
  TPaintInfo = record
    MouseInCol: Integer; // the column that the mouse is in
    ColPressed: Boolean; // a column has been pressed
    ColPressedIdx: Integer; // idx of the pressed column
    ColSizing: Boolean; // currently sizing a column
    ColMoving: Boolean; // currently moving a column
  end;

  TCustomThemeDBGrid = class(TDBGrid)
  private
    FPaintInfo: TPaintInfo;
    FCell: TGridCoord; // currently selected cell
    FAllowTitleClick: Boolean;
    function CentreV(ARect: TRect; ATextHeight: Integer): Integer;
    // col offset used for calculations. Is 1 if indicator is being displayed
    function ColumnOffset(AOptions: TDBGridOptions): Integer;
    function TitleOffset(AOptions: TDBGridOptions): Integer;
    function ValidCell(ACell: TGridCoord): Boolean;
  protected
    function BeginColumnDrag(var Origin: Integer; var Destination: Integer; 
const MousePt: TPoint): Boolean; override;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure ColExit; override;
    procedure ColumnMoved(FromIndex: Integer; ToIndex: Integer); override;
    procedure DrawCell(ACol: Integer; ARow: Integer; ARect: TRect; AState: 
TGridDrawState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X: Integer; 
Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X: Integer; Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X: Integer; Y: 
Integer); override;
    procedure Paint; override;
    procedure TitleClick(Column: TColumn); override;
  public
    constructor Create(AOwner: TComponent); override;
    property AllowTitleClick: Boolean read FAllowTitleClick write 
FAllowTitleClick default True;
  end;

  TThemeDBGrid = class(TCustomThemeDBGrid)
  published
    property AllowTitleClick;
  end;

procedure Register;

implementation

uses
    Themes
  , Graphics
  , GraphUtil
  ;

procedure Register;
begin
  RegisterComponents('Samples', [TThemeDBGrid]);
end;

{ TThemeGrid }

function TCustomThemeDBGrid.BeginColumnDrag(var Origin, Destination: Integer; 
const MousePt: TPoint): Boolean;
begin
  result := inherited BeginColumnDrag(Origin, Destination, MousePt);
  FPaintInfo.ColMoving := result;
end;

function TCustomThemeDBGrid.CentreV(ARect: TRect; ATextHeight: Integer): 
Integer;
begin
  result := ((ARect.Bottom - ARect.Top) div 2) - (ATextHeight div 2);
end;

procedure TCustomThemeDBGrid.CMMouseEnter(var Message: TMessage);
var
  Cell: TGridCoord;
  lPt: TPoint;
begin
  lPt := Point(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  Cell := MouseCoord(lPt.X, lPt.Y);
  if (dgTitles in Options) and (Cell.Y = 0) then
    InvalidateCell(Cell.X, Cell.Y);
end;

procedure TCustomThemeDBGrid.CMMouseLeave(var Message: TMessage);
begin
  if ValidCell(FCell) then
    InvalidateCell(FCell.X, FCell.Y);
  FCell.X := -1;
  FCell.Y := -1;
  FPaintInfo.MouseInCol := -1;
  FPaintInfo.ColPressedIdx := -1;
end;

procedure TCustomThemeDBGrid.ColExit;
begin
  inherited;
  FPaintInfo.MouseInCol := -1;
  if ValidCell(FCell) then
    InvalidateCell(FCell.X, FCell.Y);
end;

procedure TCustomThemeDBGrid.ColumnMoved(FromIndex, ToIndex: Integer);
begin
  inherited;
  FPaintInfo.ColMoving := False;
  Invalidate;
end;

function TCustomThemeDBGrid.ColumnOffset(AOptions: TDBGridOptions): Integer;
begin
  if dgIndicator in Options then
    result := 1
  else
    result := 0;
end;

constructor TCustomThemeDBGrid.Create(AOwner: TComponent);
begin
  inherited;
  FPaintInfo.ColPressed := False;
  FPaintInfo.MouseInCol := -1;
  FPaintInfo.ColPressedIdx := -1;
  FPaintInfo.ColMoving := False;
  FPaintInfo.ColSizing := False;
  FCell.X := -1;
  FCell.Y := -1;
  FAllowTitleClick := True;
end;

procedure TCustomThemeDBGrid.DrawCell(ACol, ARow: Integer; ARect: TRect; 
AState: TGridDrawState);
const
  ArrowDirection: array [TCanvasOrientation] of TScrollDirection = (sdRight, 
sdLeft);
var
  Details: TThemedElementDetails;
  lCaptionRect: TRect;
  lCellRect: TRect;
  lStr: string;
begin
  lCellRect := ARect;
  if (ThemeServices.ThemesEnabled) and (ARow = 0) and (ACol - 
ColumnOffset(Options) >= 0) and (dgTitles in Options) then
  begin
    lCaptionRect := ARect;
    if (not FPaintInfo.ColPressed) or (FPaintInfo.ColPressedIdx <> ACol) then
    begin
      if (FPaintInfo.MouseInCol = -1) or (FPaintInfo.MouseInCol <> ACol) or 
(csDesigning in ComponentState) then
        Details := ThemeServices.GetElementDetails(thHeaderItemNormal)
      else
        Details := ThemeServices.GetElementDetails(thHeaderItemHot);
      lCellRect.Right := lCellRect.Right + 1;
      lCellRect.Bottom := lCellRect.Bottom + 1;
    end
    else if FAllowTitleClick then
    begin
      Details := ThemeServices.GetElementDetails(thHeaderItemPressed);
      InflateRect(lCaptionRect, -1, 1);
    end
    else
    begin
      if FPaintInfo.MouseInCol = ACol then
        Details := ThemeServices.GetElementDetails(thHeaderItemHot)
      else
        Details := ThemeServices.GetElementDetails(thHeaderItemNormal);
    end;
    ThemeServices.DrawElement(Canvas.Handle, Details, lCellRect);
    Canvas.Brush.Style := bsClear;
    Canvas.Font.Assign(TitleFont);
    lStr := Columns.Items[ACol - ColumnOffset(Options)].Title.Caption;
    Canvas.TextOut(lCaptionRect.Left + 2, CentreV(lCaptionRect, 
Canvas.TextHeight(lStr)), lStr);
  end
  else if (ACol = 0) and (dgIndicator in Options) and 
(ThemeServices.ThemesEnabled) then
  begin
    // indicator column
    if ARow < TitleOffset(Options) then
      Details := ThemeServices.GetElementDetails(thHeaderItemNormal)
    else
      Details := ThemeServices.GetElementDetails(thHeaderRoot);
    lCellRect.Right := lCellRect.Right + 1;
    lCellRect.Bottom := lCellRect.Bottom + 1;
    ThemeServices.DrawElement(Canvas.Handle, Details, lCellRect);
    // draw the indicator
    if (Datalink.Active) and (ARow - TitleOffset(Options) = 
Datalink.ActiveRecord) then
    begin
      Canvas.Pen.Color := clWhite;
      DrawArrow(Canvas, ArrowDirection[Canvas.CanvasOrientation], 
Point(lCellRect.Left + 4, lCellRect.Top + 3), 5);
      Canvas.Pen.Color := clBlack;
      DrawArrow(Canvas, ArrowDirection[Canvas.CanvasOrientation], 
Point(lCellRect.Left + 3, lCellRect.Top + 3), 5);
    end;
  end
  else
  begin
    DefaultDrawing := True;
    inherited;
    DefaultDrawing := False;
  end;
end;

procedure TCustomThemeDBGrid.MouseDown(Button: TMouseButton; Shift: 
TShiftState; X, Y: Integer);
var
  lCell: TGridCoord;
begin
  if not (csDesigning in ComponentState) then
  begin
    FPaintInfo.ColSizing := Sizing(X, Y);
    if not FPaintInfo.ColSizing then
    begin
      FPaintInfo.ColPressedIdx := -1;
      FPaintInfo.ColPressed := False;
      if FAllowTitleClick then
        FPaintInfo.MouseInCol := -1;
      lCell := MouseCoord(X,Y);
      if (Button = mbLeft) and (lCell.X >= IndicatorOffset) and (lCell.Y >= 0) 
and (FAllowTitleClick) then
      begin
        FPaintInfo.ColPressed := lCell.Y < TitleOffset(Options);
        if FPaintInfo.ColPressed then
        begin
          FPaintInfo.ColPressedIdx := Columns[RawToDataColumn(lCell.X)].Index + 
ColumnOffset(Options);
        end;
        if ValidCell(FCell) then
          InvalidateCell(FCell.X, FCell.Y);
        FCell := lCell;
      end;
    end;
  end;
  inherited;
end;

function GridCoordEqual(const aCell1, aCell2: TGridCoord): Boolean; 
begin
  result := (aCell1.X = aCell2.X) and (aCell2.X = aCell2.X);
end;

procedure TCustomThemeDBGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  lCell: TGridCoord;
  lMouseInCol: Integer;
begin
  if not (csDesigning in ComponentState) then
  begin
    if (not FPaintInfo.ColSizing) and (not FPaintInfo.ColMoving) then
    begin
      FPaintInfo.MouseInCol := -1;
      lCell := MouseCoord(X,Y);
      if (lCell.X >= IndicatorOffset) and (lCell.Y >= 0) then
      begin
        if (lCell.Y < TitleOffset(Options)) then
        begin
          lMouseInCol := Columns[RawToDataColumn(lCell.X)].Index + 
ColumnOffset(Options);
          if lMouseInCol <> FPaintInfo.MouseInCol then
          begin
            InvalidateCell(lCell.X, lCell.Y);
            FPaintInfo.MouseInCol := lMouseInCol;
          end;
        end
      end;
      if ValidCell(FCell) then
        InvalidateCell(FCell.X, FCell.Y);
      FCell := lCell;
    end;
  end;
  inherited;
end;

procedure TCustomThemeDBGrid.MouseUp(Button: TMouseButton; Shift: TShiftState; 
X, Y: Integer);
begin
  inherited;
  FPaintInfo.ColSizing := False;
  FPaintInfo.ColMoving := False;
  FPaintInfo.ColPressedIdx := -1;
  Invalidate;
end;

procedure TCustomThemeDBGrid.Paint;
begin
  if ThemeServices.ThemesEnabled then
  begin
    // reset the inherited options but remove the goFixedVertLine and 
    //goFixedHorzLine values
    // as that causes the titles and indicator panels to have a black border
    TStringGrid(Self).Options := TStringGrid(Self).Options - [goFixedVertLine];
    TStringGrid(Self).Options := TStringGrid(Self).Options - [goFixedHorzLine];
  end;
  inherited;
end;

procedure TCustomThemeDBGrid.TitleClick(Column: TColumn);
begin
  inherited;
  if FAllowTitleClick then
  begin
    FPaintInfo.ColPressed := False;
    FPaintInfo.ColPressedIdx := -1;
    if ValidCell(FCell) then
      InvalidateCell(FCell.X, FCell.Y);
  end;
end;

function TCustomThemeDBGrid.TitleOffset(AOptions: TDBGridOptions): Integer;
begin
  if (dgTitles in Options) then
    result := 1
  else
    result := 0;
end;

function TCustomThemeDBGrid.ValidCell(ACell: TGridCoord): Boolean;
begin
  result := (ACell.X <> -1) and (ACell.Y <> -1);
end;

end.
 