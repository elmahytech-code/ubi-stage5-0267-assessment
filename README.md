# ubi-stage5-0267-assessment
Ubuntu Bridge Initiative Stage 5 Policy-as-Code Compliance Assessment
## Directory Structure

* **`data/raw/`**: Contains unmodified input files, SHA-256 manifests, policy bundles, and JSON schemas in native format.
  * **`data/raw/policy-bundle/`**: Rego policy rules (`identity.rego`, `endpoint.rego`, `storage.rego`).
  * **`data/raw/schema/`**: Input validation schemas (`identity-schema.json`, `endpoint-schema.json`, `storage-schema.json`).
* **`data/derived/`**: Contains generated compliance reports, gap assessments, and formal PDF addendums.
* **`docs/`**: Governance documentation, continuity records, and integrity attestation.
* **`tests/`**: OPA test suites for identity, endpoint, and storage policies.
* 
