# TODO: make this happen for other themes
link_filename = File.join Rails.root, "public", File.basename(File.dirname(__FILE__))
FileUtils.ln_s(File.join(File.dirname(__FILE__), "public"), link_filename) unless File.exists?(link_filename)