data "aws_sqs_queue" "custom_dlq" {
  count = (!var.create_dlq && var.name_dlq != "") ? 1 : 0
  name  = var.name_dlq
}
