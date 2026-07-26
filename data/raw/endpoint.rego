package policy.endpoint

default allow = false

allow if {
    input.managed == true
    input.disk_encrypted == true
    input.edr_status == "healthy"
    input.last_seen_hours <= 24
}

violation := {
    "control_id": "NF.ENDPOINT.MANAGED_HEALTH",
    "violation_code": "ENDPOINT_NOT_MANAGED"
} if {
    input.managed != true
}

violation := {
    "control_id": "NF.ENDPOINT.MANAGED_HEALTH",
    "violation_code": "ENDPOINT_DISK_NOT_ENCRYPTED"
} if {
    input.disk_encrypted != true
}

violation := {
    "control_id": "NF.ENDPOINT.MANAGED_HEALTH",
    "violation_code": "ENDPOINT_EDR_UNHEALTHY"
} if {
    input.edr_status != "healthy"
}

violation := {
    "control_id": "NF.ENDPOINT.MANAGED_HEALTH",
    "violation_code": "ENDPOINT_NOT_SEEN_WITHIN_24_HOURS"
} if {
    input.last_seen_hours > 24
}