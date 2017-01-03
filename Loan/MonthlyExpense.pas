unit MonthlyExpense;

interface

type
  TMonthlyExpense = class(TObject)
  private
    FExpenseType: string;
    FExpenseName: string;
    FExpenseAmount: string;
  public
    property ExpenseType: string read FExpenseType write FExpenseType;
    property ExpenseName: string read FExpenseName write FExpenseName;
    property ExpenseAmount: string read FExpenseAmount write FExpenseAmount;

    constructor Create(const expType, expName, expAmount: string);
  end;

var
  monExpense: TMonthlyExpense;

implementation

constructor TMonthlyExpense.Create(const expType, expName, expAmount: string);
begin
  FExpenseType := expType;
  FExpenseName := expName;
  FExpenseAmount := expAmount;
end;

end.
