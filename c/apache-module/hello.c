#include "httpd.h"
#include "http_config.h"
#include "http_protocol.h"
#include "ap_config.h"

/* hello world handler */
static int hello_handler(request_rec *req) {
  if (!req->handler || strcmp(req->handler, "hello"))
    return DECLINED;

  //req->content_type = "text/html;charset=UTF-8";
  ap_set_content_type(req, "text/html");

  //if (!req->header_only)
  //  ap_rputs("<h1>Hello, World! (from within a c file)</h1>", req);
  ap_rprintf(req, "<h1>Hello, World! (from within a c file)</h1>");

  // apr_table_set(req->headers_out, "X-Content-Type-Options", "nosniff");

  return OK;
}

/* register hook */
static void hello_register_hooks(apr_pool_t *p) {
  ap_hook_handler(hello_handler, NULL, NULL, APR_HOOK_MIDDLE);
}

/* dispatcher for API hooks */
module AP_MODULE_DECLARE_DATA hello_module = {
  STANDARD20_MODULE_STUFF, 
  NULL, NULL, NULL, NULL, NULL,
  hello_register_hooks
};

