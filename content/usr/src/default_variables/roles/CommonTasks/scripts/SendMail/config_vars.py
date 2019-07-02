smtp_server = 'myownsmtp.email.com.br'
smtp_from = 'myownemail@email.com.br'

message_header = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head>"
message_header += "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">"
message_header += "</head> <body>"
message_header += "++++++++++++++++++++++++++++++++++++++++++++++<br>"
message_header += "+++ Esta mensagem e enviada automaticamente  +++<br>"
message_header += "++++++++++++++++++++++++++++++++++++++++++++++<br>"

message_footer = "<br> <br> <br> Atenciosamente<br>"
message_footer += "Sistema de automacao <br>"
message_footer += "<body></html>"

failcolor='#ff3300'
okcolor='#ebfafa'
partialcolor='#ffb84d'
nonecolor='#ffff4d'

rules_validate_color = []
rules_validate_color.append([ 'Status', '^Failed$', failcolor ])
rules_validate_color.append([ 'Status', '^OK$', okcolor ])
rules_validate_color.append([ 'Status', '^Parcial$', partialcolor ])
rules_validate_color.append([ 'Status', '^None$', nonecolor ])
rules_validate_color.append([ 'Status', '^Failed$', nonecolor ])
