# log.rb

require 'logger'

log = Logger.new('logfile.log', 'daily')
value = 25.5
log.info('info line')
log.warn('warn statement')
log.debug("Value is #{value} - debug level")
log.fatal("Sorry fatal'd")
log.unknown('any level')
log.debug{ "this is block on log statements #{value}" }
log.close

