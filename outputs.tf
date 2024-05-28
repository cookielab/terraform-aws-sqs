output "sqs_main_name" {
  value = aws_sqs_queue.main.name
}

output "sqs_main_arn" {
  value = aws_sqs_queue.main.arn
}

output "sqs_main_id" {
  value = aws_sqs_queue.main.id
}

output "sqs_main_url" {
  value = aws_sqs_queue.main.url
}

output "sqs_dlq_name" {
  value = var.create_dlq ? aws_sqs_queue.dlq[0].name : null
}

output "sqs_dlq_arn" {
  value = var.create_dlq ? aws_sqs_queue.dlq[0].arn : null
}

output "sqs_dlq_id" {
  value = var.create_dlq ? aws_sqs_queue.dlq[0].id : null
}

output "sqs_dlq_url" {
  value = var.create_dlq ? aws_sqs_queue.dlq[0].url : null
}
