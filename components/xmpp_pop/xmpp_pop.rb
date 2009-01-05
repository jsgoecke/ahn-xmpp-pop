initialization do
  require 'xmpp4r-simple'
  COMPONENTS.xmpp_pop[:gtalk] = Jabber::Simple.new(COMPONENTS.xmpp_pop[:gmail_credentials][:uname], 
                                                   COMPONENTS.xmpp_pop[:gmail_credentials][:passwd])
  Events.register_callback("/shutdown") { COMPONENTS.xmpp_pop[:gtalk].disconnect }
end

methods_for :dialplan do
  def send_im
    COMPONENTS.xmpp_pop[:gtalk].deliver(COMPONENTS.xmpp_pop[:gmail_user],
                                        "#{calleridname} is calling...")
    ahn_log.send_im.debug "Sent an IM when #{calleridname} called..."
  end
end