module IconsHelper
  def hint_tag(name = nil, aria = nil, hint = nil, options = nil, &block)
    options, hint, aria, name = hint, aria, name, block if block_given?
    options ||= {}

    options["data-aria-label"] = aria if aria
    options["data-tipsy-hint"] = hint if hint

    content_tag(:span, name, options, &block)
  end

  def copy_tag(name = nil, data = nil, options = nil, &block)
    options, data, name = data, name, block if block_given?
    options ||= {}

    options["data-clippy"], options["data-clippy-duplicate"] = data, false if data

    content_tag(:span, name, options, &block)
  end
end
