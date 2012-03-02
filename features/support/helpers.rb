def text_to_html_class(selector_text)
  ".#{selector_text.downcase.split.join("-")}"
end
