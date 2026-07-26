package policy.endpoint_test

import data.policy.endpoint

test_allow_healthy_endpoint {
    endpoint.allow with input as {
        "managed": true,
        "disk_encrypted": true,
        "edr_status": "healthy",
        "last_seen_hours": 8
    }
}

test_endpoint_not_managed {
    endpoint.violation.violation_code == "ENDPOINT_NOT_MANAGED"
    with input as {
        "managed": false,
        "disk_encrypted": true,
        "edr_status": "healthy",
        "last_seen_hours": 8
    }
}

test_endpoint_disk_not_encrypted {
    endpoint.violation.violation_code == "ENDPOINT_DISK_NOT_ENCRYPTED"
    with input as {
        "managed": true,
        "disk_encrypted": false,
        "edr_status": "healthy",
        "last_seen_hours": 8
    }
}

test_endpoint_edr_unhealthy {
    endpoint.violation.violation_code == "ENDPOINT_EDR_UNHEALTHY"
    with input as {
        "managed": true,
        "disk_encrypted": true,
        "edr_status": "unhealthy",
        "last_seen_hours": 8
    }
}

test_endpoint_last_seen_expired {
    endpoint.violation.violation_code == "ENDPOINT_NOT_SEEN_WITHIN_24_HOURS"
    with input as {
        "managed": true,
        "disk_encrypted": true,
        "edr_status": "healthy",
        "last_seen_hours": 48
    }
}