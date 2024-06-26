locals {
  prefix          = var.prefix != "" ? (endswith(var.prefix, "-") ? var.prefix : "${var.prefix}-") : ""
  suffix_main     = var.fifo ? "${var.suffix_main}.fifo" : var.suffix_main
  suffix_dlq      = var.fifo ? "${var.suffix_dlq}.fifo" : var.suffix_dlq
  main_sqs_name   = var.name_main != "" ? var.name_main : "${local.prefix}${var.name}${local.suffix_main}"
  main_sqs_policy = var.main_policy
  dlq_sqs_name    = var.name_dlq != "" ? var.name_dlq : "${local.prefix}${var.name}${local.suffix_dlq}"
  dlq_sqs_policy  = var.create_dlq ? (var.dlq_policy != "" ? var.dlq_policy : data.aws_iam_policy_document.dlq[0].json) : null
  dlq_arn         = var.create_dlq ? aws_sqs_queue.dlq[0].arn : (length(data.aws_sqs_queue.custom_dlq) > 0 ? data.aws_sqs_queue.custom_dlq[0].arn : null)
}

data "aws_caller_identity" "current" {}

# DLQ
data "aws_iam_policy_document" "dlq" {
  count = var.create_dlq ? 1 : 0
  statement {
    effect    = "Allow"
    resources = [aws_sqs_queue.dlq[0].arn]
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
  count                       = var.create_dlq ? 1 : 0
  name                        = local.dlq_sqs_name
  fifo_queue                  = var.fifo
  content_based_deduplication = var.dlq_content_based_deduplication
  message_retention_seconds   = var.dlq_retention_time
  visibility_timeout_seconds  = var.dlq_visibility_timeout

  tags = var.tags
}

resource "aws_sqs_queue_policy" "dlq" {
  count     = var.create_dlq ? 1 : 0
  queue_url = aws_sqs_queue.dlq[0].id
  policy    = local.dlq_sqs_policy
}

# Main
resource "aws_sqs_queue" "main" {
  name                        = local.main_sqs_name
  fifo_queue                  = var.fifo
  content_based_deduplication = var.main_content_based_deduplication
  message_retention_seconds   = var.main_retention_time
  visibility_timeout_seconds  = var.main_visibility_timeout
  delay_seconds               = var.main_delay_time
  policy                      = local.main_sqs_policy

  redrive_policy = local.dlq_arn != null ? jsonencode({
    deadLetterTargetArn = local.dlq_arn
    maxReceiveCount     = var.max_redrive
  }) : null
  tags = var.tags
}
