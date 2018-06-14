unit Right;

interface



const
   // REMINDER!!! Every time a new right is added.. be sure to check it gets displayed in the Rights form

   //************* PRIVILEGES ****************//

   // Client privileges
   PRIV_CLIENT_ADD_NEW = 'PRIV_CLIENT_ADD_NEW;Add_new_client;CLIENT';
   PRIV_CLIENT_MODIFY  = 'PRIV_CLIENT_MODIFY;Modify_client_details;CLIENT';

   // Loan privileges
   PRIV_LOAN_ADD_NEW   = 'PRIV_LOAN_ADD_NEW;Add_new_loan;LOAN';
   PRIV_LOAN_ASSESS    = 'PRIV_LOAN_ASSESS;Assess_pending_loan;LOAN';
   PRIV_LOAN_APPROVE   = 'PRIV_LOAN_APPROVE;Approve_loan;LOAN';
   PRIV_LOAN_RELEASE   = 'PRIV_LOAN_RELEASE;Release_loan;LOAN';
   PRIV_LOAN_CANCEL    = 'PRIV_LOAN_CANCEL;Cancel_loan;LOAN';
   PRIV_LOAN_CLOSE     = 'PRIV_LOAN_CLOSE;Close_loan_manually;LOAN';

   // Payment privileges
   PRIV_PAY_ADD_NEW    = 'PRIV_PAY_ADD_NEW;Add_new_payment;PAY';
   PRIV_PAY_CANCEL     = 'PRIV_PAY_CANCEL;Cancel_payment;PAY';
   PRIV_PAY_WD_ADD_NEW = 'PRIV_PAY_WD_ADD_NEW;Add_new_withdrawal;PAY';
   PRIV_PAY_WD_MODIFY  = 'PRIV_PAY_WD_MODIFY;Edit_withdrawal;PAY';
   PRIV_PAY_WD_CANCEL  = 'PRIV_PAY_WD_CANCEL;Cancel_withdrawal;PAY';

   // Admin-related.. involves maintenance tables
   PRIV_ADM_ADD_NEW    = 'PRIV_ADM_ADD_NEW;Add_new_lookup_values;ADM';
   PRIV_ADM_LC_ADD_NEW = 'PRIV_ADM_LC_ADD_NEW;Create_a_new_loan_classification;ADM';
   PRIV_ADM_LC_MODIFY  = 'PRIV_ADM_LC_MODIFY;Modify_existing_loan_classification;ADM';
   PRIV_ADM_LC_VIEW    = 'PRIV_ADM_LC_VIEW;View_loan_classifications;ADM';

   PRIV_SETTINGS       = 'PRIV_ADM_SETTINGS;View_and_modify_system_settings;ADM';

   // Security privileges
   PRIV_SEC_ROLE_ADD_NEW = 'PRIV_SEC_ROLE_ADD_NEW;Add_new_role;SEC';
   PRIV_SEC_ROLE_MODIFY  = 'PRIV_SEC_ROLE_ADD_MODIFY;Modify_roles_including_assigned_rights;SEC';
   PRIV_SEC_ROLE_VIEW    = 'PRIV_SEC_ROLE_VIEW;View_roles;SEC';
   PRIV_SEC_USER_MODIFY  = 'PRIV_SEC_USER_MODIFY;Modify_user_credentials_including_assigned_roles;SEC';
   PRIV_SEC_USER_VIEW    = 'PRIV_SEC_USER_VIEW;View_users;SEC';

  // adjust the array size before adding an item
  // array size is equal to the number of privileges
  PRIVILEGES: array [1..23] of string =
        (
         PRIV_CLIENT_ADD_NEW,
         PRIV_CLIENT_MODIFY,
         PRIV_LOAN_ADD_NEW,
         PRIV_LOAN_ASSESS,
         PRIV_LOAN_APPROVE,
         PRIV_LOAN_RELEASE,
         PRIV_LOAN_CANCEL,
         PRIV_LOAN_CLOSE,
         PRIV_PAY_ADD_NEW,
         PRIV_PAY_CANCEL,
         PRIV_PAY_WD_ADD_NEW,
         PRIV_PAY_WD_MODIFY,
         PRIV_PAY_WD_CANCEL,
         PRIV_ADM_ADD_NEW,
         PRIV_ADM_LC_ADD_NEW,
         PRIV_ADM_LC_MODIFY,
         PRIV_ADM_LC_VIEW,
         PRIV_SETTINGS,
         PRIV_SEC_ROLE_ADD_NEW,
         PRIV_SEC_ROLE_MODIFY,
         PRIV_SEC_ROLE_VIEW,
         PRIV_SEC_USER_MODIFY,
         PRIV_SEC_USER_VIEW
        );

  //************* PRIVILEGES ****************//

type
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
