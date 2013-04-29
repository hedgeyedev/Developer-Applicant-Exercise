TOP ||= Pathname.new(__FILE__).dirname.expand_path.join('..')


project_path = TOP


sass_dir = File.join 'views', 'stylesheets'
images_dir = File.join 'public', 'images'
css_dir = File.join 'public', 'css'
javascripts_dir = File.join 'public', 'js'
fonts_dir = File.join 'public', 'fonts'


http_path = "/"
http_images_path = "/images"
http_stylesheets_path = "/css"
http_javascripts_path = '/js'
http_fonts_path = '/fonts'


preferred_syntax = :sass
relative_assets = true
line_comments = true
output_style = :expanded
