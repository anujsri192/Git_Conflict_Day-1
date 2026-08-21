# ☁️ Azure Infrastructure Automation with Terraform 🚀

> ⚡ **Modular Infrastructure as Code (IaC)** written in Terraform for dynamically provisioning Microsoft Azure cloud resources using reusable modules and `for_each` map iterations.

---

## 📁 Repository Structure

```text
Git_Conflict_Day-1/
├── 🌐 Environment/
│   └── 🧪 Dev/
│       ├── 📜 main.tf              # Entry point invoking Azure modules
│       ├── ⚙️ provider.tf          # AzureRM provider configuration (v4.80.0)
│       ├── 🔀 variable.tf          # Input variable declarations
│       └── 📝 terraform.tfvars     # Environment-specific variable values
└── 🧩 Modules/
    ├── 📦 Resource_group/          # Module for provisioning Azure Resource Groups
    │   ├── 📜 main.tf
    │   └── 🔀 variable.tf
    ├── 🌐 Virtual_network/         # Module for provisioning Virtual Networks (VNets)
    │   ├── 📜 main.tf
    │   └── 🔀 variable.tf
    └── 🔗 Subnet/                  # Module for provisioning Subnets
        ├── 📜 main.tf
        └── 🔀 variable.tf
```

---

## 🧩 Modules Overview

All modules process map-of-objects data structures using Terraform `for_each` loops for scalable, dynamic resource provisioning:

* 📦 **Resource Group Module (`Modules/Resource_group`)**: Provisions `azurerm_resource_group` resources with dynamic name, location, and owner metadata (`managed_by`).
* 🌐 **Virtual Network Module (`Modules/Virtual_network`)**: Provisions `azurerm_virtual_network` resources mapped to target Resource Groups and IP address spaces.
* 🔗 **Subnet Module (`Modules/Subnet`)**: Provisions `azurerm_subnet` resources configured within specified Virtual Networks and Resource Groups.

---

## 🌐 Environments

### 🧪 **Dev Environment (`Environment/Dev`)**

The `Dev` environment orchestrates module deployment inside `main.tf` using explicit dependency ordering (`depends_on`):
1. 📦 **Resource Groups** are provisioned first.
2. 🌐 **Virtual Networks** are deployed into created Resource Groups.
3. 🔗 **Subnets** are created inside their target Virtual Networks.

#### 📝 Sample Configuration (`terraform.tfvars`)
```hcl
resource_groups = {
  ra1 = { name = "rg1101", location = "Japan East", managed_by = "krishna" }
  ra2 = { name = "rg1102", location = "Japan West", managed_by = "ram" }
}

virtual_networks = {
  vnet1 = {
    name                = "vnet9743"
    location            = "Japan West"
    resource_group_name = "rg1102"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name                 = "sub9857"
    resource_group_name  = "rg1101"
    virtual_network_name = "vnet964"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
```

---

## 🛠️ Prerequisites & Authentication

- 🏗️ **Terraform CLI**: `v1.0.0+`
- 🔑 **Azure CLI**: Installed and authenticated:
  ```bash
  az login
  az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
  ```

---

## 🚀 Deployment Guide

Navigate to your target environment directory:

```bash
cd Environment/Dev
```

### 1️⃣ Initialize Terraform
Download provider dependencies (`hashicorp/azurerm`):
```bash
terraform init
```

### 2️⃣ Format & Validate Code
Clean formatting and check configuration syntax:
```bash
terraform fmt -recursive
terraform validate
```

### 3️⃣ Plan Deployment
Preview the planned infrastructure changes:
```bash
terraform plan
```

### 4️⃣ Apply Changes
Provision resources in your Azure account:
```bash
terraform apply
```

### 5️⃣ Destroy Infrastructure (Optional)
Tear down all deployed resources when testing is complete:
```bash
terraform destroy
```

---

## ⚙️ Specifications Summary

- ☁️ **Cloud Provider**: Microsoft Azure
- 🔌 **Terraform Provider**: `azurerm` (`v4.80.0`)
- 🏗️ **Architecture Pattern**: Modular IaC + Environment Wrapper
- 🔄 **Loop Mechanism**: `for_each` Dynamic Map Provisioning