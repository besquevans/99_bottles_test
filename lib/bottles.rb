class Bottles

  def verse(num)
    @num = num

    %Q(#{first_senteance} #{bottle_num} #{bottle_name} of milk.
      \n
      #{third_sentence}#{bottle_num(num - 1)} #{bottle_name(num - 1)} of milk on the wall.
      \n
    ).gsub(/\n +/, '')
  end

  def verses(*nums)
    res = []

    nums[0].downto(nums[-1]).each do |num|
      res << verse(num)
    end

    res.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def bottle_name(num = nil)
    num ||= @num
    num == 1 ? "bottle" : "bottles"
  end

  def bottle_num(num = nil)
    num ||= @num
    if num == 0
      "no more"
    elsif num < 0
      99
    else
      num
    end
  end

  def thing
    @num == 1 ? "it" : "one"
  end

  def first_senteance
    "#{bottle_num} #{bottle_name} of milk on the wall,".capitalize
  end

  def third_sentence
    if @num == 0
      "Go to the store and buy some more, "
    else
      "Take #{thing} down and pass it around, "
    end
  end
end
