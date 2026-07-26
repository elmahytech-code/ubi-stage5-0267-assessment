# Decision Log
**Assessment:** Ubuntu Bridge Initiative – Stage 5  
**Assessor:** Aliu Muhammed Ohiada  
**Assessment ID:** UBI-2026-0267-STAGE5  
**Date:** 2026-07-24


Decision 1 – Identity Control

**Control ID:** NF.IDENTITY.PRIVILEGED_ASSURANCE

#Decision
Rejected the existing mapping because the available evidence showed privileged accounts were not protected with phishing-resistant Multi-Factor Authentication (MFA).

#Reason
The evidence indicated weak authentication controls for privileged identities. This creates a significant risk of credential theft and unauthorized administrative access.

#Final Mapping
- NIST CSF 2.0: PR.AA-02
- ISO/IEC 27001:2022: Annex A 5.17

# Risk
High

# Decision
Remediate immediately.

## Decision 2 – Endpoint Control

**Control ID:** NF.ENDPOINT.MANAGED_HEALTH

### Decision
Rejected the previous mapping because endpoint evidence demonstrated gaps in endpoint management.

### Reason
Some endpoints were unmanaged, lacked disk encryption, had unhealthy EDR status, or had not reported within the required period.

### Final Mapping
- NIST CSF 2.0: PR.PS-01
- ISO/IEC 27001:2022: Annex A 8.1

### Risk
High

### Decision
Remediate immediately.

## Decision 3 – Storage Control

**Control ID:** NF.STORAGE.RESTRICTED_PROTECTION

### Decision
Rejected the previous mapping because storage protection controls were insufficient.

### Reason
Evidence showed missing immutable logging and inadequate protection of sensitive storage resources.

### Final Mapping
- NIST CSF 2.0: DE.CM-09
- ISO/IEC 27001:2022: Annex A 8.15

### Risk
Critical

### Decision
Immediate remediation required.

# Overall Assessment

Three policy controls were assessed.

- Identity Control: Non-Compliant
- Endpoint Control: Non-Compliant
- Storage Control: Non-Compliant

The identified gaps present significant risks to confidentiality, integrity, and availability. Corrective actions should be prioritized according to the recommendations documented in the Policy Gap Report and Policy Addendum.