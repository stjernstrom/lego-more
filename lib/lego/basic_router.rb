module Lego
  module BasicRouter

    def self.register(lego)
      lego.add_plugin :router, Matcher
      lego.add_plugin :controller, Routes
    end

    module Routes
      def get(path, &block)
        add_route(:get, {:path => path, :action_block => block})
      end

      def put(path, &block)
        add_route(:put, {:path => path, :action_block => block})
      end

      def post(path, &block)
        add_route(:post, {:path => path, :action_block => block})
      end

      def delete(path, &block)
        add_route(:delete, {:path => path, :action_block => block})
      end
    end

    module Matcher
      def self.match_route(route, env)
        req = Rack::Request.new(env)
        match_data = req.params ? { :instance_vars => req.params } : {}
        (route[:path] == env['PATH_INFO']) ? [env, match_data] : false
      end
    end
  end
end

