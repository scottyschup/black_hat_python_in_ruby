# Seitz - p13 Replacing Netcat
# WIP

require "socket"

class RbNetCat
  def initialize(args:)
    # Default options
    @listen = args[:listen] || false
    @command = args[:command] || false
    @upload = args[:upload] || false
    @execute = args[:execute] || ""
    @target = args[:target] || ""
    @upload_destination = args[:upload_destination] || ""
    @port = args[:port] || 0
  end

  def usage
    $stdout.puts "TODO: USAGE"
  end

  def main
    $stdout.puts "TODO: MAIN"
  end
end

rbnc = RbNetCat.new args: {}
rbnc.usage and exit if ARGV.empty?
rbnc.main
