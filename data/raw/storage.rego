package policy.storage

default allow = false

allow if {
    input.classification == "restricted" or input.classification == "confidential"
    input.public == false
    input.encrypted == true
    input.immutable_log_sink == true
}

violation := {
    "control_id": "NF.STORAGE.RESTRICTED_PROTECTION",
    "violation_code": "STORAGE_PUBLIC_ACCESS_ENABLED"
} if {
    input.public == true
}

violation := {
    "control_id": "NF.STORAGE.RESTRICTED_PROTECTION",
    "violation_code": "STORAGE_NOT_ENCRYPTED"
} if {
    input.encrypted != true
}

violation := {
    "control_id": "NF.STORAGE.RESTRICTED_PROTECTION",
    "violation_code": "IMMUTABLE_LOG_SINK_MISSING"
} if {
    input.immutable_log_sink != true
}

violation := {
    "control_id": "NF.STORAGE.RESTRICTED_PROTECTION",
    "violation_code": "INVALID_DATA_CLASSIFICATION"
} if {
    input.classification != "restricted"
    input.classification != "confidential"
}