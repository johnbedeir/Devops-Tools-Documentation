# /bin/bash
# WARNING: This script to cleanup all terraform files from previous build, use it only after you destroy all the resources so you don't lose the state that keep track of the created resources


rm -rf terraform.tfstate
rm -rf terraform.tfstate.*
rm -rf .terraform 
rm -rf .terraform.*
rm -rf mykey.pem

