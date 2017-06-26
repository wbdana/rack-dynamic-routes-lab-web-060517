class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/item/)
      item = req.path.split("/items/").last
      item_obj = Item.all.select{|i| i.name == item}.first
      if item_obj
        resp.write "#{item_obj.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
      #   resp.write "#{item.price}"
      # else
      #   resp.status = 400
      #   resp.write "Item not found"
      # end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
