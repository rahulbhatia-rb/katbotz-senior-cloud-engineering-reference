# Operational plan

Use a reviewed Terraform plan per environment; tag owner, service, environment and cost center. Treat `terraform apply` as a controlled change with rollback and a documented owner. Monitor request errors, latency, storage growth, KMS failures and IAM-denied events. Test recovery using a separate account and approved non-production data. Cost review should examine storage lifecycle and endpoint/egress use; no cost saving overrides encryption or recovery objectives.
