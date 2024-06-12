moved {
  from = aws_iam_policy_document.dlq
  to   = aws_iam_policy_document.dlq[0]
}

moved {
  from = aws_sqs_queue.dlq
  to   = aws_sqs_queue.dlq[0]
}

moved {
  from = aws_sqs_queue_policy.dlq
  to   = aws_sqs_queue_policy.dlq[0]
}
