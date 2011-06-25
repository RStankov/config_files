class CssRuleExpander
  def initialize(lines)
    @lines = lines
  end

  def collapse(start_on)
    rule_start_on = find_rule_start(start_on)
    rule_end_on   = find_rule_end(start_on)

    return self if rule_start_on.nil? or rule_end_on.nil? or rule_end_on == rule_start_on

    css = Rule.new(@lines.slice!(rule_start_on..rule_end_on).to_s)
    @lines.insert(rule_start_on, css.collapse) if css.valid?

    self
  end

  def expand(start_on)
    css = Rule.new(@lines[start_on])
    @lines[start_on] = css.expand if css.valid?
    self
  end

  def to_s
    @lines.to_s
  end

  private

  def find_rule_start(position)
    while(position >= 0 && @lines[position] && !@lines[position].include?('{'))
      position -= 1
    end
    position >= 0 && @lines[position] ? position : nil
  end

  def find_rule_end(position)
    while(position >= 0 && @lines[position] && !@lines[position].include?('}'))
      position += 1
    end
    position >= 0 && @lines[position] ? position : nil
  end

  class Rule
    EXPAND_RULE = /([\t ]*)(.*)\{(.*)(\}\n*)/m

    def initialize(selection, options = {})
      @tab  = options[:tab] || '  '

      if selection and match = selection.match(EXPAND_RULE)
        @selection_tabs = match[1]
        @selector = match[2].strip
        @rules = match[3].split(';').map(&:strip).reject(&:empty?)
        @closing_bracket = match[4]
      end
    end

    def valid?
      !!(@selection_tabs && @selector && @rules)
    end

    def expand
      output  = "#{@selection_tabs}#{@selector} {\n"
      output += @rules.map { |rule| "#{@selection_tabs}#{@tab}#{rule}" }.join(";\n") + ";\n"
      output += "#{@selection_tabs}#{@closing_bracket}"
      output
    end

    def collapse
      output  = "#{@selection_tabs}#{@selector} { "
      output += @rules.join("; ") + "; "
      output += @closing_bracket
      output
    end
  end
end