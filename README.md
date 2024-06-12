<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.

Basic usage of this module is as follows:

```hcl
module "example" {
  	 source  = "<module-path>"
  
	 # Required variables
  	 name  = 
  
	 # Optional variables
  	 create_dlq  = true
  	 dlq_content_based_deduplication  = false
  	 dlq_policy  = ""
  	 dlq_retention_time  = 1209600
  	 dlq_visibility_timeout  = 600
  	 fifo  = false
  	 main_content_based_deduplication  = false
  	 main_delay_time  = 0
  	 main_policy  = ""
  	 main_retention_time  = 1209600
  	 main_visibility_timeout  = 600
  	 max_redrive  = 3
  	 name_dlq  = ""
  	 name_main  = ""
  	 prefix  = ""
  	 suffix_dlq  = "-dlq"
  	 suffix_main  = "-main"
  	 tags  = {}
}
```

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_dlq"></a> [create\_dlq](#input\_create\_dlq) | True if we want to auto create DLQ with SQS queue | `bool` | `true` | no |
| <a name="input_dlq_content_based_deduplication"></a> [dlq\_content\_based\_deduplication](#input\_dlq\_content\_based\_deduplication) | Turn on content based deduplication | `bool` | `false` | no |
| <a name="input_dlq_policy"></a> [dlq\_policy](#input\_dlq\_policy) | Optional queue policy to attach to DLQ | `string` | `""` | no |
| <a name="input_dlq_retention_time"></a> [dlq\_retention\_time](#input\_dlq\_retention\_time) | Message retention time in the dead letter queue (in seconds) | `number` | `1209600` | no |
| <a name="input_dlq_visibility_timeout"></a> [dlq\_visibility\_timeout](#input\_dlq\_visibility\_timeout) | Message visibility timeout in the dead letter queue (in seconds) | `number` | `600` | no |
| <a name="input_fifo"></a> [fifo](#input\_fifo) | Set queue type to FIFO | `bool` | `false` | no |
| <a name="input_main_content_based_deduplication"></a> [main\_content\_based\_deduplication](#input\_main\_content\_based\_deduplication) | Turn on content based deduplication | `bool` | `false` | no |
| <a name="input_main_delay_time"></a> [main\_delay\_time](#input\_main\_delay\_time) | Message delay for the main queue (in seconds) | `number` | `0` | no |
| <a name="input_main_policy"></a> [main\_policy](#input\_main\_policy) | Optional queues policy to attach to main queue | `string` | `""` | no |
| <a name="input_main_retention_time"></a> [main\_retention\_time](#input\_main\_retention\_time) | Message retention time in the main queue (in seconds) | `number` | `1209600` | no |
| <a name="input_main_visibility_timeout"></a> [main\_visibility\_timeout](#input\_main\_visibility\_timeout) | Message visibility timeout in the main queue (in seconds) | `number` | `600` | no |
| <a name="input_max_redrive"></a> [max\_redrive](#input\_max\_redrive) | Maximum count of dead letter queue redrives | `number` | `3` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the SQS queues | `string` | n/a | yes |
| <a name="input_name_dlq"></a> [name\_dlq](#input\_name\_dlq) | Custom name for the dead letter queue (non-automated naming) | `string` | `""` | no |
| <a name="input_name_main"></a> [name\_main](#input\_name\_main) | Custom name for the main queue (non-automated naming) | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for both of the queues | `string` | `""` | no |
| <a name="input_suffix_dlq"></a> [suffix\_dlq](#input\_suffix\_dlq) | Suffix for the DLQ | `string` | `"-dlq"` | no |
| <a name="input_suffix_main"></a> [suffix\_main](#input\_suffix\_main) | Suffix for the main queue | `string` | `"-main"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS tags to apply to the queues | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_dlq_arn"></a> [sqs\_dlq\_arn](#output\_sqs\_dlq\_arn) | n/a |
| <a name="output_sqs_dlq_id"></a> [sqs\_dlq\_id](#output\_sqs\_dlq\_id) | n/a |
| <a name="output_sqs_dlq_name"></a> [sqs\_dlq\_name](#output\_sqs\_dlq\_name) | n/a |
| <a name="output_sqs_dlq_url"></a> [sqs\_dlq\_url](#output\_sqs\_dlq\_url) | n/a |
| <a name="output_sqs_main_arn"></a> [sqs\_main\_arn](#output\_sqs\_main\_arn) | n/a |
| <a name="output_sqs_main_id"></a> [sqs\_main\_id](#output\_sqs\_main\_id) | n/a |
| <a name="output_sqs_main_name"></a> [sqs\_main\_name](#output\_sqs\_main\_name) | n/a |
| <a name="output_sqs_main_url"></a> [sqs\_main\_url](#output\_sqs\_main\_url) | n/a |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->
