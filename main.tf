terraform {
    required_version = ">=0.13"
    required_providers {
        genesyscloud = {
        source  = "mypurecloud/genesyscloud"
        //version = "~> 1.0.0"
    }
  }
}
provider "genesyscloud" {
  /*
  oauthclient_id     = "23cebb6c-0db7-490d-a9b7-e0e6eae84a03"
  oauthclient_secret = "Mk7c8QGBQtdTPIGfrrxJt1N8VksHu7nLK1TfvU6zzao"
  */
   oauthclient_id     = "c2186999-304e-475c-9d6d-075a855d0fd8"
  oauthclient_secret = "GP4O0UggLQRDP9dFi6DP2Eh23L6OnRA-YnRXHRQ80es"
  aws_region         = "ap-southeast-2"
}
resource "genesyscloud_tf_export" "export" {
  directory          = "./genesyscloud_main"
  resource_types     = [
    "genesyscloud_location::Auckland","genesyscloud_location::Australia","genesyscloud_location::Hobart",
    "genesyscloud_location::Kuala Lumpur","genesyscloud_location::Melbourne",
    "genesyscloud_auth_division",
    "genesyscloud_architect_schedules",
    "genesyscloud_architect_schedulegroups",
    "genesyscloud_architect_datatable::Agent Disposition Table","genesyscloud_architect_datatable::AU_ElectricOutages",
    "genesyscloud_architect_datatable::VY - Play Audio","genesyscloud_architect_datatable::VY-InQ_TAL",
    "genesyscloud_architect_datatable::VY-InQ_TAL 2","genesyscloud_architect_datatable::WestWood_CS_DN_Mapping",
    "genesyscloud_architect_datatable::WKM Test Data Table 01",	
    "genesyscloud_architect_datatable_row::Agent Disposition Table","genesyscloud_architect_datatable_row::AU_ElectricOutages",
    "genesyscloud_architect_datatable_row::VY - Play Audio","genesyscloud_architect_datatable_row::VY-InQ_TAL",
    "genesyscloud_architect_datatable_row::VY-InQ_TAL 2","genesyscloud_architect_datatable_row::WestWood_CS_DN_Mapping",
    "genesyscloud_architect_datatable_row::WKM Test Data Table 01",
    "genesyscloud_routing_skill",
    "genesyscloud_routing_wrapupcode",
    //auth_role
    "genesyscloud_auth_role::integrationServer",
    "genesyscloud_auth_role::Quality Administrator" ,
    "genesyscloud_auth_role::SCIM Integration" ,
    "genesyscloud_auth_role::KH Agentrecordingview" ,
    "genesyscloud_auth_role::Outbound Admin" ,
    "genesyscloud_auth_role::PureCloud User" ,
    "genesyscloud_auth_role::VY - Architect Prompts" ,
    "genesyscloud_auth_role::VN Master Admin" ,
    "genesyscloud_auth_role::Engage-Supervisor", 
    "genesyscloud_auth_role::Master Admin" ,
    "genesyscloud_auth_role::admin",
    "genesyscloud_auth_role::Communicate - Admin" ,
    "genesyscloud_auth_role::employee" ,
    "genesyscloud_auth_role::PureCloud Supervisor" ,
    "genesyscloud_auth_role::Communicate - User" ,
    "genesyscloud_auth_role::Developer" ,
    "genesyscloud_auth_role::Trusted External User" ,
    "genesyscloud_auth_role::Callflow Data Service QA Role",
    "genesyscloud_user_roles::vincentkarl90@gmail.com",
    "genesyscloud_user::vincentkarl90@gmail.com",
    "genesyscloud_group::VY_Group",
    "genesyscloud_group_roles::VY_Group",
    "genesyscloud_routing_queue::VY - Lab Queue",
    "genesyscloud_routing_queue::VY - Lab Outbound Queue",
    "genesyscloud_routing_queue::VY - Messaging",
    "genesyscloud_routing_utilization"

    ]
  export_as_hcl = true
  include_state_file = true
}

resource "genesyscloud_tf_export" "export_architect_ivr" {
  directory          = "./genesyscloud_architect_ivr"
  resource_types     = [
    "genesyscloud_architect_ivr::VY - Call route"
  ]
  export_as_hcl = true
  include_state_file = true
}

resource "genesyscloud_tf_export" "export_integration_action" {
  directory          = "./genesyscloud_integration_action"
  resource_types     = [
    "genesyscloud_integration_action::Get onQueue Agent by QueueId",
    "genesyscloud_integration_action::CK - Get Conversation Details (SecureFlow)",
    "genesyscloud_integration_action::KH_Get Interactions In Queue",
    "genesyscloud_integration_action::CK - Update DataTable",
    "genesyscloud_integration_action::AI - Get Payment Status from conID",
    "genesyscloud_integration_action::Asif - Agent Logged on Check",
    "genesyscloud_integration_action::Asif - Lab Data Action",
    "genesyscloud_integration_action::CK - Get Conversation Details",
    "genesyscloud_integration_action::CK - Get Survey",
    "genesyscloud_integration_action::JL - Insert entry - Secure Flow",
    "genesyscloud_integration_action::JL - Hold/Unhold Conversation",
    "genesyscloud_integration_action::JL - Update DataTable - Secure flow"

    ]
  export_as_hcl = true
  include_state_file = true
}

resource "genesyscloud_tf_export" "export_user_prompt" {
  directory          = "./genesyscloud_user_prompt"
  resource_types     = [
    //no necessary rather import with excel
    "genesyscloud_architect_user_prompt"
    ]
  export_as_hcl = true
  include_state_file = true
}
/*
resource "genesyscloud_tf_export" "export_flow" {
  directory          = "./genesyscloud_flow"
  resource_types     = [
    "genesyscloud_flow"
  ]
  export_as_hcl = true
  include_state_file = true
}
 */

/*
module "PyArchy_export" {
  source = "./modules/"
  depends_on = [
    genesyscloud_tf_export.export_architect_ivr,
    genesyscloud_tf_export.export_integration_action,
    genesyscloud_tf_export.export_user_prompt,
    genesyscloud_tf_export.export
  ]
}
*/
#After generating the output files in final_output directory : 
#Fix the schedule group bug : adding in : time_zone            = "Asia/Singapore" in genesyscloud_architect_schedulegroups
#Need to Archy - audio to voice: Kandyce


