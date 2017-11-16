unit Assessment;

interface

type
  TRecommendation = (rcApprove, rcReject);

type
  TAssessment = class(TObject)
  private
    FRecommendation: TRecommendation;
    FRecommendedAmount: currency;
  public
    property Recommendation: TRecommendation read FRecommendation write FRecommendation;
    property RecommendedAmount: currency read FRecommendedAmount write FRecommendedAmount;

    constructor Create; overload;
    constructor Create(const rec: integer; const recAmt: currency); overload;
  end;

implementation

constructor TAssessment.Create;
begin
  inherited;
end;

constructor TAssessment.Create(const rec: Integer; const recAmt: currency);
begin
  FRecommendation := TRecommendation(rec);
  FRecommendedAmount := recAmt;
end;

end.
