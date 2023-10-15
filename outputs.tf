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
  value = aws_sqs_queue.dlq.name
}

output "sqs_dlq_arn" {
  value = aws_sqs_queue.dlq.arn
}

output "sqs_dlq_id" {
  value = aws_sqs_queue.dlq.id
}

output "sqs_dlq_url" {
  value = aws_sqs_queue.dlq.url
}
