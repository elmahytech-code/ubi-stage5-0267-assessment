package policy.storage_test

import data.policy.storage

test_allow_protected_storage {
    storage.allow with input as {
        "classification": "restricted",
        "public": false,
        "encrypted": true,
        "immutable_log_sink": true
    }
}

test_storage_public_access_enabled {
    storage.violation.violation_code == "STORAGE_PUBLIC_ACCESS_ENABLED"
    with input as {
        "classification": "restricted",
        "public": true,
        "encrypted": true,
        "immutable_log_sink": true
    }
}

test_storage_not_encrypted {
    storage.violation.violation_code == "STORAGE_NOT_ENCRYPTED"
    with input as {
        "classification": "restricted",
        "public": false,
        "encrypted": false,
        "immutable_log_sink": true
    }
}

test_storage_log_sink_missing {
    storage.violation.violation_code == "IMMUTABLE_LOG_SINK_MISSING"
    with input as {
        "classification": "restricted",
        "public": false,
        "encrypted": true,
        "immutable_log_sink": false
    }
}

test_invalid_data_classification {
    storage.violation.violation_code == "INVALID_DATA_CLASSIFICATION"
    with input as {
        "classification": "public",
        "public": false,
        "encrypted": true,
        "immutable_log_sink": true
    }
}