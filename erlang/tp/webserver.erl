-module(webserver).
-export([start/0, service/3]).

%
% load the script into the `erl` environment
%
%     erl
%     c(webserver).
%
%
% start the webserver using erlang's TCP/IP module
%
%     inet:start().
%
%
% start our hello-world webservice
%
%     webserver:start().
%
%
% access the response message at this address:
%
%     http://localhost:8666/erl/webserver:service
%
%
% it's going to (unsafely) show the listing for file in your /tmp directory at:
%
%     http://localhost:8666/
%
% that on Linux and BSDs. you'll probably just get a nasty error on Windows. 
%


start() ->
  inets:start(httpd, [
                      {modules, [
                                 mod_alias,
                                 mod_auth,
                                 mod_esi,
                                 mod_actions,
                                 mod_cgi,
                                 mod_dir,
                                 mod_get,
                                 mod_head,
                                 mod_log,
                                 mod_disk_log ]},
                      
                      {port, 8666},
                      {server_name, "earlnghttp"},
                      {server_root,     "/tmp" }, % probably very
                      {document_root,   "/tmp" }, % unsafe
                      {erl_script_alias, 
                       { "/erl", [webserver]}},
                      
                      {error_log,     "error.log"},
                      {security_log,  "security.log"},
                      {transfer_log,  "transfer.log"},

                      {mime_types, [{"html", "text/html"}]}]).

service(SessionID, _Env, _Input) ->
  mod_esi:deliver(SessionID, [ 
                              "Content-Type: text/html\r\n\r\n",
                              "<h1>Hello, World!</h1><p>from Erlang.</p>"]).





