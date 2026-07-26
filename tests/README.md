# Policy Unit Test Suites

This folder contains the Open Policy Agent (OPA) test suites written in Rego to validate policy evaluation logic before running against production inputs.

## Test Files

* **`identity-test.rego`**: Unit tests verifying MFA requirements, account ownership checks, and credential rotation rules for privileged identities.
* **`endpoint-test.rego`**: Unit tests verifying disk encryption, EDR agent health status, and 24-hour management check-in compliance.
* **`storage-test.rego`**: Unit tests verifying restricted storage classifications, encryption at rest, public access blocking, and immutable log sink rules.

## Execution

To execute all test suites locally using OPA:

```bash
opa test tests/ -v
