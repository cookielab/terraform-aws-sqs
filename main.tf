data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "default" {
  statement {
    effect    = "Allow"
    resources = [aws_sqs_queue.dlq.arn]
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ListQueueTags",
      "sqs:ReceiveMessage",
      "sqs:SendMessage",
    ]
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
  }
}

resource "aws_sqs_queue" "dlq" {
  name                        = local.dlq_sqs_name
  fifo_queue                  = var.fifo
  content_based_deduplication = false
  message_retention_seconds   = var.dlq_retention_time
  visibility_timeout_seconds  = var.dlq_visibility_timeout
  policy                      = local.dlq_policy

  tags = var.tags
}

resource "aws_sqs_queue" "main" {
  name                        = local.main_sqs_name
  fifo_queue                  = var.fifo
  content_based_deduplication = false
  message_retention_seconds   = var.main_retention_time
  visibility_timeout_seconds  = var.main_visibility_timeout
  delay_seconds               = var.main_delay_time
  policy                      = local.main_policy

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn,
    maxReceiveCount     = var.max_redrive
  })

  tags = var.tags
}

