class ParametersParser

  def initialize args
    @args = args
  end

  def parse
    hash = {}
    @args.each do |arg|
      if arg.upcase == "HTML"
        hash[:html] = true
      else
        hash[:directory] = arg unless hash[:directory]
      end
    end
    hash
  end
end
