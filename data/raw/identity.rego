package policy.identity

default allow = false

allow if {
    input.type == "human"
    input.privileged == true
    input.mfa == "phishing-resistant"
}

violation := {
    "control_id": "NF.IDENTITY.PRIVILEGED_ASSURANCE",
    "violation_code": "PRIV_HUMAN_MFA_NOT_PHISHING_RESISTANT"
} if {
    input.type == "human"
    input.privileged == true
    input.mfa != "phishing-resistant"
}

violation := {
    "control_id": "NF.IDENTITY.PRIVILEGED_ASSURANCE",
    "violation_code": "PRIV_SERVICE_ACCOUNT_OWNER_MISSING"
} if {
    input.type == "service"
    input.privileged == true
    input.owner == null
}

violation := {
    "control_id": "NF.IDENTITY.PRIVILEGED_ASSURANCE",
    "violation_code": "PRIV_SERVICE_ACCOUNT_CREDENTIAL_TOO_OLD"
} if {
    input.type == "service"
    input.privileged == true
    input.credential_age_days > 90
}