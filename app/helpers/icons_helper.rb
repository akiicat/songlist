module IconsHelper
  def hint_tag(aria = nil, hint = nil, options = {}, &block)
    options["data-aria-label"] = aria if aria
    options["data-tipsy-hint"] = hint if hint
    content_tag :span, options do
      block.call
    end
  end
  def copy_tag(data = nil, options = {}, &block)
    if data
      options["data-clippy"] = data
      options["data-clippy-duplicate"] = false
    end
    content_tag :span, options do
      block.call
    end
  end
end
