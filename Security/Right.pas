unit Right;

interface

type
   // Note: Add a prefix for grouping purposes
   //
   //      A = Client
   //      B = Loans
   //      C = Payment
   //      S = Administrator functions
   //      Z = Security
   //      9 = Delimiter for TStringlist

   // REMINDER!!! Every time a new right is added.. be sure to check it gets displayed in the Rights form

   TRights = (
             A9ADD_CLIENT9Add_new_client,
             A9MODIFY_CLIENT9Modify_client_details,
             B9ADD_LOAN9Create_new_loan,
             B9ASSESS_LOAN9Assess_pending_loan,
             B9APPROV_LOAN9Approve_loan,
             B9RELEASE_LOAN9Release_loan,
             B9CANCEL_LOAN9Cancel_loan,
             B9APPROVE_LOAN9Approve_loan,
             B9CLOSE_LOAN9Close_loan_manually,
             C9ADD_PAYMENT9Add_new_payment,
             C9CANCEL_PAYMENT9Cancel_payment,
             C9ADD_WITHDRAWAL9Add_withdrawal,
             C9EDIT_WITHDRAWAL9Edit_withdrawal,
             C9CANCEL_WITHDRAWAL9Cancel_withdrawal,
             S9ADD_LOAN_CLASS9Add_new_loan_classification,
             S9MODIFY_LOAN_CLASS9Modify_existing_loan_classification,
             S9ADD_MAINTENANCE9Add_new_lookup_values,
             Z9VIEW_USERS9View_system_users,
             Z9ADD_USER9Add_new_user_login,
             Z9MODIFY_USER9Change_user_login_credentials,
             Z9VIEW_ROLES9View_system_roles,
             Z9ADD_ROLE9Add_new_role,
             Z9MODIFY_ROLE9Modify_role_rights
            );

  TRight = class
  strict private
    FName: string;
    FCode: string;
    FAssignedOldValue: boolean;
  private
    FModified: boolean;
    FAssignedNewValue: boolean;

    function GetModified: boolean;
  public
    property Code: string read FCode write FCode;
    property Name: string read FName write FName;
    property AssignedOldValue: boolean read FAssignedOldValue write FAssignedOldValue;
    property AssignedNewValue: boolean read FAssignedNewValue write FAssignedNewValue;
    property Modified: boolean read GetModified;
  end;

implementation

{ TRight }

function TRight.GetModified: boolean;
begin
  Result := FAssignedOldValue <> FAssignedNewValue;
end;

end.
