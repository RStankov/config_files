require "css_rule_expander"
require "test/unit"

class CssRuleExpanderText < Test::Unit::TestCase
  def test_basic_expand
    expanded_css = [
      "    #designer-manual-download #designer-manual-download-button {\n",
      "      @include red-button;\n",
      "      display: inline-block;\n",
      "      margin: 0 0 30px 50px;\n",
      "    }"
    ].join("")
    collapsed_css  = "    #designer-manual-download #designer-manual-download-button { @include red-button; display: inline-block; margin: 0 0 30px 50px; }"

    assert_equal expanded_css, CssRuleExpander.new([collapsed_css]).expand(0).to_s
  end

  def test_invalid_expand
    css_lines = [
      "    #designer-manual-download #designer-manual-download-button {\n",
      "      @include red-button;\n",
      "      display: inline-block;\n",
      "      margin: 0 0 30px 50px;\n",
      "    }"
    ]
    css_text = css_lines.join("")

    assert_equal css_text, CssRuleExpander.new(css_lines).expand(0).to_s
    assert_equal css_text, CssRuleExpander.new(css_lines).expand(1).to_s
    assert_equal css_text, CssRuleExpander.new(css_lines).expand(2).to_s
    assert_equal css_text, CssRuleExpander.new(css_lines).expand(3).to_s
  end

  def test_basic_collapse
    expanded_css = [
      "    #designer-manual-download #designer-manual-download-button {\n",
      "      @include red-button;\n",
      "      display: inline-block;\n",
      "      margin: 0 0 30px 50px;\n",
      "    }"
    ]
    collapsed_css  = "    #designer-manual-download #designer-manual-download-button { @include red-button; display: inline-block; margin: 0 0 30px 50px; }"

    assert_equal collapsed_css, CssRuleExpander.new(expanded_css).collapse(2).to_s
  end

  def test_invalid_collapse
    css_lines = [
      "  #designer-manual-download > div { @include white-box; }\n",
      "  #designer-manual-download h2 { width: 400px; }\n",
      "  #designer-manual-download .tooltip { margin-right: 150px; }\n"
    ]

    css_text = css_lines.to_s

    assert_equal css_text, CssRuleExpander.new(css_lines).collapse(-1).to_s
    assert_equal css_text, CssRuleExpander.new(css_lines).collapse(0).to_s
    assert_equal css_text, CssRuleExpander.new(css_lines).collapse(1).to_s
    assert_equal css_text, CssRuleExpander.new(css_lines).collapse(2).to_s
  end

  def test_multiple_css_rules_and_operations
    expand_css_lines = [
      "    #designer-manual-download > div { @include white-box; }\n",
      "    #designer-manual-download h2 { width: 400px; }\n",
      "    #designer-manual-download .tooltip { margin-right: 150px; }\n",
      "    #designer-manual-download #designer-manual-download-button {\n",
      "      @include red-button;\n",
      "      display: inline-block;\n",
      "      margin: 0 0 30px 50px;\n",
      "    }\n",
      "    #designer-manual-download .tooltip-content { width: 170px; }\n",
      "    #designer-manual-download #designer-manual-thumbnail { margin: 20px 0; }\n",
    ]
    expand_css_text = expand_css_lines.to_s

    collapse_css_lines = [
      "    #designer-manual-download > div { @include white-box; }\n",
      "    #designer-manual-download h2 { width: 400px; }\n",
      "    #designer-manual-download .tooltip { margin-right: 150px; }\n",
      "    #designer-manual-download #designer-manual-download-button { @include red-button; display: inline-block; margin: 0 0 30px 50px; }\n",
      "    #designer-manual-download .tooltip-content { width: 170px; }\n",
      "    #designer-manual-download #designer-manual-thumbnail { margin: 20px 0; }\n",
    ]
    collapse_css_text = collapse_css_lines.to_s

    css = CssRuleExpander.new(expand_css_lines)

    assert_equal collapse_css_text, css.collapse(3).to_s
    assert_equal expand_css_text, css.expand(3).to_s
    assert_equal expand_css_text, css.collapse(10).to_s
  end
end

