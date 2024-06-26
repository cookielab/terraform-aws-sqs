variable "name" {
  type        = string
  description = "Name of the SQS queues"
}

variable "prefix" {
  type        = string
  default     = ""
  description = "Prefix for both of the queues"
}

variable "suffix_main" {
  type        = string
  default     = "-main"
  description = "Suffix for the main queue"
}

variable "suffix_dlq" {
  type        = string
  default     = "-dlq"
  description = "Suffix for the DLQ"
}

variable "name_main" {
  type        = string
  default     = ""
  description = "Custom name for the main queue (non-automated naming)"
}

variable "name_dlq" {
  type        = string
  default     = ""
  description = "Custom name for the dead letter queue (non-automated naming)"
}

variable "fifo" {
  type        = bool
  default     = false
  description = "Set queue type to FIFO"
}

variable "main_content_based_deduplication" {
  type        = bool
  default     = false
  description = "Turn on content based deduplication"
}

variable "dlq_content_based_deduplication" {
  type        = bool
  default     = false
  description = "Turn on content based deduplication"
}

variable "main_policy" {
  type        = string
  default     = ""
  description = "Optional queues policy to attach to main queue"
}

variable "main_retention_time" {
  type        = number
  default     = 1209600
  description = "Message retention time in the main queue (in seconds)"
}

variable "main_visibility_timeout" {
  type        = number
  default     = 600
  description = "Message visibility timeout in the main queue (in seconds)"
}

variable "main_delay_time" {
  type        = number
  default     = 0
  description = "Message delay for the main queue (in seconds)"
}

variable "dlq_policy" {
  type        = string
  default     = ""
  description = "Optional queue policy to attach to DLQ"
}

variable "dlq_retention_time" {
  type        = number
  default     = 1209600
  description = "Message retention time in the dead letter queue (in seconds)"
}

variable "dlq_visibility_timeout" {
  type        = number
  default     = 600
  description = "Message visibility timeout in the dead letter queue (in seconds)"
}

variable "max_redrive" {
  type        = number
  default     = 3
  description = "Maximum count of dead letter queue redrives"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "AWS tags to apply to the queues"
}

variable "create_dlq" {
  type        = bool
  default     = true
  description = "True if we want to auto create DLQ with SQS queue"
}
