#' ##
#' #' @export
#' ##
#' xlsx.to.s3csv <- function(file, name, bucket, folder) {
#'   # aws.signature::use_credentials("webENA")
#'   readFile = openxlsx::read.xlsx(file)
#'   tmp <- tempfile(fileext = ".csv")
#'   aws.signature::locate_credentials(key = "AKIAJ5IBR7IRVAYQX5MQ", secret = "1IDb2Osnovnez3QneoAj8HaZ1s2")
#'   on.exit(unlink(tmp))
#'   utils::write.csv(readFile, file = tmp, fileEncoding = "UTF-8")
#'   res = rENA:::put.s3.object(file = tmp, object = paste0("/",name), bucket = bucket) #paste0(bucket,"/",folder))
#'
#'   return(list(
#'     status = 'success',
#'     location = paste0("https://",bucket,".us-west-2.amazonaws.com/",name),
#'     raw = list(
#'       Bucket = bucket,
#'       ETag = attr(res, "etag"),
#'       Key = name,
#'       Location = paste0("https://",bucket,".us-west-2.amazonaws.com/",name),
#'       VersionId = attr(res, "x-amz-version-id"),
#'       key = name
#'     ),
#'     name = name
#'   ))
#' }
