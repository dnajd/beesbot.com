
# extensions
require 'lib/extensions/permalink.rb'
activate :permalink
activate :syntax

# dev
configure :development do
  activate :livereload
end

# helpers
helpers do
  def blog_posts
    posts = sitemap.resources.select {|p| p.source_file.include? '/posts'}
    return posts.sort_by { |page| page.data[:date] }.reverse
  end
end

# build
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
