terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "random" {}

resource "random_pet" "increase_resource_count" {
  for_each = { for idx in range(1, 5) : idx => idx }

  prefix = "hello-world-${each.key}"
  length = 2
}

output "pet_names" {
  value = { for k, v in random_pet.increase_resource_count : k => v.id }
}
