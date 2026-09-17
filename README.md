# Senior Cloud Engineering Reference — KATBOTZ application

An inspectable AWS baseline for a secure, private workload: encrypted storage, constrained network access, least-privilege workload identity and operational checks. It is a portfolio reference prepared by Rahul H Bhatia, not KATBOTZ production infrastructure.

## What to review

- `infra/main.tf` is a small Terraform module for an encrypted S3 evidence bucket, private VPC endpoints, security-group egress, and a workload role boundary.
- `tests/test_controls.py` validates declared guardrails before a plan reaches a cloud account.
- `docs/operations.md` covers change, incident, backup and cost-review responsibilities.

## Run

```bash
python -m unittest discover -s tests -v
terraform -chdir=infra init
terraform -chdir=infra validate
```

The Terraform is intentionally not applied by CI. Supply your own account, region, tagging, retention, KMS-key, logging and organizational policy decisions before deployment. This project does not claim a deployed environment, compliance certification, or multi-cloud implementation.

## Role alignment

It focuses on the role’s IaC, AWS networking/IAM, security, availability, operational documentation and cost-governance themes. Rahul’s background includes AWS/GCP, Terraform/CloudFormation, Kubernetes, CI/CD, monitoring, production support and AWS GenAI/RAG deployment work. Azure and Windows administration are not represented as hands-on implementation here.

## Contact

Rahul H Bhatia · +91 9884541449 · rahulbhatia1998@gmail.com  
[LinkedIn](https://www.linkedin.com/in/rahul-h-bhatia/) · [Portfolio](https://rahulhbhatia.vercel.app) · [Credly](https://www.credly.com/users/rahul-h-bhatia/badges)
