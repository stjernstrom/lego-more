module Lego

  file_path = File.expand_path( File.dirname(__FILE__) )
  $LOAD_PATH.unshift( file_path ) unless $LOAD_PATH.include?( file_path )

  autoload :BasicRouter, "lego/basic_router.rb"

end
