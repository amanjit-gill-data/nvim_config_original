-- safely import 
local sig_status, sig_help = pcall(require, "lsp_signature")
if not sig_status then
  return
end

sig_help.setup()
