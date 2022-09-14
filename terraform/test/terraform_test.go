package test

import (
	"fmt"
	"testing"
	"reflect"
	"github.com/gruntwork-io/terratest/modules/terraform"
	
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"

	//"github.com/aws/aws-sdk-go/aws"
	//"github.com/aws/aws-sdk-go/service/ec2"
)

func TestTerraformDeploymentMain(t *testing.T) {
	// Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: "../deployment/",
	})

	// Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// awsRegion := "us-east-1"

	vpc := terraform.Output(t, terraformOptions, "test_aws_vpc")
	fmt.Printf("type of a is %v\n", reflect.TypeOf(vpc))
	assert.Equal(t, "string", reflect.TypeOf(vpc))
	public_subnets := terraform.Output(t, terraformOptions, "public_subnet")
	private_subnets := terraform.Output(t, terraformOptions, "private_subnet")
	fmt.Println(public_subnets)
	fmt.Println(private_subnets)
	require.Equal(t, 51, len(public_subnets))
	require.Equal(t, 51, len(private_subnets))
	// Run `terraform output` to get the values of output variables and check they have the expected values.
	//output := terraform.Output(t, terraformOptions, "hello_world")
	//assert.Equal(t, "Hello, World!", output)
}

