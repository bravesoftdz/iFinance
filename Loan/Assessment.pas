unit Assessment;

interface

type
  TRecommendation = (rcApprove, rcReject);

type
  TAssessment = class(TObject)
  private
    FRecommendation: TRecommendation;
    FRecommendedAmount: real;
  public
    property Recommendation: TRecommendation read FRecommendation write FRecommendation;
    property RecommendedAmount: real read FRecommendedAmount write FRecommendedAmount;

    constructor Create; overload;
    constructor Create(const rec: integer; const recAmt: real); overload;
  end;

implementation

constructor TAssessment.Create;
begin
  inherited;
end;

constructor TAssessment.Create(const rec: Integer; const recAmt: Real);
begin
  FRecommendation := TRecommendation(rec);
  FRecommendedAmount := recAmt;
end;

end.
