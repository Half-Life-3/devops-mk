plugin "aws" {
    enabled = true
    version = "0.16.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "terraform_unused_declarations" {
  enabled = true
}