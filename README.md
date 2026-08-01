# Terraform Fundamentals: Azure — Following HashiCorp's Get Started Tutorial

Learning Terraform by following [HashiCorp's official "Get Started — Azure" tutorial series](https://developer.hashicorp.com/terraform/tutorials/azure-get-started), step by step, with a portfolio-focused git history.

**Current progress:** Part 1 (Build) ✅ **— Part 2 (Change, Variables, Outputs, Remote State) coming

---

## What this project teaches

This is a deliberate learning journey through Terraform's core concepts, not a production infrastructure template. Each commit represents one distinct learning checkpoint. By the end of all parts, this repository will demonstrate:

- Infrastructure as Code fundamentals (HCL, providers, resources)
- State management (local and remote)
- Input variables and outputs
- Dependency graphs (how Terraform orders resource creation/destruction)
- Remote execution (HCP Terraform)
- Secure credential handling (why secrets never go into Git)

---

## What's built so far (Part 1)

**Deployed resources:**
- One Azure resource group (`rg-terraform-fundamentals`)
- Configured with tags and all inputs as parameterized variables

**Part 1 commits (3 total):**
1. Project structure and security-first `.gitignore`
2. Azurerm resource group resource
3. README + evidence screenshots

**Authentication:** Azure CLI (`az login`) — no stored credentials in the repository

---

## What's coming 

Following HashiCorp's remaining tutorials in order:

- **Change:** Add a virtual network resource, demonstrate dependency graphs
- **Destroy:** (Naturally covered during variable override testing)
- **Variables:** Test `-var` overrides, see forced replacement behavior
- **Outputs:** Query specific output values with `terraform output <name>`
- **Remote State:** Migrate from local state to HCP Terraform, add a Service Principal for remote execution

---

## Project structure

```
.
├── main.tf                       # Provider config + resource definitions
├── variables.tf                  # Input variables (name, location, tags)
├── outputs.tf                    # Output values (resource group ID, name, location)
├── terraform.tfvars.example      # Template for local variable overrides (not committed)
├── .gitignore                    # Keeps state, secrets, .terraform/ out of git
├── README.md                     # This file
└── screenshots/                  # Evidence of deployment
    ├── 01-resource-group-in-portal.png
    ├── 02-terraform-apply-output.png
    └── 03-project-structure.png
```

---

## Key learning points from Part 1

**Variables and defaults:**
Every resource attribute is parameterized — nothing hardcoded. This is more work upfront but makes the code reusable and testable.

**Outputs from day one:**
Rather than waiting for Terraform to tell you what it created, defining outputs early means you're intentional about what you expose and why.

**`.gitignore` as a safety mechanism:**
Committed in Commit 1, before anything dangerous was created. This defensive practice means state files and credentials are protected by design, not by hoping you remember to exclude them later.

**Dependency awareness:**
Even with a single resource in Part 1, this repo treats resources as having potential dependencies on each other — the practices used here scale directly to multi-resource, multi-environment setups.

---

## Security notes

- **No credentials in this repo.** Authentication is via `az login`, which uses your local Azure CLI session. No passwords, keys, or tokens are stored anywhere in these files.
- **State file is excluded.** `terraform.tfstate` contains infrastructure internals and is excluded from git via `.gitignore`.
- **`.tfvars` overrides are excluded.** Even though `terraform.tfvars.example` is safe to share, any real `terraform.tfvars` file with environment-specific values stays local and excluded.

**Part 2 adds a twist:** Remote state (HCP Terraform) will require a Service Principal for non-interactive execution, but that credential will be stored *only* in HCP Terraform's encrypted workspace variables, never here.

---

## Tutorial reference

Following the official HashiCorp tutorial series in order:

1. ✅ [Build](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build) — *Completed (Part 1 of this repo)*
2. 🔄 [Change](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-change) — *Part 2, tomorrow*
3. 🔄 [Destroy](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-destroy) — *Part 2, tomorrow*
4. 🔄 [Variables](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-variables) — *Part 2, tomorrow*
5. 🔄 [Outputs](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-outputs) — *Part 2, tomorrow*
6. 🔄 [Remote State](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-remote) — *Part 2, tomorrow*

---

## Why this approach?

I'm a service desk engineer transitioning to Azure cloud engineering. This project is deliberate, step-by-step learning:
- Each commit is a teachable checkpoint (not just "everything I did today")
- Screenshots and documentation show understanding, not just output
- Security practices are built in from the start, not added later
- Following official HashiCorp tutorials ensures the foundations are solid

The goal is a portfolio that demonstrates not just "I can run Terraform," but "I understand how to structure Terraform work professionally, and I know why that structure matters."

**Last updated:** [02/08/2026] — Part 1 complete, ready for Part 2 tomorrow