# Useful Terraform commands

## Debug
```
export TF_LOG_PATH=/tmp/crash.log
export TF_LOG=TRACE
```

## Show Output in readable format
`terraform fmt`  

## Validate terraform configuration files
`terraform validate`  

## Mark resource as tainted
`terraform taint myec2`

## Create graph of resources
```
terraform graph > graph.dot
cat graph.dot | dot -Tsvg -o graph.svg
```

## Plan output to file
```
terraform plan -out=demopath
terraform apply demopath
```

## Output variable values
`terraform output my_variable`  


## Dealing with large infraestructure
`terraform plan -refresh=false`  
`terraform plan -refresh=false -target=aws_security_group.allow_ssh_conn`  

## Auto approval of changes
`terraform apply -auto-approve`  
`terraform destroy -auto-approve`  

## Workspace management
`terraform workspace new my_workspace`  
`terraform workspace select my_workspace`  
`terraform workspace delete my_workspace`  
`terraform workspace list`  
`terraform workspace show`  

## Gitignore
```
.terraform
*.tfvars
terraform.tfstat
```

## State management
`terraform state list`  
`terraform state pull`  
`terraform state push`  
`terraform state mv <from> <to>`  
`terraform state rm <key>`  
`terraform state show <key>`  

## Import manually created resource
`terraform import aws_instance.my_instance i-instance-id`  

