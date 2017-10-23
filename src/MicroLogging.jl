__precompile__()

module MicroLogging

using Compat

export
    # From .Logging
    @debug, @info, @warn, @error, @logmsg,
    with_logger, current_logger, global_logger,
    disable_logging, configure_logging,
    AbstractLogger,
    handle_message, shouldlog, min_enabled_level,
    SimpleLogger,
    # From MicroLogging
    InteractiveLogger

# core.jl includes the code which will hopefully go into Base in 0.7
include("core.jl")
using .Logging
import .Logging:
    LogLevel, BelowMinLevel, Debug, Info, Warn, Error, AboveMaxLevel,
    disable_logging, configure_logging,
    handle_message, shouldlog, min_enabled_level,
    parse_level


include("loggers.jl")

function __init__()
    global_logger(InteractiveLogger(STDERR))
end

end
