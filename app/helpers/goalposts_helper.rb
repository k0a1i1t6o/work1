module GoalpostsHelper
    # def  time_left(goalpost)
    #     from = goalpost.from.delete("-").to_i
    #     to = goalpost.to.delete("-").to_i
    #     today = Date.today.strftime("%Y%m%d").to_i
    #     check = to-today
    #     if today >= from
    #       if check <= 0
    #         @time_left = "終了しています"
    #       else
    #         @time_left = "残り#{to-today}日"
    #       end
    #     else
    #       @time_left = "#{from - today}日後開始" 
    #     end
    # end

    def  time_left(goalpost)
      from = Date.parse(goalpost.from)
      to = Date.parse(goalpost.to)
      today = Date.today
      check = (to-today).to_i
      if today.strftime("%Y%m%d") >= from.strftime("%Y%m%d")
        if check <= 0
          @time_left = "終了しています"
        else
          @time_left = "残り#{(to-today).to_i}日"
        end
      else
        @time_left = "#{(from - today).to_i}日後開始" 
      end
  end
end
