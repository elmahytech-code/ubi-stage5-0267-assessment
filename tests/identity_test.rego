package policy.identity_test

import data.policy.identity

test_allow_privileged_user {
    identity.allow with input as {
        "type": "human",
        "privileged": true,
        "mfa": "phishing-resistant"
    }
}

test_deny_without_phishing_resistant_mfa {
    not identity.allow with input as {
        "type": "human",
        "privileged": true,
        "mfa": "sms"
    }
}

test_service_account_owner_missing {
    identity.violation.violation_code == "PRIV_SERVICE_ACCOUNT_OWNER_MISSING"
    with input as {
        "type": "service",
        "privileged": true,
        "owner": null,
        "credential_age_days": 30
    }
}

test_service_account_old_credentials {
    identity.violation.violation_code == "PRIV_SERVICE_ACCOUNT_CREDENTIAL_TOO_OLD"
    with input as {
        "type": "service",
        "privileged": true,
        "owner": "IT",
        "credential_age_days": 120
    }
}